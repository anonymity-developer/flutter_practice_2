import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/features/user_registration/repository/user_registration_repository.dart';
import 'package:flutter_application_2/features/pet_registration/repository/pet_registration_repository.dart';
import 'package:flutter_application_2/features/user_registration/models.dart';
import 'package:flutter_application_2/features/pet_registration/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

part 'main_screen_cubit.freezed.dart';

/// MainScreenCubit: 메인 화면 상태 관리
class MainScreenCubit extends Cubit<MainScreenState> {
  final UserRegistrationRepository userRegistrationRepository;
  final PetRegistrationRepository petRegistrationRepository;
  String? _currentUserId;

  /// Stream 구독 관리
  StreamSubscription<UserRegistrationData?>? _userUpdateSubscription;
  StreamSubscription<List<Pet>>? _petUpdateSubscription;

  // 생성자에서 하는 일: 스트림 구독 + 타이밍 관리
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
    // switchMap으로 요청 버전 관리: 이전 요청 취소하고 마지막 것만 처리
    // listen에서만 emit하므로, switchMap이 이전 Stream을 취소하면 emit도 안 됨
    _userUpdateSubscription = userRegistrationRepository.userUpdates
        .where((userId) => _currentUserId == userId) // 현재 유저만 필터링
        .switchMap(
          (userId) => Stream.fromFuture(
            userRegistrationRepository.getUserDataByUserId(userId),
          ),
        ) // 새 이벤트 들어오면 이전 future 스트림 구독 끊음. 마지막 요청 응답만 listen까지 도달
        .listen(
          (userData) {
            emit(
              state.copyWith(
                userData: userData ?? const UserRegistrationData(),
                error: null,
              ),
            );
          },
          onError: (e) {
            emit(state.copyWith(error: e.toString()));
          },
        );

    _petUpdateSubscription = petRegistrationRepository.petUpdates
        .where((userId) => _currentUserId == userId) // 현재 유저만 필터링
        .switchMap(
          (userId) => Stream.fromFuture(
            petRegistrationRepository.getPetDataByUserId(userId),
          ),
        )
        .listen(
          (pets) {
            emit(state.copyWith(pets: pets, error: null));
          },
          onError: (e) {
            emit(state.copyWith(error: e.toString()));
          },
        );
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
      final userData = await userRegistrationRepository.getUserDataByUserId(userId, );
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

  // [*] 메인 수동 새로 고침 - 스트림 기반 자동 새로고침 사용 중임으로 현재 불필요

  // /// 유저 등록 정보 새로고침
  // Future<void> refreshUser(String userId) async {
  //   try {
  //     final userData = await userRegistrationRepository.getUserDataByUserId(
  //       userId,
  //     );
  //     emit(
  //       state.copyWith(
  //         userData: userData ?? const UserRegistrationData(),
  //         error: null,
  //       ),
  //     );
  //   } catch (e) {
  //     emit(state.copyWith(error: e.toString()));
  //   }
  // }

  // /// 펫 리스트 새로고침
  // Future<void> refreshPets(String userId) async {
  //   try {
  //     final pets = await petRegistrationRepository.getPetDataByUserId(userId);
  //     emit(state.copyWith(pets: pets, error: null));
  //   } catch (e) {
  //     emit(state.copyWith(error: e.toString()));
  //   }
  // }
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
