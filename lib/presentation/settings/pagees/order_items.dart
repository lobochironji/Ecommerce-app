import 'package:ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:ecommerce_app/presentation/settings/widgets/product_order_card.dart';
import 'package:flutter/material.dart';


class OrderItemsPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const OrderItemsPage({
    required this.products,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('order item'),),
      body: _products()
    );
  }

  Widget _products() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return OrderItemCard(
          productOrderedEntity: products[index] ,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10,),
      itemCount: products.length
    );
  }
}