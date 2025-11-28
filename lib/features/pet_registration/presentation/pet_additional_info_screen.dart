import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import 'package:flutter_application_2/core/constants/app_assets.dart';
import 'package:flutter_application_2/features/pet_registration/models.dart';
import '../cubits/pet_registration_cubit.dart';
import 'package:flutter_application_2/features/login/cubits/login_cubit.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_application_2/features/main/presentation/cubits/main_screen_cubit.dart';

class PetAdditionalInfoScreen extends StatefulWidget {
  const PetAdditionalInfoScreen({super.key});

  @override
  State<PetAdditionalInfoScreen> createState() =>
      _PetAdditionalInfoScreenState();
}

class _PetAdditionalInfoScreenState extends State<PetAdditionalInfoScreen> {
  final _birthdayController = TextEditingController();
  final _weightController = TextEditingController();
  PetBodyType? _selectedBodyType;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _birthdayController.addListener(_checkInput);
    _weightController.addListener(_checkInput);
  }

  @override
  void dispose() {
    _birthdayController.removeListener(_checkInput);
    _birthdayController.dispose();
    _weightController.removeListener(_checkInput);
    _weightController.dispose();
    super.dispose();
  }

  void _checkInput() {
    setState(() {
      _isButtonEnabled =
          _birthdayController.text.isNotEmpty &&
          _weightController.text.isNotEmpty &&
          _selectedBodyType != null;
    });
  }

  String _getBodyTypeText(PetBodyType type) {
    switch (type) {
      case PetBodyType.veryThin:
        return '많이 말랐어요';
      case PetBodyType.thin:
        return '말랐어요';
      case PetBodyType.ideal:
        return '평균이에요';
      case PetBodyType.overWeight:
        return '조금 살쪘어요';
      case PetBodyType.obese:
        return '비만이에요';
    }
  }

  String _getBodyTypeDescription(PetBodyType type) {
    switch (type) {
      case PetBodyType.veryThin:
        return '갈비뼈가 쉽게 만져지고 지방과 근육이 거의 없어요';
      case PetBodyType.thin:
        return '갈비뼈가 쉽게 만져지고 허리가 매우 잘록해요';
      case PetBodyType.ideal:
        return '약간의 지방이 덮힌 갈비뼈가 만져지고 허리가 구분돼요';
      case PetBodyType.overWeight:
        return '갈비뼈가 잘 만져지지 않고 허리가 보이진 않지만 튀어나오지 않았어요';
      case PetBodyType.obese:
        return '갈비뼈가 잘 만져지지 않고 허리와 배가 구분되지 않아요';
    }
  }

  void _showBodyTypeModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // 모달 헤더
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '체형 선택',
                    style: AppTextStyles.h3(color: AppColors.black),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      AppAssets.xClose,
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // 체형 옵션 리스트
            // _showBodyTypeModal 함수 내부의 ListView 부분 수정:
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  ...PetBodyType.values.map((type) {
                    final isSelected = _selectedBodyType == type;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedBodyType = type;
                          _checkInput();
                        });
                        context.pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            width: isSelected ? 2 : 0,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                if (isSelected)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: SvgPicture.asset(
                                      AppAssets.checkActive,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                Expanded(
                                  child: Text(
                                    _getBodyTypeText(type),
                                    style: AppTextStyles.bodyMedium(
                                      color: AppColors.black,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // 설명은 항상 표시 (if 조건 제거)
                            AppSpacing.heightSM,
                            Padding(
                              padding: EdgeInsets.only(
                                left: isSelected ? 32 : 0, // 선택했을 때만 왼쪽 패딩
                              ),
                              child: Text(
                                _getBodyTypeDescription(type),
                                style: AppTextStyles.bodySmall(
                                  color: AppColors.secondary_color_gray_7,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetRegistrationCubit, PetRegistrationState>(
      builder: (context, state) {
        String petName = '반려동물';
        if (state is PetRegistrationLoaded) {
          petName = state.pet.name.isNotEmpty ? state.pet.name : '반려동물';
        }

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
                    '$petName의\n추가 정보를 알려주세요',
                    style: AppTextStyles.h3(color: AppColors.black),
                  ),
                  AppSpacing.heightXL,

                  // 생일 입력
                  Text(
                    '생일',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppSpacing.heightSM,
                  TextField(
                    controller: _birthdayController,
                    decoration: InputDecoration(
                      hintText: 'YYYY / MM / DD',
                      hintStyle: AppTextStyles.bodyMedium(
                        color: AppColors.secondary_color_gray_5,
                      ),
                    ),
                  ),
                  AppSpacing.heightMD,

                  // 체중 입력
                  Text(
                    '체중',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppSpacing.heightSM,
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '체중을 입력해 주세요',
                            hintStyle: AppTextStyles.bodyMedium(
                              color: AppColors.secondary_color_gray_5,
                            ),
                          ),
                        ),
                      ),
                      AppSpacing.widthSM,
                      Text(
                        'kg',
                        style: AppTextStyles.bodyMedium(color: AppColors.black),
                      ),
                    ],
                  ),
                  AppSpacing.heightMD,

                  // 체형 선택
                  Text(
                    '체형',
                    style: AppTextStyles.bodyMedium(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppSpacing.heightSM,
                  TextField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: _selectedBodyType != null
                          ? _getBodyTypeText(_selectedBodyType!)
                          : null,
                    ),
                    decoration: InputDecoration(
                      hintText: '체형을 선택해 주세요',
                      hintStyle: AppTextStyles.bodyMedium(
                        color: AppColors.secondary_color_gray_5,
                      ),
                      suffixIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.secondary_color_gray_7,
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.secondary_color_gray_2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.secondary_color_gray_2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                    onTap: () => _showBodyTypeModal(context),
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
                          ? () async {
                              final weight = double.tryParse(
                                _weightController.text,
                              );
                              context
                                  .read<PetRegistrationCubit>()
                                  .updateBirthday(
                                    _birthdayController.text.isEmpty
                                        ? null
                                        : _birthdayController.text,
                                  );
                              context.read<PetRegistrationCubit>().updateWeight(
                                weight,
                              );
                              context
                                  .read<PetRegistrationCubit>()
                                  .updateBodyType(_selectedBodyType);

                              final loginState = context.read<LoginCubit>().state;
                              if (loginState.user != null) {
                                final userId = loginState.user!.id;

                                await context.read<PetRegistrationCubit>().completePetRegistration(userId);
                                if (!context.mounted) return;

                                final state = context.read<PetRegistrationCubit>().state;
                                switch (state) {
                                  case PetRegistrationSuccess():
                                    // [*] 메인 수동 새로 고침 
                                    // await context.read<MainScreenCubit>().refreshPets(userId);
                                    if (!context.mounted) return;
                                    context.go('/main');
                                  case PetRegistrationFailure(message: final message):
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message)),
                                    );
                                  case PetRegistrationInitial():
                                  case PetRegistrationLoading():
                                  case PetRegistrationLoaded():

                                    break;
                                }
                              }
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
