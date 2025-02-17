import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/product/repository/product.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';

class GetNewInUseCase implements Usecase<Either,dynamic> {

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductRepository>().getNewIn();
  }

}