import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_assets.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import '../cubits/user_registration_cubit.dart';
import 'package:flutter_application_2/features/login/cubits/login_cubit.dart';
// import 'package:flutter_application_2/features/main/presentation/cubits/main_screen_cubit.dart';
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
              final nickname = switch (state) {
                UserRegistrationDataLoaded(data: final data) =>
                  data.nickname ?? widget.nickname,
                UserRegistrationDataSaved(data: final data) =>
                  data.nickname ?? widget.nickname,
                UserRegistrationInitial(data: final data) =>
                  data.nickname ?? widget.nickname,
                UserRegistrationLoading() => widget.nickname,
                UserRegistrationFailure() => widget.nickname,
              };

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
                      final loginState = context.read<LoginCubit>().state;
                      if (loginState.user != null) {
                        final userId = loginState.user!.id;
                        await context.read<UserRegistrationCubit>().completeUserRegistration(userId);
                        if (!context.mounted) return;
                        // [*] 메인 수동 새로 고침 
                        // context.read<MainScreenCubit>().refreshUser(userId);
                        // if (!context.mounted) return;
                        context.go('/main');
                      } else if (loginState.error != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(loginState.error!)),
                        );
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
