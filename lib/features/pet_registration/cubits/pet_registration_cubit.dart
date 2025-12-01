import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/pet_registration_repository.dart';
import '../models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_registration_cubit.freezed.dart';

/// PetRegistrationCubit: 반려동물 등록 상태 관리
class PetRegistrationCubit extends Cubit<PetRegistrationState> {
  final PetRegistrationRepository repository;

  // 초기 상태에 빈 Pet 객체 포함
  PetRegistrationCubit(this.repository) 
    : super(const PetRegistrationState(pet: null));

  /// 타입 저장
  void saveType(PetType type) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(type: type);
    emit(state.copyWith(pet: updatedPet, isLoading: false, error: null));
  }

  /// 종 저장
  void saveBreed(String breed) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(breed: breed);
    emit(state.copyWith(pet: updatedPet, isLoading: false, error: null));
  }

  /// 이름 저장
  void saveName(String name) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(name: name);
    emit(state.copyWith(pet: updatedPet, isLoading: false, error: null));
  }

  /// 성별 저장
  void saveGender(PetGender gender) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(gender: gender);
    emit(state.copyWith(pet: updatedPet, isLoading: false, error: null));
  }

  /// 중성화 여부 저장
  void saveIsNeutered(bool isNeutered) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(isNeutered: isNeutered);
    emit(state.copyWith(pet: updatedPet, isLoading: false, error: null));
  }

  /// 생일 저장
  void saveBirthday(String? birthday) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(birthday: birthday);
    emit(state.copyWith(pet: updatedPet, isLoading: false, error: null));
  }

  /// 몸무게 저장
  void saveWeight(double? weight) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(weight: weight);
    emit(state.copyWith(pet: updatedPet, isLoading: false, error: null));
  }

  /// 체형 저장
  void saveBodyType(PetBodyType? bodyType) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(bodyType: bodyType);
    emit(state.copyWith(pet: updatedPet, isLoading: false, error: null));
  }

  /// 등록 초기화
  void clearRegistration() {
    emit(const PetRegistrationState(pet: null));
  }

  /// 반려동물 등록 (Repo에 저장)
  Future<void> completePetRegistration(String userId) async {
    final currentPet = _getCurrentPet();
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final savedPet = await repository.registerPet(userId, currentPet);
      emit(state.copyWith(pet: savedPet, isLoading: false, error: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// 현재 State에서 Pet 가져오기
  Pet _getCurrentPet() {
    return state.pet ?? Pet.empty();
  }
  /// 품종 목록 조회
  List<String> getBreeds(PetType type) {
    return repository.getBreeds(type);
  }
}

@freezed // flag-based 방식
class PetRegistrationState with _$PetRegistrationState {
  const factory PetRegistrationState({
    Pet? pet,
    @Default(false) bool isLoading,
    String? error,
  }) = _PetRegistrationState;
}