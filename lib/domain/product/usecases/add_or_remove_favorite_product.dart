import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/product/entity/product.dart';
import 'package:ecommerce_app/domain/product/repository/product.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';

class AddOrRemoveFavoriteProductUseCase implements Usecase<Either,ProductEntity> {

  @override
  Future<Either> call({ProductEntity? params}) async {
    return await sl<ProductRepository>().addOrRemoveFavoriteProduct(params!);
  }

}