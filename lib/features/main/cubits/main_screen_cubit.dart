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
  
  /// 스트림 구독 시작 (loadData에서 호출)
  /// BehaviorSubject의 마지막 값 캐싱 활용:
  /// - _currentUserId 설정 후 구독 시작하면, BehaviorSubject가 마지막으로 emit한 값이 즉시 전달됨
  /// - 이전에 데이터 변경이 있었다면, 구독 시작과 동시에 자동으로 최신 데이터를 가져옴
  void _startSubscriptions() {
    // 기존 구독 취소 (유저 변경 시 재구독을 위해)
    _userUpdateSubscription?.cancel();
    _petUpdateSubscription?.cancel();
    
    print('[MainScreenCubit] 스트림 구독 시작');
    print('  - _currentUserId: $_currentUserId');
    print('  - BehaviorSubject 마지막 값: user=${userRegistrationRepository.userUpdates}, pet=${petRegistrationRepository.petUpdates}');
    
    // 잔디 테스트
     
    // switchMap으로 요청 버전 관리: 이전 요청 취소하고 마지막 것만 처리
    // BehaviorSubject의 마지막 값이 있으면, 구독 시작 시 즉시 emit됨
    _userUpdateSubscription = userRegistrationRepository.userUpdates
        .where((userId) {
          final passed = userId != null && _currentUserId == userId;
          return passed;
        })
        .switchMap(
          (userId) => Stream.fromFuture(
            userRegistrationRepository.getUserDataByUserId(userId!),
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
        .where((userId) {
          final passed = userId != null && _currentUserId == userId;
          return passed;
        })
        .switchMap(
          (userId) => Stream.fromFuture(
            petRegistrationRepository.getPetDataByUserId(userId!),
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
  /// BehaviorSubject 사용 흐름:
  /// 1. _currentUserId 설정
  /// 2. 스트림 구독 시작 (이때 BehaviorSubject의 마지막 값이 있으면 즉시 emit됨)
  /// 3. 초기 데이터 로드 (구독이 이미 시작되어 있으므로, 이후 변경사항은 자동으로 처리됨)
  Future<void> loadData(String userId) async {
    final wasDifferentUser = _currentUserId != userId;
    _currentUserId = userId;

    emit(state.copyWith(isLoading: true, error: null));
    _startSubscriptions();
    
    try {
      // 초기 데이터 로드
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
      
      // 이후 데이터 변경은 스트림을 통해 자동으로 처리됨
      // (BehaviorSubject가 새로운 이벤트를 emit하면, switchMap이 자동으로 최신 데이터를 가져옴)
      if (wasDifferentUser) {
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// 상태 초기화 (로그아웃)
  void reset() {
    // 구독 취소
    _userUpdateSubscription?.cancel();
    _petUpdateSubscription?.cancel();
    _userUpdateSubscription = null;
    _petUpdateSubscription = null;
    

  
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
