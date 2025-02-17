import 'package:ecommerce_app/domain/product/repository/product.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';

class IsFavoriteUseCase implements Usecase<bool,String> {

  @override
  Future<bool> call({String ? params}) async {
    return await sl<ProductRepository>().isFavorite(params!);
  }

}