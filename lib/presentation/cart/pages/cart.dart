
import 'package:ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart_product_display_cubit.dart';
import 'package:ecommerce_app/presentation/cart/bloc/cart_product_display_state.dart';
import 'package:ecommerce_app/presentation/cart/widgets/checkout.dart';
import 'package:ecommerce_app/presentation/cart/widgets/product_ordered_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('cart'),),
      body: BlocProvider(
        create: (context) => CartProductsDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit,CartProductsDisplayState>(
          builder: (context, state) {
            if (state is CartProductsLoading){
              return const Center(
                child: CircularProgressIndicator()
              );
            }
            if (state is CartProductsLoaded) {
              return state.products.isEmpty ? Center(child: _cartIsEmpty()) : Stack(
                children: [
                  _products(state.products),
                   Align(
                    alignment: Alignment.bottomCenter,
                    child: Checkout(products: state.products,)
                  )
                ],
              );
            }
            if (state is LoadCartProductsFailure) {
              return Center(
                child: Text(
                  state.errorMessage
                ),
              );
            }
            return Container();
          },
        ) ,
      ),
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ProductOrderedCard(
          productOrderedEntity: products[index] ,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10,),
      itemCount: products.length
    );
  }

  Widget _cartIsEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/cartlogo.jpg'),
        const SizedBox(height: 20,),
        const Text(
          "Cart is empty",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),
        )
      ],
    );
  }
}