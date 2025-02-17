import 'package:ecommerce_app/common/bloc/button/button_state.dart';
import 'package:ecommerce_app/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce_app/data/auth/models/user_signin_req.dart';
import 'package:ecommerce_app/data/notifier.dart';
import 'package:ecommerce_app/domain/auth/usecases/signin.dart';
import 'package:ecommerce_app/presentation/auth/pages/forgotpassword.dart';
import 'package:ecommerce_app/presentation/home/pages/home.dart';
import 'package:ecommerce_app/widgets/button/basic_reactive_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterPassword extends StatefulWidget {
  final UserSigninReq signinReq;
  const EnterPassword({required this.signinReq, super.key});

  @override
  State<EnterPassword> createState() => _SignInState();
}

class _SignInState extends State<EnterPassword> {
  TextEditingController controllerPassword = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 20.0,
            ),
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
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ), (Route<dynamic> route) => false);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _enterpasswordText(context),
                    SizedBox(height: 20.0),
                    _passwordField(context),
                    SizedBox(height: 20.0),
                    _continueBtn(context),
                    SizedBox(height: 20.0),
                    _forgotPassword(context),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _enterpasswordText(BuildContext context) {
    return Text('Enter Password',
        style: GoogleFonts.poppins(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      style: GoogleFonts.outfit(
        color: isDarkModeOn.value
            ? Color.fromARGB(255, 234, 238, 250)
            : Color.fromARGB(255, 23, 23, 23),
      ),
      controller: controllerPassword,
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
        hintText: 'Enter Password',
        hintStyle: GoogleFonts.outfit(),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }

  Widget _continueBtn(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          widget.signinReq.password = controllerPassword.text;
          context
              .read<ButtonStateCubit>()
              .execute(usecase: SigninpUseCase(), params: widget.signinReq);
        },
        title: 'Login',
      );
    });
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "Forgot password?"),
          TextSpan(
              text: ' Reset',
              style: TextStyle(fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Forgotpassword();
                      },
                    ),
                  );
                }),
        ],
        style: GoogleFonts.outfit(
            color: isDarkModeOn.value
                ? Color.fromARGB(255, 234, 238, 250)
                : Color.fromARGB(255, 23, 23, 23)),
      ),
    );
  }
}
