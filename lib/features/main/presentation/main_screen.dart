import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import 'package:flutter_application_2/features/login/cubits/login_cubit.dart';
import 'package:flutter_application_2/features/pet_registration/models.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_application_2/features/main/cubits/main_screen_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        // 상태 변경 시 listener 호출할 지 결정 -> 지금은 user.id가 변경될 때만 true
        return previous.user?.id != current.user?.id;
      },
      listener: (context, loginState) {
        // 상태 변경 시에만 호출
        if (loginState.user != null) {
          // 로그인 성공 시 데이터 로드
          context.read<MainScreenCubit>().loadData(loginState.user!.id);
        }

        if (loginState.user == null) {
          // 로그아웃 시 상태 초기화
          context.read<MainScreenCubit>().reset();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/login/social'),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, loginState) {
              if (loginState.user == null || loginState.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final user = loginState.user!;

              return BlocBuilder<MainScreenCubit, MainScreenState>(
                builder: (context, state) {
                  // BlocListener에서 이미 loadData를 호출
                  // (BlocListener의 listenWhen으로 user.id 변경 시에만 호출됨)

                  // 로딩 중
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // 에러 상태
                  if (state.error != null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.error!,
                            style: AppTextStyles.bodyMedium(
                              color: AppColors.black,
                            ),
                          ),
                          AppSpacing.heightMD,
                          ElevatedButton(
                            onPressed: () {
                              context.read<MainScreenCubit>().loadData(user.id);
                            },
                            child: const Text('다시 시도'),
                          ),
                        ],
                      ),
                    );
                  }

                  // 성공 상태
                  final userRegistrationData = state.userData;
                  final pets = state.pets;

                  return SingleChildScrollView(
                    child: Padding(
                      padding: AppSpacing.paddingHorizontalLG,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSpacing.heightLG,
                          Text(
                            '${userRegistrationData.nickname}님 안녕하세요!',
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

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '앱 등록 정보',
                                style: AppTextStyles.bodyLarge(
                                  color: AppColors.secondary_color_gray_10,
                                ),
                              ),

                              TextButton(
                                onPressed: () {
                                  context.push('/user_registration');
                                  // [*] 메인 수동 새로 고침
                                  // if (!context.mounted) return;
                                  // final loginState = context.read<LoginCubit>().state;
                                  // if (loginState is LoginSuccess) {
                                  //   context.read<MainScreenCubit>()
                                  //       .refreshUser(loginState.user.id);
                                  // }
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  '+ 등록 수정',
                                  style: AppTextStyles.bodyMedium(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppSpacing.heightXS,

                          _buildUserRegistrationSection(userRegistrationData),

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
                                  await context.push('/pet_registration/type');

                                  // [*] 메인 수동 새로 고침
                                  // if (!context.mounted) return;
                                  // final state = context.read<MainScreenCubit>().state;
                                  // switch (state) {
                                  //   case MainScreenSuccess():
                                  //     context.read<MainScreenCubit>().refreshPets(loginState.user.id);
                                  //   case MainScreenFailure(message: final message):
                                  //     ScaffoldMessenger.of(context).showSnackBar(
                                  //       SnackBar(content: Text(message)),
                                  //     );
                                  //   case MainScreenInitial():
                                  //   case MainScreenLoading():
                                  //     break;
                                  // }
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
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

                          _buildPetListSection(pets.cast<Pet>()),

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
                },
              );
            },
          ),
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

  Widget _buildUserRegistrationSection(UserRegistrationData registrationData) {
    if (registrationData.nickname == null &&
        registrationData.birthday == null &&
        registrationData.gender == null &&
        !registrationData.serviceTerms &&
        !registrationData.privacyPolicy) {
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

  Widget _buildPetListSection(List<Pet> pets) {
    if (pets.isEmpty) {
      return _buildMessageContainer(
        '등록된 반려동물이 없습니다.',
        textColor: AppColors.secondary_color_gray_10,
      );
    }

    return Column(children: pets.map(_buildPetCard).toList());
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
      child: Text(message, style: AppTextStyles.bodyMedium(color: textColor)),
    );
  }
}
