import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import 'package:flutter_application_2/features/pet_registration/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/pet_registration_cubit.dart';
import 'package:go_router/go_router.dart';

class PetNameAndGenderScreen extends StatefulWidget {
  const PetNameAndGenderScreen({super.key});

  @override
  State<PetNameAndGenderScreen> createState() => _PetNameAndGenderScreenState();
}

class _PetNameAndGenderScreenState extends State<PetNameAndGenderScreen> {
  final _petNameController = TextEditingController();
  PetGender? _selectedGender;
  bool _isNeutered = false;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _petNameController.addListener(_checkInput);
  }

  @override
  void dispose() {
    _petNameController.removeListener(_checkInput);
    _petNameController.dispose();
    super.dispose();
  }

  void _checkInput() {
    setState(() {
      _isButtonEnabled = _petNameController.text.isNotEmpty &&
          _petNameController.text.length <= 10 &&
          _selectedGender != null;
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
                '반려동물의 이름과 성별을\n알려 주세요',
                style: AppTextStyles.h3(color: AppColors.black),
              ),
              AppSpacing.heightXL,

              // 이름 입력
              Text(
                '이름',
                style: AppTextStyles.bodyMedium(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppSpacing.heightSM,
              TextField(
                controller: _petNameController,
                decoration: InputDecoration(
                  hintText: '1~10자 이내로 입력해 주세요',
                  hintStyle: AppTextStyles.bodyMedium(
                    color: AppColors.secondary_color_gray_5,
                  ),
                ),
              ),
              AppSpacing.heightMD,

              // 성별 선택
            Text(
                '성별',
                style: AppTextStyles.bodyMedium(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppSpacing.heightSM,
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: _selectedGender == PetGender.male
                            ? AppColors.primary.withOpacity(0.1)
                            : Colors.transparent,
                        side: BorderSide(
                          color: _selectedGender == PetGender.male
                              ? AppColors.primary
                              : AppColors.secondary_color_gray_3,
                          width: _selectedGender == PetGender.male ? 2 : 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedGender = PetGender.male;
                          _checkInput();
                        });
                      },
                      child: Text(
                        '남아',
                        style: AppTextStyles.bodyMedium(
                          color: _selectedGender == PetGender.male
                              ? AppColors.primary
                              : AppColors.black,
                          fontWeight: _selectedGender == PetGender.male
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.widthMD,
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: _selectedGender == PetGender.female
                            ? AppColors.primary.withOpacity(0.1)
                            : Colors.transparent,
                        side: BorderSide(
                          color: _selectedGender == PetGender.female
                              ? AppColors.primary
                              : AppColors.secondary_color_gray_3,
                          width: _selectedGender == PetGender.female ? 2 : 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedGender = PetGender.female;
                          _checkInput();
                        });
                      },
                      child: Text(
                        '여아',
                        style: AppTextStyles.bodyMedium(
                          color: _selectedGender == PetGender.female
                              ? AppColors.primary
                              : AppColors.black,
                          fontWeight: _selectedGender == PetGender.female
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
            ),
          ],
              ),
              AppSpacing.heightMD,

              // 중성화 체크박스
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  '중성화 했어요',
                  style: AppTextStyles.bodyMedium(
                    color: AppColors.black,
                  ),
                ),
                value: _isNeutered,
                onChanged: (value) {
                  setState(() {
                    _isNeutered = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
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
                          context.read<PetRegistrationCubit>().updateName(
                                _petNameController.text,
                              );
                          context.read<PetRegistrationCubit>().updateGender(
                                _selectedGender!,
                              );
                          context.read<PetRegistrationCubit>().updateIsNeutered(
                                _isNeutered,
                              );
                          context.push('/pet_registration/additional_info');
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