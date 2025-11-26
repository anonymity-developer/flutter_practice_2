import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/theme/app_theme.dart';
import 'features/login/repository/login_datasource.dart';
import 'features/login/repository/login_repository.dart';
import 'features/login/cubits/login_cubit.dart';
import 'features/login/presentation/social_login_screen.dart';
import 'features/login/presentation/id_login_screen.dart';
import 'features/main/presentation/main_screen.dart';
import 'features/user_registration/repository/user_registration_datasource.dart';
import 'features/user_registration/repository/user_registration_repository.dart';
import 'features/user_registration/cubits/user_registration_cubit.dart';
import 'features/user_registration/presentation/terms_agreement_screen.dart';
import 'features/user_registration/presentation/nickname_screen.dart';
import 'features/user_registration/presentation/additional_info_screen.dart';
import 'features/user_registration/presentation/user_registration_complete_screen.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => LoginRepository(LoginDataSource()),
        ),
        RepositoryProvider(
          create: (context) => UserRegistrationRepository(UserRegistrationDataSource()),
        ),
        RepositoryProvider(
          create: (context) =>
              PetRegistrationRepository(PetRegistrationDataSource()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(context.read<LoginRepository>()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Pethroom Friends',
          theme: AppTheme.lightTheme,
          routerConfig: _router,
        ),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/login/social',

  // 로그인 (전역 LoginCubit 사용)
  routes: [
    GoRoute(
      path: '/login',
      redirect: (context, state) {
        final path = state.uri.path;
        if (path == '/login/social' || path == '/login/id') {
          return null; 
        }
        return '/login/social';
      },
      routes: [
        GoRoute(
          path: 'social',
          builder: (context, state) => const SocialLoginScreen(),
        ),
        GoRoute(path: 'id', builder: (context, state) => const IdLoginScreen()),
      ],
    ),

    GoRoute(
      path: '/main',
      builder: (context, state) {
        return const MainScreen();
      },
    ),

    // 유저 등록 (user registration cubit 주입)
    ShellRoute(
      builder: (context, state, child) => BlocProvider(
        create: (context) => UserRegistrationCubit(context.read<UserRegistrationRepository>()),
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/user_registration',
          redirect: (context, state) {
            final path = state.uri.path;
            if (path.startsWith('/user_registration/') && path != '/user_registration') {
              return null;
            }
            return '/user_registration/terms_agreement';
          },
          routes: [
            GoRoute(
              path: 'terms_agreement',
              builder: (context, state) => const TermsAgreementScreen(),
            ),
            GoRoute(
              path: 'nickname',
              builder: (context, state) => const NicknameScreen(),
            ),
            GoRoute(
              path: 'additional_info',
              builder: (context, state) => const AdditionalInfoScreen(),
            ),
            GoRoute(
              path: 'complete',
              builder: (context, state) => const UserRegistrationCompleteScreen(),
            ),
          ],
        ),
      ],
    ),

    // 반려동물 등록 (pet registration cubit 주입)
    ShellRoute(
      builder: (context, state, child) => BlocProvider(
        create: (context) =>
            PetRegistrationCubit(context.read<PetRegistrationRepository>()),
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/pet_registration',
          redirect: (context, state) {
            final path = state.uri.path;
            if (path.startsWith('/pet_registration') && path != '/pet_registration') {
              return null;
            }
            return '/pet_registration/type';
          },
          routes: [
            GoRoute(
              path: 'type',
              builder: (context, state) => const PetTypeScreen(),
            ),
            GoRoute(
              path: 'breed',
              builder: (context, state) => const PetBreedScreen(),
            ),
            GoRoute(
              path: 'name_and_gender',
              builder: (context, state) => const PetNameAndGenderScreen(),
            ),
            GoRoute(
              path: 'additional_info',
              builder: (context, state) => const PetAdditionalInfoScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
