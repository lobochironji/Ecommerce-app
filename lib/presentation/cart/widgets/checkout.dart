import 'package:ecommerce_app/common/helper/cart/cart.dart';
import 'package:ecommerce_app/domain/order/entity/product_ordered.dart';
import 'package:ecommerce_app/presentation/cart/pages/checkout.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const Checkout({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height / 3.5,
      color: const Color.fromARGB(255, 23, 23, 23),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$${CartHelper.calculateCartSubtotal(products).toString()}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Cost',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$8',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$0.0',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$${CartHelper.calculateCartSubtotal(products) + 8}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CheckOutPage(
                    products: products,
                  );
                },
              ));
            },
            child: Text('CheckOut'),
          )
        ],
      ),
    );
  }
}
