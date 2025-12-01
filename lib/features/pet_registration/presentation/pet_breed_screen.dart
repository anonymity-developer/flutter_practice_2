import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:flutter_application_2/core/theme/app_colors.dart';
import 'package:flutter_application_2/core/theme/app_text_styles.dart';
import 'package:flutter_application_2/core/constants/app_spacing.dart';
import 'package:flutter_application_2/core/constants/app_assets.dart';
import 'package:go_router/go_router.dart';
import '../models.dart';
import '../cubits/pet_registration_cubit.dart';

class PetBreedScreen extends StatelessWidget {
  const PetBreedScreen({super.key});

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
              
              BlocBuilder<PetRegistrationCubit, PetRegistrationState>(
                builder: (context, state) {
                  final selectedType = state.pet?.type;
                  final petTypeText = selectedType == PetType.dog ? '강아지' : '고양이';
                  
                  return Text(
                    '$petTypeText 종을 선택해 주세요',
                    style: AppTextStyles.h3(
                      color: AppColors.black,
                    ),
                  );
                },
              ),
              
              AppSpacing.heightXL,
              
              Expanded(
                child: BlocBuilder<PetRegistrationCubit, PetRegistrationState>(
                  builder: (context, state) {
                    final currentPet = state.pet;
                    if (currentPet == null || currentPet.type == null) {
                      return const Center(child: Text('타입을 먼저 선택해주세요'));
                    }
                    final selectedType = currentPet.type;
                    final selectedBreed = currentPet.breed;
                    final isButtonEnabled = selectedBreed.isNotEmpty;
                    
                    return Column(
                      children: [
                        // 선택한 타입 표시 카드 (큰 카드)
                        _buildPetTypeCard(selectedType!),
                        
                        AppSpacing.heightXL,
                        
                        // 종 선택 필드
                        _buildBreedSelector(
                          context: context,
                          type: selectedType,
                          selectedBreed: selectedBreed.isEmpty ? null : selectedBreed,
                          onBreedSelected: (breed) {
                            context.read<PetRegistrationCubit>().saveBreed(breed);
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
                                    context.push('/pet_registration/name_and_gender');
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

  // 선택한 타입 표시 카드
  Widget _buildPetTypeCard(PetType type) {
    final isDog = type == PetType.dog;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.secondary_color_gray_2,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 아이콘을 위에 크게 배치
          SvgPicture.asset(
            isDog ? AppAssets.icDog : AppAssets.icCat,
            width: 80,
            height: 80,
          ),
          AppSpacing.heightMD,
          // 텍스트를 아래에 배치
          Text(
            isDog ? '강아지' : '고양이',
            style: AppTextStyles.h2(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  // 종 선택 필드
  Widget _buildBreedSelector({
    required BuildContext context,
    required PetType type,
    String? selectedBreed,
    required Function(String) onBreedSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        // TextField로 변경 - 클릭 시 모달 열기
        TextField(
          controller: TextEditingController(text: selectedBreed),
          readOnly: true,
          decoration: InputDecoration(
            hintText: '${type == PetType.dog ? '강아지' : '고양이'} 종 입력',
            hintStyle: AppTextStyles.bodyMedium(
              color: AppColors.secondary_color_gray_4,
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
          style: AppTextStyles.bodyMedium(
            color: AppColors.black,
          ),
          onTap: () {
            _showBreedModal(context, type, selectedBreed, onBreedSelected);
          },
        ),
      ],
    );
  }

  // 종 선택 모달
  void _showBreedModal(
    BuildContext context,
    PetType type,
    String? selectedBreed,
    Function(String) onBreedSelected,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _BreedSelectionModal(
        type: type,
        selectedBreed: selectedBreed,
        onBreedSelected: (breed) {
          onBreedSelected(breed);
          context.pop();
        },
      ),
    );
  }
}

// 종 선택 모달 위젯
class _BreedSelectionModal extends StatefulWidget {
  final PetType type;
  final String? selectedBreed;
  final Function(String) onBreedSelected;

  const _BreedSelectionModal({
    required this.type,
    this.selectedBreed,
    required this.onBreedSelected,
  });

  @override
  State<_BreedSelectionModal> createState() => _BreedSelectionModalState();
}

class _BreedSelectionModalState extends State<_BreedSelectionModal> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredBreeds = [];
  List<String>? _allBreeds;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterBreeds);
  }

  void _initializeBreeds(BuildContext context) {
    if (_allBreeds == null) {
      final cubit = context.read<PetRegistrationCubit>();
      _allBreeds = cubit.getBreeds(widget.type);
      _filteredBreeds = List.from(_allBreeds!);
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterBreeds);
    _searchController.dispose();
    super.dispose();
  }

  void _filterBreeds() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredBreeds = List.from(_allBreeds ?? []);
      } else {
        _filteredBreeds = (_allBreeds ?? [])
            .where((breed) => breed.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _initializeBreeds(context);
    final petTypeText = widget.type == PetType.dog ? '강아지' : '고양이';
    
    return Container(
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
                  '반려동물 등록',
                  style: AppTextStyles.h3(
                    color: AppColors.black,
                  ),
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
          
          // 검색 바
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: '$petTypeText 종 입력',
                hintStyle: AppTextStyles.bodyMedium(
                  color: AppColors.secondary_color_gray_4,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.secondary_color_gray_7,
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: AppColors.secondary_color_gray_7,
                        ),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                          });
                        },
                      )
                    : null,
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
              style: AppTextStyles.bodyMedium(
                color: AppColors.black,
              ),
            ),
          ),
          
          // 종 리스트
          Expanded(
            child: _filteredBreeds.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '앗 찾을 수 없어요.',
                          style: AppTextStyles.bodyMedium(
                            color: AppColors.secondary_color_gray_7,
                          ),
                        ),
                        AppSpacing.heightSM,
                        Text(
                          '다른 키워드로 검색해 보세요.',
                          style: AppTextStyles.bodySmall(
                            color: AppColors.secondary_color_gray_5,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 검색어가 없을 때 "제안" 섹션 표시
                      if (_searchController.text.isEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Text(
                            '제안',
                            style: AppTextStyles.bodyMedium(
                              color: AppColors.secondary_color_gray_7,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: _filteredBreeds.length,
                          itemBuilder: (context, index) {
                            final breed = _filteredBreeds[index];
                            final isSelected = breed == widget.selectedBreed;
                            
                            return InkWell(
                              onTap: () => widget.onBreedSelected(breed),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.secondary_color_gray_1
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
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
                                    Text(
                                      breed,
                                      style: AppTextStyles.bodyMedium(
                                        color: AppColors.black,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}