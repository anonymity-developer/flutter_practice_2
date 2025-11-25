import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/login/repository/login_datasource.dart';
import 'features/login/repository/login_repository.dart';
import 'features/login/cubits/login_cubit.dart';
import 'features/login/presentation/social_login_screen.dart';
import 'features/login/presentation/id_login_screen.dart';
import 'features/login/presentation/temp_main_screen.dart';
import 'features/signup/repository/signup_datasource.dart';
import 'features/signup/repository/signup_repository.dart';
import 'features/signup/cubits/signup_cubit.dart';
import 'features/signup/presentation/terms_agreement_screen.dart';
import 'features/signup/presentation/nickname_screen.dart';
import 'features/signup/presentation/additional_info_screen.dart';
import 'features/signup/presentation/signup_complete_screen.dart';
import 'features/pet_registration/repository/pet_registration_datasource.dart';
import 'features/pet_registration/repository/pet_registration_repository.dart';
import 'features/pet_registration/cubits/pet_registration_cubit.dart';
import 'features/pet_registration/presentation/pet_type_screen.dart';
import 'features/pet_registration/presentation/pet_breed_screen.dart';
import 'features/pet_registration/presentation/pet_name_and_gender_screen.dart';
import 'features/pet_registration/presentation/pet_additional_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            LoginRepository(LoginDataSource()),
          ),
        ),
        BlocProvider(
          create: (context) => SignupCubit(
            SignupRepository(SignupDataSource()),
          ),
        ),
        BlocProvider(
          create: (context) => PetRegistrationCubit(
            PetRegistrationRepository(PetRegistrationDataSource()),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Pethroom Friends',
        theme: AppTheme.lightTheme,
        initialRoute: '/social_login',
        routes: {
          '/social_login': (context) => const SocialLoginScreen(),
          '/id_login': (context) => const IdLoginScreen(),
          '/temp_main': (context) => const TempMainScreen(),
          '/terms_agreement': (context) => const TermsAgreementScreen(),
          '/nickname': (context) => const NicknameScreen(),
          '/additional_info': (context) => const AdditionalInfoScreen(),
          '/signup_complete': (context) {
            final nickname = ModalRoute.of(context)?.settings.arguments as String?;
            return SignupCompleteScreen(nickname: nickname ?? '회원');
          },
          '/pet_type_screen': (context) => const PetTypeScreen(),
          '/pet_breed_screen': (context) => const PetBreedScreen(),
          '/pet_name_and_gender_screen': (context) => const PetNameAndGenderScreen(),
          '/pet_additional_info_screen': (context) => const PetAdditionalInfoScreen(),
        },
      ),
    );
  }
}
