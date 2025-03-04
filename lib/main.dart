// ignore: unused_import
import 'package:ecommerce_app/core/configs/theme/theme.dart';
import 'package:ecommerce_app/data/notifier.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:firebase_core/firebase_core.dart'; //

import 'package:ecommerce_app/presentation/splash/bloc/splash_cubit.dart';

import 'package:ecommerce_app/presentation/splash/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeOn,
      builder: (context, isItDark, child) {
        return BlocProvider(
          create: (context) => SplashCubit()..appStarted(),
          child: MaterialApp(
            theme: isItDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashPage(),
          ),
        );
      },
    );
  }
}
