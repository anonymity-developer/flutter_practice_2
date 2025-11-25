import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import '../cubits/login_cubit.dart';

class TempMainScreen extends StatelessWidget {
  const TempMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context,
            '/social_login',
            (route) => false,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is LoginSuccess) {
              final user = state.user;
              return Padding(
                padding: AppSpacing.paddingHorizontalLG,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.heightXL,
                    Text(
                      '${user.name}님 안녕하세요!',
                      style: AppTextStyles.h2(color: AppColors.black),
                    ),
                    AppSpacing.heightMD,
                    Text(
                      '로그인 사용자 정보',
                      style: AppTextStyles.bodyLarge(
                        color: AppColors.secondary_color_gray_10,
                      ),
                    ),
                    AppSpacing.heightSM,
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.secondary_color_gray_1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID: ${user.id}',
                            style: AppTextStyles.bodyMedium(
                              color: AppColors.black,
                            ),
                          ),
                          AppSpacing.heightSM,
                          Text(
                            '이름: ${user.name}',
                            style: AppTextStyles.bodyMedium(
                              color: AppColors.black,
                            ),
                          ),
                          if (user.phone != null) ...[
                            AppSpacing.heightSM,
                            Text(
                              '전화번호: ${user.phone}',
                              style: AppTextStyles.bodyMedium(
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    AppSpacing.heightMD,

                    Text(
                      '로그인 사용자 펫 정보',
                      style: AppTextStyles.bodyLarge(
                        color: AppColors.secondary_color_gray_10,
                      ),
                    ),
                    AppSpacing.heightSM,

                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.secondary_color_gray_1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name == '테스트1' ? '이름: 뽀삐' : '이름: 초코',
                            style: AppTextStyles.bodyMedium(
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    AppSpacing.heightXL,
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          context.read<LoginCubit>().logout();
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/social_login',
                            (route) => false,
                          );
                        },
                        child: Text(
                          '로그아웃',
                          style: AppTextStyles.button(color: AppColors.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
