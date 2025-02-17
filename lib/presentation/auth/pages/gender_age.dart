import 'package:ecommerce_app/common/bloc/button/button_state.dart';
import 'package:ecommerce_app/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce_app/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/domain/auth/usecases/signup.dart';
import 'package:ecommerce_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:ecommerce_app/presentation/auth/widgets/ages.dart';
import 'package:ecommerce_app/widgets/button/basic_reactive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationReq userCreationReq;
  const GenderAndAgeSelectionPage({required this.userCreationReq, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
          BlocProvider(create: (context) => ButtonStateCubit()),
        ],
        child: BlocListener<ButtonStateCubit,ButtonState>(
          listener: (context,state){
            if(state is ButtonFailureState){
              var snackbar = SnackBar(content: Text(state.errorMessage),behavior: SnackBarBehavior.floating,);
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Column(
            children: [ 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tellUs(),
                    const SizedBox(
                      height: 20,
                    ),
                    _genders(context),
                    const SizedBox(
                      height: 20,
                    ),
                    howOld(),
                    const SizedBox(
                      height: 20,
                    ),
                    _age(),
                  ],
                ),
              ),
              const Spacer(),
              _finishButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _tellUs() {
    return Text('Tell us about yourself',
        style: GoogleFonts.poppins(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            genderTile(context, 1, 'Men'),
            const SizedBox(
              width: 20,
            ),
            genderTile(context, 2, 'Women'),
          ],
        );
      },
    );
  }

  Expanded genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: context.read<GenderSelectionCubit>().selectedIndex ==
                      genderIndex
                  ? const Color.fromARGB(255, 54, 98, 204)
                  : Color.fromARGB(255, 104, 104, 104)),
          child: Center(
            child: Text(
              gender,
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(255, 234, 238, 250)),
            ),
          ),
        ),
      ),
    );
  }

  Widget howOld() {
    return Text(
      'How old are you?',
      style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _age() {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomsheet.display(
                context,
                MultiBlocProvider(providers: [
                  BlocProvider.value(
                    value: context.read<AgeSelectionCubit>(),
                  ),
                  BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges(),
                  ),
                ], child: const Ages()));
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 104, 104, 104)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state,
                  style: GoogleFonts.outfit(
                      color: Color.fromARGB(255, 234, 238, 250),
                      fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromARGB(255, 234, 238, 250),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: Color.fromARGB(255, 98, 133, 217),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(builder: (context) {
          return BasicReactiveButton(
              onPressed: () {
                userCreationReq.gender =
                    context.read<GenderSelectionCubit>().selectedIndex;
                userCreationReq.age =
                    context.read<AgeSelectionCubit>().selectedAge;
                context.read<ButtonStateCubit>().execute(usecase: SignupUseCase(), params: userCreationReq);
              },
              title: 'Finish');
        }),
      ),
    );
  }
}
