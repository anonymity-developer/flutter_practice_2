import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import 'package:flutter_application_2/core/constants/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models.dart';
import '../cubits/pet_registration_cubit.dart';
import 'package:go_router/go_router.dart';

class PetTypeScreen extends StatelessWidget {
  const PetTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/main');
            }
          },
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
                '어떤 반려동물과\n함께하고 있나요?',
                style: AppTextStyles.h3(
                  color: AppColors.black,
                ),
              ),
              
              AppSpacing.heightXL,
              
              // BlocBuilder를 Expanded로 감싸기
              Expanded(
                child: BlocBuilder<PetRegistrationCubit, PetRegistrationState>(
                  builder: (context, state) {
                    // State에서 type 가져오기
                    final selectedType = state.pet?.type;
                    final isButtonEnabled = selectedType != null;
                    
                    return Column(
                      children: [
                        // 강아지 버튼
                        _buildPetTypeButton(
                          label: '강아지',
                          type: PetType.dog,
                          isSelected: selectedType == PetType.dog,
                          onPressed: () {
                            context
                                .read<PetRegistrationCubit>()
                                .saveType(PetType.dog);
                          },
                        ),
                        
                        AppSpacing.heightMD,
                        
                        // 고양이 버튼
                        _buildPetTypeButton(
                          label: '고양이',
                          type: PetType.cat,
                          isSelected: selectedType == PetType.cat,
                          onPressed: () {
                            context
                                .read<PetRegistrationCubit>()
                                .saveType(PetType.cat);
                          },
                        ),
                        
                        const Spacer(),
                        
                        // 다음 버튼
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: isButtonEnabled
                                  ? AppColors.primary
                                  : AppColors.secondary_color_gray_2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: isButtonEnabled
                                ? () {
                                    context.push('/pet_registration/breed');
                                  }
                                : null,
                            child: Text(
                              '다음',
                              style: AppTextStyles.button(
                                color: isButtonEnabled
                                    ? AppColors.white
                                    : AppColors.secondary_color_gray_4,
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.heightMD,
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPetTypeButton({
    required String label,
    required PetType type,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected 
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          side: BorderSide(
            color: isSelected 
                ? AppColors.primary
                : AppColors.secondary_color_gray_3,
            width: isSelected ? 2 : 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              label,
              style: AppTextStyles.bodyMedium(
                color: isSelected 
                    ? AppColors.primary
                    : AppColors.black,
                fontWeight: isSelected 
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            AppSpacing.widthMD,
            SvgPicture.asset(
              type == PetType.dog ? AppAssets.icDog : AppAssets.icCat,
              width: 50, 
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}