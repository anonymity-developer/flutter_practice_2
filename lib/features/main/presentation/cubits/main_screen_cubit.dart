import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/features/user_registration/repository/user_registration_repository.dart';
import 'package:flutter_application_2/features/pet_registration/repository/pet_registration_repository.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'package:flutter_application_2/features/pet_registration/models.dart';
import 'dart:async';

/// MainScreenCubit: 메인 상태 관리
class MainScreenCubit extends Cubit<MainState> {
  final UserRegistrationRepository userRegistrationRepository;
  final PetRegistrationRepository petRegistrationRepository;
  String? _currentUserId;

  /// Stream 구독 관리
  StreamSubscription<String>? _userUpdateSubscription;
  StreamSubscription<String>? _petUpdateSubscription;

  MainScreenCubit(this.userRegistrationRepository, this.petRegistrationRepository) : super(MainScreenInitial()) {
    _userUpdateSubscription = userRegistrationRepository.userUpdates.listen((userId) {
      if (_currentUserId == userId && state is MainScreenSuccess) {
        refreshUser(userId);
      }
    });
    _petUpdateSubscription = petRegistrationRepository.petUpdates.listen((userId) {
      if (_currentUserId == userId && state is MainScreenSuccess) {
        refreshPets(userId);
      }
    });
  }

  @override
  Future<void> close() {
    _userUpdateSubscription?.cancel();
    _petUpdateSubscription?.cancel();
    return super.close();
  }

  /// 유저 등록 정보 및 펫 리스트 로드
  Future<void> loadData(String userId) async {
    if (_currentUserId != userId || state is MainScreenInitial) {
      _currentUserId = userId;
      emit(MainScreenLoading());
    }

    try {
      final userData = await userRegistrationRepository.getUserDataByUserId(userId);
      final pets = await petRegistrationRepository.getPetDataByUserId(userId);

      emit(MainScreenSuccess(userData ?? const UserRegistrationData(), pets));
    } catch (e) {
      emit(MainScreenFailure(e.toString()));
    }
  }

  /// 상태 초기화 (로그아웃)
  void reset() {
    _currentUserId = null;
    emit(MainScreenInitial());
  }

  /// 유저 등록 정보 새로고침
  Future<void> refreshUser(String userId) async {
    try {
      final userData = await userRegistrationRepository.getUserDataByUserId(
        userId,
      );
      final currentState = state;
      if (currentState is MainScreenSuccess) {
        emit(
          MainScreenSuccess(
            userData ?? const UserRegistrationData(),
            currentState.pets,
          ),
        );
      }
    } catch (e) {
      emit(MainScreenFailure(e.toString()));
    }
  }

  /// 펫 리스트 새로고침
  Future<void> refreshPets(String userId) async {
    try {
      final pets = await petRegistrationRepository.getPetDataByUserId(userId);
      final currentState = state;
      if (currentState is MainScreenSuccess) {
        emit(MainScreenSuccess(currentState.userData, pets));
      }
    } catch (e) {
      emit(MainScreenFailure(e.toString()));
    }
  }

}

/// MainState: 메인 상태
sealed class MainState {}

/// 초기 상태
final class MainScreenInitial extends MainState {}

/// 로딩 중
final class MainScreenLoading extends MainState {}

/// 성공 상태
final class MainScreenSuccess extends MainState {
  final UserRegistrationData userData;
  final List<Pet> pets;

  MainScreenSuccess(this.userData, this.pets);
}

/// 실패 상태
final class MainScreenFailure extends MainState {
  final String message;

  MainScreenFailure(this.message);
}
