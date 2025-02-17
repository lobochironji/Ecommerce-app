import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/order/repositoty/order.dart';
import 'package:ecommerce_app/service_locator.dart';

class GetCartProductsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return sl<OrderRepository>().getCartProducts();
  }
}
