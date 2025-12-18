import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_assets.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';
import '../cubits/login_cubit.dart';

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        // 자동 로그인 성공 시 메인 화면으로 이동
        if (state.user != null) {
          if (!context.mounted) return;
          if (state.isRegistered) {
            // 등록된 유저 : 메인 화면
            context.go('/main');
          } else {
            // 미등록 유저 : 유저 등록 플로우
            context.go('/user_registration');
          }
        }
      },
      child: Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.paddingHorizontalLG,
          child: Column(
            children: [
              // 상단 X 버튼 (오른쪽 상단)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      AppAssets.xClose,
                      width: 40,
                      height: 40,
                    ),
                    onPressed: () {
                      SystemNavigator.pop(); // 앱 종료
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),

              const SizedBox(height: 40), // X 버튼과 로고 사이 간격

              // 로고 + 텍스트 (중앙 정렬)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 로고 이미지 (SVG)
                    SvgPicture.asset(
                      AppAssets.pethroomLogo,
                      width: 160,
                      height: 160,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 8),
                    SvgPicture.asset(
                      AppAssets.pethroomFriends,
                      width: 170,
                      height: 19.486,
                    ),
                    const SizedBox(height: 8),
                    SvgPicture.asset(
                      AppAssets.friendsLogo,
                      width: 125.382,
                      height: 19.567,
                    ),

                    const SizedBox(height: 70),

                    // 소셜 로그인 버튼들
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _SocialButton(
                          color: AppColors.kakao,
                          iconAsset: AppAssets.icSocialKakao,
                          label: '카카오로 계속하기',
                          textColor: AppColors.black,
                          onPressed: () {
                            // TODO: 카카오 로그인
                          },
                        ),
                        const SizedBox(height: 8), // 버튼 사이 간격
                        _SocialButton(
                          color: AppColors.naver,
                          iconAsset: AppAssets.icSocialNaver,
                          label: '네이버로 계속하기',
                          textColor: AppColors.white,
                          onPressed: () {
                            // TODO: 네이버 로그인
                          },
                        ),
                        const SizedBox(height: 8), // 버튼 사이 간격
                        _SocialButton(
                          color: AppColors.apple,
                          iconAsset: AppAssets.icSocialApple,
                          label: '애플로 계속하기',
                          textColor: AppColors.white,
                          onPressed: () {
                            // TODO: 애플 로그인
                          },
                        ),
                        const SizedBox(height: 24), // 버튼과 링크 사이 간격
                        // 페스룸 아이디로 계속하기 링크
                        TextButton(
                          onPressed: () {
                            context.push('/login/id');
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            '페스룸 아이디로 계속하기',
                            style: AppTextStyles.bodyMedium().copyWith(
                              color: AppColors.secondary_color_gray_10,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final Color color;
  final String iconAsset;
  final String label;
  final Color textColor;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.color,
    required this.iconAsset,
    required this.label,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44, // CSS: height: 44px
      width: double.infinity, // CSS: align-self: stretch (전체 너비)
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9), // CSS: border-radius: 9px
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: 0, // CSS: padding 좌우 0
            vertical: 14, // CSS: padding 상하 14px
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // CSS: justify-content: center
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconAsset,
              width: 20,
              height: 20,
              colorFilter: textColor == AppColors.black
                  ? null
                  : ColorFilter.mode(
                      textColor,
                      BlendMode.srcIn,
                    ),
            ),
            const SizedBox(width: 8), // CSS: gap: 8px
            Text(
              label,
              style: AppTextStyles.bodyMedium(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
