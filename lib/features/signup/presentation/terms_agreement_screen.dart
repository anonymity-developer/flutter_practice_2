import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import 'package:flutter_application_2/core/constants/app_assets.dart';
import '../cubits/signup_cubit.dart';
import 'package:go_router/go_router.dart';

class TermsAgreementScreen extends StatefulWidget {
  const TermsAgreementScreen({super.key});

  @override
  State<TermsAgreementScreen> createState() => _TermsAgreementScreenState();
}

class _TermsAgreementScreenState extends State<TermsAgreementScreen> {
  bool _allAgreed = false;
  bool _serviceTerms = false;
  bool _privacyPolicy = false;
  bool _locationInfo = false;
  bool _marketingInfo = false;

  void _toggleAllAgreed(bool? value) {
    setState(() {
      _allAgreed = value ?? false;
      _serviceTerms = _allAgreed;
      _privacyPolicy = _allAgreed;
      _locationInfo = _allAgreed;
      _marketingInfo = _allAgreed;

      // Cubit을 통해 약관 동의 정보 저장
      context.read<SignupCubit>().saveTermsAgreement(
            serviceTerms: _serviceTerms,
            privacyPolicy: _privacyPolicy,
            locationInfo: _locationInfo,
            marketingInfo: _marketingInfo,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.paddingHorizontalLG,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.heightSM,
              Text(
                '서비스 이용을 위해\n약관에 동의해 주세요',
                style: AppTextStyles.h3(
                  color: AppColors.black,
                ),
              ),
              AppSpacing.heightXL,

              // 체크박스 리스트
              _buildCheckboxItem(
                '모두 동의',
                _allAgreed,
                _toggleAllAgreed,
                isAllAgree: true,
              ),
              AppSpacing.heightMD,
              _buildCheckboxItem(
                '(필수) 서비스 이용약관',
                _serviceTerms,
                (value) {
                  setState(() {
                    _serviceTerms = value ?? false;
                    context.read<SignupCubit>().saveTermsAgreement(
                          serviceTerms: _serviceTerms,
                          privacyPolicy: _privacyPolicy,
                          locationInfo: _locationInfo,
                          marketingInfo: _marketingInfo,
                        );
                  });
                },
                isRequired: true,
              ),
              _buildCheckboxItem(
                '(필수) 개인정보 수집 및 이용',
                _privacyPolicy,
                (value) {
                  setState(() {
                    _privacyPolicy = value ?? false;
                    context.read<SignupCubit>().saveTermsAgreement(
                          serviceTerms: _serviceTerms,
                          privacyPolicy: _privacyPolicy,
                          locationInfo: _locationInfo,
                          marketingInfo: _marketingInfo,
                        );
                  });
                },
                isRequired: true,
              ),
              _buildCheckboxItem(
                '(선택) 위치정보 이용',
                _locationInfo,
                (value) {
                  setState(() {
                    _locationInfo = value ?? false;
                    context.read<SignupCubit>().saveTermsAgreement(
                          serviceTerms: _serviceTerms,
                          privacyPolicy: _privacyPolicy,
                          locationInfo: _locationInfo,
                          marketingInfo: _marketingInfo,
                        );
                  });
                },
                isRequired: false,
              ),
              _buildCheckboxItem(
                '(선택) 마케팅 정보 수신',
                _marketingInfo,
                (value) {
                  setState(() {
                    _marketingInfo = value ?? false;
                    context.read<SignupCubit>().saveTermsAgreement(
                          serviceTerms: _serviceTerms,
                          privacyPolicy: _privacyPolicy,
                          locationInfo: _locationInfo,
                          marketingInfo: _marketingInfo,
                        );
                  });
                },
                isRequired: false,
              ),

              const Spacer(),


              // 다음 버튼
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
                  onPressed: (_serviceTerms && _privacyPolicy)
                      ? () {
                          context.push('/signup/nickname');
                        }
                      : null,
                  child: Text(
                    '동의하고 계속하기',
                    style: AppTextStyles.button(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              AppSpacing.heightMD,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxItem(
    String label,
    bool value,
    ValueChanged<bool?> onChanged, {
    bool isAllAgree = false,
    bool isRequired = false,
  }) {
    final iconAsset = isAllAgree
        ? (value ? AppAssets.checkboxActive : AppAssets.checkboxInactive)
        : (value ? AppAssets.checkActive : AppAssets.checkInactive);

    final content = InkWell(
      onTap: () => onChanged(!value),
      child: Padding(
        padding: isAllAgree
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 16) // 내부 패딩 16
            : const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(iconAsset, width: 24, height: 24),
            AppSpacing.widthSM,
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.bodyMedium(
                  color: AppColors.secondary_color_gray_10,
                  fontWeight: isAllAgree ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
            if (!isAllAgree)
              const Icon(Icons.chevron_right, color: AppColors.secondary_color_gray_3),
          ],
        ),
      ),
    );

    if (isAllAgree) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondary_color_gray_1, // 회색 배경
          borderRadius: BorderRadius.circular(12),
        ),
        child: content,
      );
    }

    return content;
  }
}
