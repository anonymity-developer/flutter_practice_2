import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/pet_registration_repository.dart';
import '../models.dart';

/// PetRegistrationCubit: 반려동물 등록 상태 관리
class PetRegistrationCubit extends Cubit<PetRegistrationState> {
  final PetRegistrationRepository repository;

  PetRegistrationCubit(this.repository) : super(PetRegistrationInitial());

  /// 반려동물 등록 시작 (타입 선택)
  void startPetRegistration(PetType type) {
    final pet = Pet(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: type,
      breed: '',
      name: '',
      gender: PetGender.male,
      isNeutered: false,
    );
    emit(PetRegistrationLoaded(pet));
  }

  /// 종 업데이트
  void updateBreed(String breed) {
    final currentPet = _getCurrentPet();
    if (currentPet != null) {
      final updatedPet = currentPet.copyWith(breed: breed);
      emit(PetRegistrationLoaded(updatedPet));
    }
  }

  /// 이름 업데이트
  void updateName(String name) {
    final currentPet = _getCurrentPet();
    if (currentPet != null) {
      final updatedPet = currentPet.copyWith(name: name);
      emit(PetRegistrationLoaded(updatedPet));
    }
  }

  /// 성별 업데이트
  void updateGender(PetGender gender) {
    final currentPet = _getCurrentPet();
    if (currentPet != null) {
      final updatedPet = currentPet.copyWith(gender: gender);
      emit(PetRegistrationLoaded(updatedPet));
    }
  }

  /// 중성화 여부 업데이트
  void updateIsNeutered(bool isNeutered) {
    final currentPet = _getCurrentPet();
    if (currentPet != null) {
      final updatedPet = currentPet.copyWith(isNeutered: isNeutered);
      emit(PetRegistrationLoaded(updatedPet));
    }
  }

  /// 생일 업데이트
  void updateBirthday(String? birthday) {
    final currentPet = _getCurrentPet();
    if (currentPet != null) {
      final updatedPet = currentPet.copyWith(birthday: birthday);
      emit(PetRegistrationLoaded(updatedPet));
    }
  }

  /// 몸무게 업데이트
  void updateWeight(double? weight) {
    final currentPet = _getCurrentPet();
    if (currentPet != null) {
      final updatedPet = currentPet.copyWith(weight: weight);
      emit(PetRegistrationLoaded(updatedPet));
    }
  }

  /// 체형 업데이트
  void updateBodyType(PetBodyType? bodyType) {
    final currentPet = _getCurrentPet();
    if (currentPet != null) {
      final updatedPet = currentPet.copyWith(bodyType: bodyType);
      emit(PetRegistrationLoaded(updatedPet));
    }
  }

  /// 등록 초기화
  void clearRegistration() {
    emit(PetRegistrationInitial());
  }

  /// 반려동물 등록 완료 (API 연동 시 Repository ↔ DataSource 연결)
  Future<void> completeRegistration() async {
    final currentPet = _getCurrentPet();
    if (currentPet != null) {
      emit(PetRegistrationLoading());
      try {
        final savedPet = await repository.registerPet(currentPet);
        emit(PetRegistrationSuccess(savedPet));
      } catch (e) {
        emit(PetRegistrationFailure(e.toString()));
      }
    }
  }

  /// 현재 State에서 Pet 가져오기
  Pet? _getCurrentPet() {
    if (state is PetRegistrationLoaded) {
      return (state as PetRegistrationLoaded).pet;
    }
    return null;
  }
}

/// PetRegistrationState: 반려동물 등록 상태
abstract class PetRegistrationState {}

/// 초기 상태
class PetRegistrationInitial extends PetRegistrationState {}

/// 등록 중 (Pet 정보 포함)
class PetRegistrationLoaded extends PetRegistrationState {
  final Pet pet;

  PetRegistrationLoaded(this.pet);
}

/// 로딩 중
class PetRegistrationLoading extends PetRegistrationState {}

/// 등록 성공
class PetRegistrationSuccess extends PetRegistrationState {
  final Pet pet;

  PetRegistrationSuccess(this.pet);
}

/// 등록 실패
class PetRegistrationFailure extends PetRegistrationState {
  final String message;

  PetRegistrationFailure(this.message);
}

