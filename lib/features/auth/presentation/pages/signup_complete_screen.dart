import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_assets.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import 'package:flutter_application_2/features/auth/domain/entities/signup_data.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/signup_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/signup_state.dart';

class SignupCompleteScreen extends StatefulWidget {
  final String nickname;

  const SignupCompleteScreen({
    super.key,
    this.nickname = '회원',
  });

  @override
  State<SignupCompleteScreen> createState() => _SignupCompleteScreenState();
}

class _SignupCompleteScreenState extends State<SignupCompleteScreen> {
  @override
  void initState() {
    super.initState();
    // 화면이 나타난 후 얼럿 표시
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSignupInfoAlert();
    });
  }

  void _showSignupInfoAlert() {
    final state = context.read<SignupBloc>().state;
    String summary = '회원가입 정보\n━━━━━━━━━━━━━━━━\n';

    SignupData? data;
    if (state is SignupDataLoaded) {
      data = state.data;
    } else if (state is SignupDataSaved) {
      data = state.data;
    }

    if (data != null) {
      if (data.nickname != null) {
        summary += '닉네임: ${data.nickname}\n';
      }
      if (data.birthday != null) {
        summary += '생일: ${data.birthday}\n';
      }
      if (data.gender != null) {
        summary += '성별: ${data.gender}\n';
      }
      if (data.referralCode != null && data.referralCode!.isNotEmpty) {
        summary += '추천코드: ${data.referralCode}\n';
      }

      summary += '\n약관 동의\n━━━━━━━━━━━━━━━━\n';
      summary += '서비스 이용약관: ${data.serviceTerms ? "✅" : "❌"}\n';
      summary += '개인정보 수집 및 이용: ${data.privacyPolicy ? "✅" : "❌"}\n';
      summary += '위치정보 이용: ${data.locationInfo ? "✅" : "❌"}\n';
      summary += '마케팅 정보 수신: ${data.marketingInfo ? "✅" : "❌"}\n';
    } else {
      summary += '저장된 정보가 없습니다.\n';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('회원가입 정보 확인'),
        content: SingleChildScrollView(
          child: Text(
            summary,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.paddingHorizontalLG,
          child: BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              // State에서 닉네임 가져오기
              String nickname = widget.nickname; // 기본값
              if (state is SignupDataLoaded) {
                nickname = state.data.nickname ?? widget.nickname;
              } else if (state is SignupDataSaved) {
                nickname = state.data.nickname ?? widget.nickname;
              } else if (state is SignupInitial) {
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
                        // TODO: 반려동물 등록 화면으로 이동
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
                    onPressed: () {
                      // TODO: 메인 화면으로 이동
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
