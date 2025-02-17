import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/product/repository/product.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';

class GetProductsByTitleUseCase implements Usecase<Either,String> {

  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductRepository>().getProductsByTitle(params!);
  }

}