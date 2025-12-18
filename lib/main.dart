import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';
import 'features/user_registration/adapters/user_registration_data_adapter.dart';
import 'features/pet_registration/adapters/pet_adapter.dart';
import 'features/login/repository/login_repository.dart';
import 'features/login/repository/login_repository_impl.dart';
import 'features/login/cubits/login_cubit.dart';
import 'features/login/presentation/social_login_screen.dart';
import 'features/login/presentation/id_login_screen.dart';
import 'features/main/presentation/main_screen.dart';
import 'features/login/repository/login_datasource_api.dart';
import 'features/user_registration/repository/user_registration_datasource_api.dart'; 
import 'features/user_registration/repository/user_registration_datasource_hive.dart';
import 'features/user_registration/repository/user_registration_repository.dart';
import 'features/user_registration/repository/user_registration_repository_impl.dart';
import 'features/pet_registration/repository/pet_registration_datasource_api.dart';
import 'features/pet_registration/repository/pet_registration_datasource_hive.dart';
import 'features/pet_registration/repository/pet_registration_repository.dart';
import 'features/pet_registration/repository/pet_registration_repository_impl.dart';
import 'features/user_registration/cubits/user_registration_cubit.dart';
import 'features/user_registration/presentation/user_terms_agreement_screen.dart';
import 'features/user_registration/presentation/user_nickname_screen.dart';
import 'features/user_registration/presentation/user_additional_info_screen.dart';
import 'features/user_registration/presentation/user_registration_complete_screen.dart';
import 'features/pet_registration/cubits/pet_registration_cubit.dart';
import 'features/main/cubits/main_screen_cubit.dart';
import 'features/pet_registration/presentation/pet_type_screen.dart';
import 'features/pet_registration/presentation/pet_breed_screen.dart';
import 'features/pet_registration/presentation/pet_name_and_gender_screen.dart';
import 'features/pet_registration/presentation/pet_additional_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Hive 초기화
  await Hive.initFlutter();
  
  // TypeAdapter 등록
  Hive.registerAdapter(UserRegistrationDataAdapter());
  Hive.registerAdapter(PetAdapter());
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LoginRepository>(
          create: (context) => LoginRepositoryImpl(
            LoginDataSourceApi(), // API 데이터
            //LoginDataSourceMock(), // Mock 데이터
          ),
        ),
        RepositoryProvider<UserRegistrationRepository>(
          create: (context) => UserRegistrationRepositoryImpl(
            apiDataSource: UserRegistrationDataSourceApi(),
            hiveDataSource: UserRegistrationDataSourceHive(),
            // apiDataSource: UserRegistrationDataSourceMock(),
            // hiveDataSource: UserRegistrationDataSourceHive(),
          ),
        ),
        RepositoryProvider<PetRegistrationRepository>(
          create: (context) => PetRegistrationRepositoryImpl(
            apiDataSource: PetRegistrationDataSourceApi(),
            hiveDataSource: PetRegistrationDataSourceHive(),
            // apiDataSource: PetRegistrationDataSourceMock(),
            // hiveDataSource: PetRegistrationDataSourceHive(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final cubit = LoginCubit(
                context.read<LoginRepository>(),
                context.read<UserRegistrationRepository>(),
              );
              // 앱 시작 시 자동 로그인 확인
              cubit.checkAutoLogin();
              return cubit;
            },
          ),
          BlocProvider(
            create: (context) => MainScreenCubit(
              context.read<UserRegistrationRepository>(),
              context.read<PetRegistrationRepository>(),
            ),
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
  redirect: (context, state) {
    // LoginCubit이 아직 생성되지 않았을 수 있으므로 안전하게 처리
    try {
      final loginCubit = context.read<LoginCubit>();
      final loginState = loginCubit.state;
      
      // 로그인된 상태이고 로그인 화면에 있는 경우
      if (loginState.user != null && state.uri.path.startsWith('/login')) {
        // 등록 여부에 따라 다른 화면으로 이동
        if (loginState.isRegistered) {
          return '/main';
        } else {
          return '/user_registration';
        }
      }
      
      // 로그인되지 않은 상태이고 메인 화면인 경우 로그인 화면으로 이동
      if (loginState.user == null && state.uri.path == '/main') {
        return '/login/social';
      }
    } catch (e) {
      // LoginCubit을 아직 읽을 수 없는 경우 (초기 빌드 시)
      // 로그인 화면으로 유지
      if (state.uri.path == '/main') {
        return '/login/social';
      }
    }
    
    return null; // 리다이렉트 없음
  },
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

    // 유저 등록 (user registration cubit 주입)  -- pageBuilder 방식 사용해보기
    ShellRoute(
      builder: (context, state, child) => BlocProvider(
        create: (context) =>
            UserRegistrationCubit(context.read<UserRegistrationRepository>()),
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/user_registration',
          pageBuilder: (context, state) {
            return MaterialPage(key: state.pageKey, child: UserTermsAgreementScreen());
          },
          routes: [
            // GoRoute(
            //   path: 'terms_agreement',
            //   builder: (context, state) => const UserTermsAgreementScreen(),
            // ),
            GoRoute(
              path: 'nickname',
              builder: (context, state) => const UserNicknameScreen(),
            ),
            GoRoute(
              path: 'additional_info',
              builder: (context, state) => const UserAdditionalInfoScreen(),
            ),
            GoRoute(
              path: 'complete',
              builder: (context, state) =>
                  const UserRegistrationCompleteScreen(),
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
            if (path.startsWith('/pet_registration') &&
                path != '/pet_registration') {
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


// Repository (구체 클래스)
//     ↓ 의존(생성자에서 받음)
// DataSource (인터페이스)
//     ↓ 구현
// DataSourceApi / DataSourceMock (구현체)