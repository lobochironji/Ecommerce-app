import 'package:ecommerce_app/core/configs/assets/app_vector.dart';
import 'package:ecommerce_app/data/constant.dart';
import 'package:ecommerce_app/data/notifier.dart';
import 'package:ecommerce_app/domain/auth/entity/user.dart';
import 'package:ecommerce_app/presentation/cart/pages/cart.dart';
import 'package:ecommerce_app/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:ecommerce_app/presentation/home/bloc/user_info_display_state.dart';
import 'package:ecommerce_app/presentation/settings/pagees/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: Container(
        color: const Color.fromARGB(255, 58, 5, 101),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, right: 16, left: 16, bottom: 20),
          child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
            builder: (context, state) {
              if (state is UserInfoLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is UserInfoLoaded) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _profileImage(state.user, context),
                    Expanded(child: _gender(state.user)),
                    _switchmode(context),
                    _card(context)
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _profileImage(UserEntity user, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return SettingsPage();
          },
        ));
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pfp.jpeg'),
            ),
            shape: BoxShape.circle),
      ),
    );
  }

  Widget _gender(UserEntity user) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 104, 104, 104),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: GoogleFonts.outfit(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }

  Widget _switchmode(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(KConstants.themeMode, true);
        isDarkModeOn.value = !isDarkModeOn.value;
      },
      icon: ValueListenableBuilder(
        valueListenable: isDarkModeOn,
        builder: (context, value, child) {
          return value ? Icon(Icons.dark_mode) : Icon(Icons.light_mode);
        },
      ),
    );
  }

  Widget _card(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CartPage();
          },
        ));
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          AppVectors.bag,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
