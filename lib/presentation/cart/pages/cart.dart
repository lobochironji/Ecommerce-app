import 'package:ecommerce_app/presentation/cart/pages/order_placed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductOrderedEntity {
  final String id;
  final String name;
  final double price;
  final int quantity;

  ProductOrderedEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductOrderedEntity> products = [
      ProductOrderedEntity(
          id: '1', name: 'Product 1', price: 20.0, quantity: 1),
      ProductOrderedEntity(
          id: '2', name: 'Product 2', price: 15.0, quantity: 2),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Cart', style: GoogleFonts.outfit())),
      body: products.isEmpty
          ? Center(child: _cartIsEmpty())
          : Stack(
              children: [
                _products(products),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Checkout(products: products),
                ),
              ],
            ),
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return ProductOrderedCard(
          productOrderedEntity: products[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: products.length,
    );
  }

  Widget _cartIsEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/cartlogo.jpg'),
        const SizedBox(height: 20),
        const Text(
          "Cart is empty",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class ProductOrderedCard extends StatelessWidget {
  final ProductOrderedEntity productOrderedEntity;

  const ProductOrderedCard({super.key, required this.productOrderedEntity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(productOrderedEntity.name,style: GoogleFonts.outfit(),),
        subtitle: Text(
          'Price: \$${productOrderedEntity.price}  Quantity: ${productOrderedEntity.quantity}',
          style: GoogleFonts.outfit(),
        ),
      ),
    );
  }
}

class Checkout extends StatelessWidget {
  final List<ProductOrderedEntity> products;

  const Checkout({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    double total = products.fold(
        0.0, (sum, product) => sum + product.price * product.quantity);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return OrderPlacedPage();
            },
          ));
        },
        child: Text('Checkout - Total: \$${total.toStringAsFixed(2)}'),
      ),
    );
  }
}
