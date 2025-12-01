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
    : super(PetRegistrationInitial(Pet.empty()));

  /// 타입 저장
  void saveType(PetType type) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(type: type);
    emit(PetRegistrationLoaded(updatedPet));
  }

  /// 종 저장
  void saveBreed(String breed) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(breed: breed);
    emit(PetRegistrationLoaded(updatedPet));
  }

  /// 이름 저장
  void saveName(String name) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(name: name);
    emit(PetRegistrationLoaded(updatedPet));
  }

  /// 성별 저장
  void saveGender(PetGender gender) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(gender: gender);
    emit(PetRegistrationLoaded(updatedPet));
  }

  /// 중성화 여부 저장
  void saveIsNeutered(bool isNeutered) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(isNeutered: isNeutered);
    emit(PetRegistrationLoaded(updatedPet));
  }

  /// 생일 저장
  void saveBirthday(String? birthday) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(birthday: birthday);
    emit(PetRegistrationLoaded(updatedPet));
  }

  /// 몸무게 저장
  void saveWeight(double? weight) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(weight: weight);
    emit(PetRegistrationLoaded(updatedPet));
  }

  /// 체형 저장
  void saveBodyType(PetBodyType? bodyType) {
    final currentPet = _getCurrentPet();
    final updatedPet = currentPet.copyWith(bodyType: bodyType);
    emit(PetRegistrationLoaded(updatedPet));
  }

  /// 등록 초기화
  void clearRegistration() {
    emit(PetRegistrationInitial(Pet.empty()));
  }

  /// 반려동물 등록 (Repo에 저장)
  Future<void> completePetRegistration(String userId) async {
    final currentPet = _getCurrentPet();
    emit(PetRegistrationLoading());
    try {
      final savedPet = await repository.registerPet(userId, currentPet);
      emit(PetRegistrationSuccess(savedPet));
    } catch (e) {
      emit(PetRegistrationFailure(e.toString()));
    }
  }

  /// 현재 State에서 Pet 가져오기
  Pet _getCurrentPet() {
    return switch (state) {
      PetRegistrationInitial(pet: final pet) => pet,
      PetRegistrationLoaded(pet: final pet) => pet,
      PetRegistrationLoading() => Pet.empty(),
      PetRegistrationSuccess(pet: final pet) => pet,
      PetRegistrationFailure(message: _) => Pet.empty(),
      _ => Pet.empty(), // 와일드카드 패턴
    };
  }
  /// 품종 목록 조회
  List<String> getBreeds(PetType type) {
    return repository.getBreeds(type);
  }
}

// [*] Sealed class 비활성화
// /// PetRegistrationState: 반려동물 등록 상태
// sealed class PetRegistrationState {}
// /// 초기 상태 (빈 Pet 객체 포함)
// final class PetRegistrationInitial extends PetRegistrationState {
//   final Pet pet;
//   PetRegistrationInitial(this.pet);
// }
// /// 등록 중 (Pet 정보 포함)
// final class PetRegistrationLoaded extends PetRegistrationState {
//   final Pet pet;
//   PetRegistrationLoaded(this.pet);
// }
// /// 로딩 중
// final class PetRegistrationLoading extends PetRegistrationState {}
// /// 등록 성공
// final class PetRegistrationSuccess extends PetRegistrationState {
//   final Pet pet;
//   PetRegistrationSuccess(this.pet);
// }
// /// 등록 실패
// final class PetRegistrationFailure extends PetRegistrationState {
//   final String message;
//   PetRegistrationFailure(this.message);
// }

@freezed // union type 방식 (sealed class와 유사)
class PetRegistrationState with _$PetRegistrationState {
  const factory PetRegistrationState.initial(Pet pet) = PetRegistrationInitial;
  const factory PetRegistrationState.loaded(Pet pet) = PetRegistrationLoaded;
  const factory PetRegistrationState.loading() = PetRegistrationLoading;
  const factory PetRegistrationState.success(Pet pet) = PetRegistrationSuccess;
  const factory PetRegistrationState.failure(String message) = PetRegistrationFailure;
}