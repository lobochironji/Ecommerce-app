import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/order/models/order_registration_req.dart';
import 'package:ecommerce_app/domain/order/repositoty/order.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';

class OrderRegistrationUseCase
    implements Usecase<Either, OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq? params}) async {
    return sl<OrderRepository>().orderRegistration(params!);
  }
}
