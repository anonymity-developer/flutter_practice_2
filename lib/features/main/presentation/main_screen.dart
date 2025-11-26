import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import 'package:flutter_application_2/features/login/cubits/login_cubit.dart';
import 'package:flutter_application_2/features/pet_registration/repository/pet_registration_repository.dart';
import 'package:flutter_application_2/features/pet_registration/models.dart';
import 'package:flutter_application_2/features/user_registration/repository/user_registration_repository.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UserRegistrationData? _userRegistrationData;
  List<Pet> _pets = [];
  bool _isUserInfoLoading = true;
  bool _isPetsLoading = true;
  String? _userInfoError;
  String? _petsError;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    final loginState = context.read<LoginCubit>().state;
    if (loginState is! LoginSuccess) {
      return;
    }
    final userId = loginState.user.id;

    setState(() {
      _isUserInfoLoading = true;
      _isPetsLoading = true;
      _userInfoError = null;
      _petsError = null;
    });

    final userRegistrationRepo = context.read<UserRegistrationRepository>();
    final petRegistrationRepo = context.read<PetRegistrationRepository>();

    try {
      final userData =
          await userRegistrationRepo.getUserRegistrationByUserId(userId);
      if (!mounted) return;
      setState(() {
        _userRegistrationData = userData;
        _isUserInfoLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _userInfoError = '등록 정보를 불러오는 중 오류가 발생했습니다.';
        _isUserInfoLoading = false;
      });
    }

    try {
      final pets = await petRegistrationRepo.getPetsByUserId(userId);
      if (!mounted) return;
      setState(() {
        _pets = pets;
        _isPetsLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _petsError = '펫 정보를 불러오는 중 오류가 발생했습니다.';
        _isPetsLoading = false;
      });
    }
  }

  Future<void> _refreshData() async {
    await _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/login/social'),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is LoginSuccess) {
              final user = state.user;
              return SingleChildScrollView(
                child: Padding(
                  padding: AppSpacing.paddingHorizontalLG,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSpacing.heightLG,
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
                      AppSpacing.heightXS,
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
                      AppSpacing.heightLG,

                      Text(
                        '앱 등록 정보',
                        style: AppTextStyles.bodyLarge(
                          color: AppColors.secondary_color_gray_10,
                        ),
                      ),
                      AppSpacing.heightXS,

                      _buildUserRegistrationSection(),

                      AppSpacing.heightLG,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '반려동물 정보',
                            style: AppTextStyles.bodyLarge(
                              color: AppColors.secondary_color_gray_10,
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              final result = await context.push('/pet_registration/type');
                              // 펫 등록이 완료되었을 때만 데이터 새로고침
                              if (result == true) {
                                _refreshData();
                              }
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              '+ 반려동물 등록',
                              style: AppTextStyles.bodyMedium(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppSpacing.heightXS,

                      _buildPetListSection(),

                      AppSpacing.heightLG,
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
                            context.go('/login/social');
                          },
                          child: Text(
                            '로그아웃',
                            style: AppTextStyles.button(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      AppSpacing.heightLG,
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  String _getBodyTypeText(PetBodyType bodyType) {
    switch (bodyType) {
      case PetBodyType.veryThin:
        return '매우 마름';
      case PetBodyType.thin:
        return '마름';
      case PetBodyType.ideal:
        return '적정';
      case PetBodyType.overWeight:
        return '과체중';
      case PetBodyType.obese:
        return '비만';
    }
  }

  Widget _buildUserRegistrationSection() {
    if (_isUserInfoLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_userInfoError != null) {
      return _buildMessageContainer(_userInfoError!, textColor: AppColors.black);
    }

    final registrationData = _userRegistrationData;
    if (registrationData == null) {
      return _buildMessageContainer(
        '등록된 정보가 없습니다.',
        textColor: AppColors.secondary_color_gray_10,
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondary_color_gray_1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '서비스 이용약관: ${registrationData.serviceTerms ? '동의' : '미동의'}',
            style: AppTextStyles.bodyMedium(color: AppColors.black),
          ),
          AppSpacing.heightSM,
          Text(
            '개인정보 처리방침: ${registrationData.privacyPolicy ? '동의' : '미동의'}',
            style: AppTextStyles.bodyMedium(color: AppColors.black),
          ),
          AppSpacing.heightSM,
          Text(
            '위치정보 이용약관: ${registrationData.locationInfo ? '동의' : '미동의'}',
            style: AppTextStyles.bodyMedium(color: AppColors.black),
          ),
          AppSpacing.heightSM,
          Text(
            '마케팅 정보 수신: ${registrationData.marketingInfo ? '동의' : '미동의'}',
            style: AppTextStyles.bodyMedium(color: AppColors.black),
          ),
          AppSpacing.heightSM,
          if (registrationData.nickname != null) ...[
            Text(
              '닉네임: ${registrationData.nickname}',
              style: AppTextStyles.bodyMedium(color: AppColors.black),
            ),
            AppSpacing.heightSM,
          ],
          if (registrationData.birthday != null) ...[
            Text(
              '생일: ${registrationData.birthday}',
              style: AppTextStyles.bodyMedium(color: AppColors.black),
            ),
            AppSpacing.heightSM,
          ],
          if (registrationData.gender != null) ...[
            Text(
              '성별: ${registrationData.gender}',
              style: AppTextStyles.bodyMedium(color: AppColors.black),
            ),
            AppSpacing.heightSM,
          ],
          if (registrationData.referralCode != null) ...[
            Text(
              '추천코드: ${registrationData.referralCode}',
              style: AppTextStyles.bodyMedium(color: AppColors.black),
            ),
            AppSpacing.heightSM,
          ],
        ],
      ),
    );
  }

  Widget _buildPetListSection() {
    if (_isPetsLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_petsError != null) {
      return _buildMessageContainer(_petsError!, textColor: AppColors.black);
    }

    if (_pets.isEmpty) {
      return _buildMessageContainer(
        '등록된 반려동물이 없습니다.',
        textColor: AppColors.secondary_color_gray_10,
      );
    }

    return Column(
      children: _pets.map(_buildPetCard).toList(),
    );
  }

  Widget _buildPetCard(Pet pet) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondary_color_gray_1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '종류: ${pet.type == PetType.dog ? '강아지' : '고양이'}',
            style: AppTextStyles.bodyMedium(color: AppColors.black),
          ),
          AppSpacing.heightSM,
          Text(
            '품종: ${pet.breed}',
            style: AppTextStyles.bodyMedium(color: AppColors.black),
          ),
          AppSpacing.heightSM,
          Text(
            '이름: ${pet.name}',
            style: AppTextStyles.bodyMedium(color: AppColors.black),
          ),
          AppSpacing.heightSM,
          Text(
            '성별: ${pet.gender == PetGender.male ? '수컷' : '암컷'}',
            style: AppTextStyles.bodyMedium(color: AppColors.black),
          ),
          AppSpacing.heightSM,
          Text(
            '중성화: ${pet.isNeutered ? '완료' : '미완료'}',
            style: AppTextStyles.bodyMedium(color: AppColors.black),
          ),
          if (pet.birthday != null) ...[
            AppSpacing.heightSM,
            Text(
              '생일: ${pet.birthday}',
              style: AppTextStyles.bodyMedium(color: AppColors.black),
            ),
          ],
          if (pet.weight != null) ...[
            AppSpacing.heightSM,
            Text(
              '몸무게: ${pet.weight}kg',
              style: AppTextStyles.bodyMedium(color: AppColors.black),
            ),
          ],
          if (pet.bodyType != null) ...[
            AppSpacing.heightSM,
            Text(
              '체형: ${_getBodyTypeText(pet.bodyType!)}',
              style: AppTextStyles.bodyMedium(color: AppColors.black),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMessageContainer(String message, {required Color textColor}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondary_color_gray_1,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        message,
        style: AppTextStyles.bodyMedium(color: textColor),
      ),
    );
  }
}
