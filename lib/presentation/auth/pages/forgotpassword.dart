import 'package:ecommerce_app/common/bloc/button/button_state.dart';
import 'package:ecommerce_app/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce_app/data/notifier.dart';
import 'package:ecommerce_app/domain/auth/usecases/send_password_reset_email.dart';
import 'package:ecommerce_app/presentation/auth/pages/password_reset_email.dart';
import 'package:ecommerce_app/widgets/button/basic_reactive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _SignInState();
}

class _SignInState extends State<Forgotpassword> {
  TextEditingController controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => ButtonStateCubit(),
            child: BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonFailureState) {
                  var snackbar = SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
                if (state is ButtonSuccessState) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return PasswordResetEmailPage();
                    },
                  ));
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _forgotPasswordText(context),
                    SizedBox(height: 20.0),
                    _recoveryEmailField(context),
                    SizedBox(height: 20.0),
                    _continueBtn(context),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _forgotPasswordText(BuildContext context) {
    return Text('Forgot Password',
        style: GoogleFonts.poppins(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget _recoveryEmailField(BuildContext context) {
    return TextField(
      style: GoogleFonts.outfit(
        color: isDarkModeOn.value
            ? Color.fromARGB(255, 234, 238, 250)
            : Color.fromARGB(255, 23, 23, 23),
      ),
      controller: controllerEmail,
      decoration: InputDecoration(
        filled: isDarkModeOn.value,
        fillColor: Color.fromARGB(255, 33, 33, 33),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkModeOn.value
                ? Color.fromARGB(255, 122, 122, 122)
                : Color.fromARGB(255, 23, 23, 23),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 54, 98, 204),
          ),
        ),
        hintText: 'Enter Recovery Email',
        hintStyle: GoogleFonts.outfit(),
      ),
      onEditingComplete: () {
        setState(() {});
      },
    );
  }

  Widget _continueBtn(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          context.read<ButtonStateCubit>().execute(
              usecase: SendPasswordResetEmailUseCase(),
              params: controllerEmail.text);
        },
        title: 'Continue',
      );
    });
  }
}
