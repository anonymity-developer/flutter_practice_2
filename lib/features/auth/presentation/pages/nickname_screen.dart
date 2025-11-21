import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/signup_bloc.dart';
import 'package:flutter_application_2/features/auth/presentation/bloc/signup_event.dart';

class NicknameScreen extends StatefulWidget {
  const NicknameScreen({super.key});

  @override
  State<NicknameScreen> createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  final _nicknameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(_checkInput);
  }

  @override
  void dispose() {
    _nicknameController.removeListener(_checkInput);
    _nicknameController.dispose();
    super.dispose();
  }

  void _checkInput() {
    setState(() {
      _isButtonEnabled = _nicknameController.text.isNotEmpty &&
          _nicknameController.text.length <= 6;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                '닉네임을\n입력해 주세요',
                style: AppTextStyles.h3(
                  color: AppColors.black,
                ),
              ),
              AppSpacing.heightXL,

              Text(
                '닉네임',
                style: AppTextStyles.bodyMedium(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppSpacing.heightSM,

              TextField(
                controller: _nicknameController,
                decoration: InputDecoration(
                  hintText: '6자 이내로 입력 가능해요',
                  hintStyle: AppTextStyles.bodyMedium(
                    color: AppColors.secondary_color_gray_5,
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: _isButtonEnabled
                        ? AppColors.primary
                        : AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _isButtonEnabled
                      ? () {
                          // BLoC을 통해 닉네임 저장
                          context.read<SignupBloc>().add(
                                SaveNickname(_nicknameController.text),
                              );
                          Navigator.pushNamed(context, '/additional_info');
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
  }
}
