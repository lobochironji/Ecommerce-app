import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/order/repositoty/order.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';

class RemoveCartProductUseCase implements Usecase<Either,String> {
  @override
  Future<Either> call({String ? params}) async {
    return sl<OrderRepository>().removeCartProduct(params!);
  }

}