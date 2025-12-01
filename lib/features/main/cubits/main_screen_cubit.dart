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

  // 생성자: 초기 상태만 설정, 구독은 loadData에서 시작
  MainScreenCubit(
    this.userRegistrationRepository,
    this.petRegistrationRepository,
  ) : super(
        const MainScreenState(
          userData: UserRegistrationData(),
          pets: [],
          isLoading: false,
        ),
      );

  /// 스트림 구독 시작/재시작
  /// BehaviorSubject의 마지막 값 캐싱:
  /// - 구독 시작 시 BehaviorSubject가 마지막 값을 즉시 emit
  /// - where 필터로 현재 유저의 이벤트만 처리
  /// - switchMap으로 요청 버전 관리 (이전 요청 취소, 마지막 것만 처리)
  void _startSubscriptions() {
    // 기존 구독 취소 (유저 변경 시 재구독을 위해)
    _userUpdateSubscription?.cancel();
    _petUpdateSubscription?.cancel();

    if (_currentUserId == null) {
      // 로그아웃 상태면 구독하지 않음 (위젯은 유지)
      return;
    }

    // switchMap으로 요청 버전 관리: 이전 요청 취소하고 마지막 것만 처리
    _userUpdateSubscription = userRegistrationRepository.userUpdates
        .where((userId) => userId != null && _currentUserId == userId)
        .switchMap(
          (userId) => Stream.fromFuture(
            userRegistrationRepository.getUserByUserId(userId!),
          ),
        ) // 새 이벤트 들어오면 이전 future 스트림 구독 끊음. 마지막 요청 응답만 listen까지 도달
        .listen(
          (userData) {
            emit(
              state.copyWith(
                userData: userData ?? const UserRegistrationData(),
                error: null,
                isLoading: false,
              ),
            );
          },
          onError: (e) {
            emit(state.copyWith(error: e.toString(), isLoading: false));
          },
        );

    _petUpdateSubscription = petRegistrationRepository.petUpdates
        .where((userId) => userId != null && _currentUserId == userId)
        .switchMap(
          (userId) => Stream.fromFuture(
            petRegistrationRepository.getPetDataByUserId(userId!),
          ),
        )
        .listen(
          (pets) {
            emit(state.copyWith(pets: pets, error: null, isLoading: false));
          },
          onError: (e) {
            emit(state.copyWith(error: e.toString(), isLoading: false));
          },
        );
  }

  @override
  Future<void> close() {
    _userUpdateSubscription?.cancel();
    _petUpdateSubscription?.cancel();
    return super.close();
  }

  /// 유저 등록 정보 및 펫 리스트 로드 - 초기 로드도 스트림으로 처리
  /// BehaviorSubject를 통한 스트림 기반 데이터 로드

  Future<void> loadData(String userId) async {
    if (_currentUserId == userId && state.isLoading) {
      return;
    }

    // 유저 변경 시에만 구독 재시작
    final isUserChanged = _currentUserId != userId;
    _currentUserId = userId;

    emit(state.copyWith(isLoading: true, error: null));

    // 유저가 변경되었거나 구독이 없으면 구독 시작
    if (isUserChanged || _userUpdateSubscription == null) {
      _startSubscriptions();
    }

    // 스트림을 통해 데이터 로드 트리거 (BehaviorSubject 활용)
    userRegistrationRepository.triggerUpdate(userId);
    petRegistrationRepository.triggerUpdate(userId);

    // 여기서는 await하지 않음
    // 스트림을 통해 비동기로 처리되므로, listen 콜백에서 emit이 발생함
    // 로딩 상태는 listen 콜백에서 false로 변경됨
  }

  /// 상태 초기화 (로그아웃)
  /// 위젯은 유지하되, 구독만 취소하고 상태만 초기화
  void reset() {
    // 구독 취소
    _userUpdateSubscription?.cancel();
    _petUpdateSubscription?.cancel();
    _userUpdateSubscription = null;
    _petUpdateSubscription = null;

    _currentUserId = null;

    // 민감한 데이터 초기화
    emit(
      const MainScreenState(
        userData: UserRegistrationData(),
        pets: [],
        isLoading: false,
      ),
    );
  }


  // [*] 메인 수동 새로 고침

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
