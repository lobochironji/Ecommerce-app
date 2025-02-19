import 'package:ecommerce_app/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce_app/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_app/domain/auth/repository/auth.dart';
import 'package:ecommerce_app/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce_app/domain/auth/usecases/get_user.dart';
import 'package:ecommerce_app/domain/auth/usecases/is_logged_in.dart';
import 'package:ecommerce_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:ecommerce_app/domain/auth/usecases/signin.dart';
import 'package:ecommerce_app/domain/auth/usecases/signup.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SigninpUseCase>(SigninpUseCase());
  sl.registerSingleton<SendPasswordResetEmailUseCase>(SendPasswordResetEmailUseCase());
  sl.registerSingleton<isLoggedInUseCase>(isLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());

}
