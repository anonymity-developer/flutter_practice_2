import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/features/user_registration/repository/user_registration_repository.dart';
import 'package:flutter_application_2/features/pet_registration/repository/pet_registration_repository.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'package:flutter_application_2/features/pet_registration/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

part 'main_screen_cubit.freezed.dart';

/// MainScreenCubit: 메인 화면 상태 관리
class MainScreenCubit extends Cubit<MainScreenState> {
  final UserRegistrationRepository userRegistrationRepository;
  final PetRegistrationRepository petRegistrationRepository;
  String? _currentUserId;

  /// Stream 구독 관리
  StreamSubscription<String>? _userUpdateSubscription;
  StreamSubscription<String>? _petUpdateSubscription;

  MainScreenCubit(
    this.userRegistrationRepository,
    this.petRegistrationRepository,
  ) : super(
        const MainScreenState(
          userData: UserRegistrationData(),
          pets: [],
          isLoading: false,
        ),
      ) {
    _userUpdateSubscription = userRegistrationRepository.userUpdates.listen((
      userId,
    ) {
      if (_currentUserId == userId) {
        refreshUser(userId);
      }
    });
    _petUpdateSubscription = petRegistrationRepository.petUpdates.listen((
      userId,
    ) {
      if (_currentUserId == userId) {
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
    if (_currentUserId != userId) {
      _currentUserId = userId;
    }

    emit(state.copyWith(isLoading: true, error: null));


    try {
      final userData = await userRegistrationRepository.getUserDataByUserId(userId);
      final pets = await petRegistrationRepository.getPetDataByUserId(userId);

      emit(
        state.copyWith(
          isLoading: false,
          userData: userData ?? const UserRegistrationData(),
          pets: pets,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// 상태 초기화 (로그아웃)
  void reset() {
    _currentUserId = null;
    emit(
      const MainScreenState(
        userData: UserRegistrationData(),
        pets: [],
        isLoading: false,
      ),
    );
  }

  /// 유저 등록 정보 새로고침
  Future<void> refreshUser(String userId) async {
    try {
      final userData = await userRegistrationRepository.getUserDataByUserId(
        userId,
      );
      emit(
        state.copyWith(
          userData: userData ?? const UserRegistrationData(),
          error: null,
        ),
      );
    } catch (e) {
      // refresh 실패해도 기존 상태 유지 (에러만 설정)
      emit(state.copyWith(error: e.toString()));
    }
  }

  /// 펫 리스트 새로고침
  Future<void> refreshPets(String userId) async {
    try {
      final pets = await petRegistrationRepository.getPetDataByUserId(userId);

      emit(state.copyWith(pets: pets, error: null));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}

// [*] Sealed class 비활성화
// sealed class MainState {}
// final class MainScreenInitial extends MainState {}
// final class MainScreenLoading extends MainState {}
// final class MainScreenSuccess extends MainState {
//   final UserRegistrationData userData;
//   final List<Pet> pets;
//   MainScreenSuccess(this.userData, this.pets);
// }
// final class MainScreenFailure extends MainState {
//   final String message;

//   MainScreenFailure(this.message);
// }

@freezed // 내부에서 EqualUnmodifiableListView로 감싸줌
class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    @Default(UserRegistrationData()) UserRegistrationData userData,
    @Default(<Pet>[]) List<Pet> pets,
    @Default(false) bool isLoading,
    String? error,
  }) = _MainScreenState;
}
