import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_assets.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import '../cubits/user_registration_cubit.dart';
import 'package:flutter_application_2/features/user_registration/repository/user_registration_repository.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'package:flutter_application_2/features/login/cubits/login_cubit.dart';
import 'package:go_router/go_router.dart';

class UserRegistrationCompleteScreen extends StatefulWidget {
  final String nickname;

  const UserRegistrationCompleteScreen({
    super.key,
    this.nickname = '회원',
  });

  @override
  State<UserRegistrationCompleteScreen> createState() => _UserRegistrationCompleteScreenState();
}

class _UserRegistrationCompleteScreenState extends State<UserRegistrationCompleteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.paddingHorizontalLG,
          child: BlocBuilder<UserRegistrationCubit, UserRegistrationState>(
            builder: (context, state) {
              // State에서 닉네임 가져오기
              String nickname = widget.nickname; // 기본값
              if (state is UserRegistrationDataLoaded) {
                nickname = state.data.nickname ?? widget.nickname;
              } else if (state is UserRegistrationDataSaved) {
                nickname = state.data.nickname ?? widget.nickname;
              } else if (state is UserRegistrationInitial) {
                nickname = state.data.nickname ?? widget.nickname;
              }

              return Column(
                children: [
                  const Spacer(),

                  // 동물 일러스트레이션
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      AppAssets.welcomingAnimals,
                    ),
                  ),

                  AppSpacing.heightXL,

                  // 환영 메시지
                  Text(
                    '$nickname님 반가워요!',
                    style: AppTextStyles.h3(
                      color: AppColors.secondary_color_gray_10,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  AppSpacing.heightMD,

                  // 설명 텍스트
                  Text(
                    '페스룸에서 반려동물과\n함께 즐거운 순간을 만들어보세요!',
                    style: AppTextStyles.bodyLarge(
                      color: AppColors.secondary_color_gray_7,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  AppSpacing.heightXL,

                  // 내 반려동물 알려주기 버튼
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        context.push('/pet_registration/type');
                      },
                      child: Text(
                        '내 반려동물 알려주기',
                        style: AppTextStyles.button(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),

                  AppSpacing.heightMD,

                  // 다음에 할래요 링크
                  TextButton(
                    onPressed: () async {
                      // 유저 등록 정보 저장
                      final cubit = context.read<UserRegistrationCubit>();
                      final loginState = context.read<LoginCubit>().state;
                      if (loginState is LoginSuccess) {
                        final userId = loginState.user.id;
                        final state = cubit.state;
                        UserRegistrationData? registrationData;
                        
                        if (state is UserRegistrationDataLoaded) {
                          registrationData = state.data;
                        } else if (state is UserRegistrationDataSaved) {
                          registrationData = state.data;
                        } else if (state is UserRegistrationInitial) {
                          registrationData = state.data;
                        }
                        
                        if (registrationData != null) {
                          await context.read<UserRegistrationRepository>()
                            .completeUserRegistration(userId, registrationData);
                          
                          if (!context.mounted) return;
                          context.go('/main');
                        } else {
                          context.go('/main');
                        }
                      } else {
                        context.go('/main');
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      '다음에 할래요',
                      style: AppTextStyles.bodyMedium(
                        color: AppColors.secondary_color_gray_7,
                      ).copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  const Spacer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
