import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/service_locator.dart';

class isLoggedInUseCase implements Usecase<bool, dynamic> {

  @override
  Future<bool> call({params}) {
    return sl<AuthRepository>().isLoggedIn();
  }
}
