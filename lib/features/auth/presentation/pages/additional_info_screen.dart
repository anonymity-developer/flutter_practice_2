import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/signup_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/signup_event.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/signup_state.dart';

class AdditionalInfoScreen extends StatefulWidget {
  const AdditionalInfoScreen({super.key});

  @override
  State<AdditionalInfoScreen> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  final _birthdayController = TextEditingController();
  final _referralCodeController = TextEditingController();
  String? _selectedGender;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _birthdayController.addListener(_checkInput);
  }

  @override
  void dispose() {
    _birthdayController.removeListener(_checkInput);
    _birthdayController.dispose();
    _referralCodeController.dispose();
    super.dispose();
  }

  void _checkInput() {
    setState(() {
      _isButtonEnabled = _birthdayController.text.isNotEmpty &&
          _selectedGender != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        String? nickname;
        if (state is SignupDataLoaded) {
          nickname = state.data.nickname;
        } else if (state is SignupDataSaved) {
          nickname = state.data.nickname;
        }

        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
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
                    '추가 정보를\n입력해 주세요',
                    style: AppTextStyles.h3(
                      color: AppColors.black,
                    ),
                  ),
                  AppSpacing.heightXL,

                  // 생일 입력
                  Text(
                    '생일',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.black,
                    ),
                  ),
                  AppSpacing.heightSM,
                  TextField(
                    controller: _birthdayController,
                    decoration: const InputDecoration(
                      hintText: 'YYYY / MM / DD',
                    ),
                  ),
                  AppSpacing.heightMD,

                  // 성별 선택
                  Text(
                    '성별',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.black,
                    ),
                  ),
                  AppSpacing.heightSM,
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: const InputDecoration(
                      hintText: '선택하기',
                    ),
                    items: ['남성', '여성'].map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                        _checkInput();
                      });
                    },
                  ),
                  AppSpacing.heightMD,

                  // 추천코드 입력 (선택)
                  Text(
                    '추천코드 입력 (선택)',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.black,
                    ),
                  ),
                  AppSpacing.heightSM,
                  TextField(
                    controller: _referralCodeController,
                    decoration: const InputDecoration(
                      hintText: '추천코드 입력',
                    ),
                  ),
                  Text(
                    '추천코드 입력 시 1,000P 적립! 가입할 때만 받을 수 있어요',
                    style: AppTextStyles.caption(
                      color: AppColors.secondary_color_gray_10,
                    ),
                  ),

                  const Spacer(),

                  // 다음 버튼
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: _isButtonEnabled
                            ? AppColors.primary
                            : AppColors.secondary_color_gray_2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _isButtonEnabled
                          ? () {
                              // BLoC을 통해 추가 정보 저장
                              context.read<SignupBloc>().add(
                                    SaveBirthday(_birthdayController.text),
                                  );
                              context.read<SignupBloc>().add(
                                    SaveGender(_selectedGender!),
                                  );
                              context.read<SignupBloc>().add(
                                    SaveReferralCode(
                                      _referralCodeController.text.isEmpty
                                          ? null
                                          : _referralCodeController.text,
                                    ),
                                  );

                              Navigator.pushNamed(
                                context,
                                '/signup_complete',
                                arguments: nickname ?? '회원',
                              );
                            }
                          : null,
                      child: Text(
                        '다음',
                        style: AppTextStyles.button(
                          color: _isButtonEnabled
                              ? AppColors.white
                              : AppColors.secondary_color_gray_4,
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
      },
    );
  }
}
