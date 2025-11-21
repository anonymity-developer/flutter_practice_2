import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/datasources/auth_local_datasource.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';
import 'features/auth/presentation/bloc/signup_bloc.dart';
import 'features/auth/presentation/bloc/signup_event.dart';
import 'features/auth/presentation/pages/social_login_screen.dart';
import 'features/auth/presentation/pages/id_login_screen.dart';
import 'features/auth/presentation/pages/terms_agreement_screen.dart';
import 'features/auth/presentation/pages/nickname_screen.dart';
import 'features/auth/presentation/pages/additional_info_screen.dart';
import 'features/auth/presentation/pages/signup_complete_screen.dart';

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
          create: (context) => AuthBloc(
            AuthRepositoryImpl(
              AuthLocalDataSourceImpl(),
            ),
          )..add(const LoadSavedUser()),
        ),
        BlocProvider(
          create: (context) => SignupBloc(
            AuthRepositoryImpl(
              AuthLocalDataSourceImpl(),
            ),
          )..add(const LoadSignupData()),
        ),
      ],
      child: MaterialApp(
        title: 'Pethroom Friends',
        theme: AppTheme.lightTheme,
        initialRoute: '/social_login',
        routes: {
          '/social_login': (context) => const SocialLoginScreen(),
          '/id_login': (context) => const IdLoginScreen(),
          '/terms_agreement': (context) => const TermsAgreementScreen(),
          '/nickname': (context) => const NicknameScreen(),
          '/additional_info': (context) => const AdditionalInfoScreen(),
          '/signup_complete': (context) {
            final nickname = ModalRoute.of(context)?.settings.arguments as String?;
            return SignupCompleteScreen(nickname: nickname ?? '회원');
          },
        },
      ),
    );
  }
}
