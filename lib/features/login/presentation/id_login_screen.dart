import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import '../cubits/login_cubit.dart';

class IdLoginScreen extends StatefulWidget {
  const IdLoginScreen({super.key});

  @override
  State<IdLoginScreen> createState() => _IdLoginScreenState();
}

class _IdLoginScreenState extends State<IdLoginScreen> {
  final _idController = TextEditingController();
  final _pwController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _idController.addListener(_updateButtonState);
    _pwController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _idController.removeListener(_updateButtonState);
    _pwController.removeListener(_updateButtonState);
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _idController.text.isNotEmpty && _pwController.text.isNotEmpty;
    });
  }

  void _onLogin() {
    context.read<LoginCubit>().login(
          _idController.text,
          _pwController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // 로그인 성공 시 메인 화면으로 이동
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/temp_main',
            (route) => false,
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(''),
        elevation: 0,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.paddingHorizontalLG,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.heightSM,
              Text(
                '페스룸 계정 그대로\n프렌즈에 로그인하세요',
                style: AppTextStyles.h3(
                  color: AppColors.black,
                ),
              ),
              AppSpacing.heightXL,

              Text(
                '아이디',
                style: AppTextStyles.bodyMedium(
                  color: AppColors.secondary_color_gray_10,
                ),
              ),
              AppSpacing.heightSM,

              TextField(
                controller: _idController,
                decoration: const InputDecoration(
                  hintText: '아이디를 입력하세요',
                ),
              ),
              AppSpacing.heightMD,

              Text(
                '비밀번호',
                style: AppTextStyles.bodyMedium(
                  color: AppColors.secondary_color_gray_10,
                ),
              ),
              AppSpacing.heightSM,

              TextField(
                controller: _pwController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: '비밀번호를 입력하세요',
                ),
              ),

              AppSpacing.heightMD,

              // 아이디 찾기 / 비밀번호 찾기 / 회원가입
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '아이디 찾기',
                          style: AppTextStyles.bodyMedium(
                            color: AppColors.secondary_color_gray_10,
                          ),
                        ),
                      ),
                      Text(
                        '|',
                        style: AppTextStyles.bodyMedium(
                          color: AppColors.secondary_color_gray_10,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '비밀번호 찾기',
                          style: AppTextStyles.bodyMedium(
                            color: AppColors.secondary_color_gray_10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/terms_agreement');
                    },
                    child: Text(
                      '회원가입',
                      style: AppTextStyles.bodyMedium(
                        color: AppColors.secondary_color_gray_10,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              SizedBox(
                width: 343,
                height: 54,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: _isButtonEnabled
                        ? AppColors.primary
                        : AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _isButtonEnabled ? _onLogin : null,
                  child: Text(
                    '로그인',
                    style: AppTextStyles.button(
                      color: _isButtonEnabled
                          ? AppColors.white
                          : AppColors.secondary_color_gray_7,
                    ),
                  ),
                ),
              ),
              AppSpacing.heightMD,
            ],
          ),
        ),
      ),
      ),
    );
  }
}
