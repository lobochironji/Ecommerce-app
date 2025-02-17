import 'package:ecommerce_app/data/notifier.dart';
import 'package:ecommerce_app/presentation/auth/pages/signin.dart';
import 'package:ecommerce_app/presentation/home/pages/home.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SignIn();
              },
            ),
          );
        }
        if (state is Authenticated) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ));
        }
      },
      child: Scaffold(
        backgroundColor: isDarkModeOn.value
            ? const Color.fromARGB(255, 23, 23, 23)
            : const Color.fromARGB(255, 234, 238, 250),
        body: Center(
            child: isDarkModeOn.value
                ? Image.asset('assets/images/koalalogodark.jpg')
                : Image.asset('assets/images/koalalogolight.jpg')),
      ),
    );
  }
}
