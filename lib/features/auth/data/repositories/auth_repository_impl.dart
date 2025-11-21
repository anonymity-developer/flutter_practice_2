import '../../domain/entities/user.dart';
import '../../domain/entities/signup_data.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../models/user_model.dart';
import '../models/signup_data_model.dart';

/// Repository Implementation: Domain의 Repository 인터페이스 구현
/// - DataSource를 사용하여 실제 데이터 처리
/// - Model을 Entity로 변환하여 Domain 레이어에 반환
class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.localDataSource);

  @override
  Future<User> signUp({
    required String email,
    required String password,
    required String name,
    String? phone,
  }) async {
    // 실제로는 여기서 API 호출 후 로컬 저장
    // 예시: 간단하게 로컬에만 저장
    final userModel = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      email: email,
      name: name,
      phone: phone,
    );

    // 로컬에 저장
    await localDataSource.saveUser(userModel);
    
    // Entity로 변환하여 반환
    return userModel.toEntity();
  }

  @override
  Future<User?> getSavedUser() async {
    final userModel = await localDataSource.getSavedUser();
    return userModel?.toEntity();
  }

  @override
  Future<void> clearUser() async {
    await localDataSource.clearUser();
  }

  @override
  Future<void> saveSignupData(SignupData data) async {
    final dataModel = SignupDataModel.fromEntity(data);
    await localDataSource.saveSignupData(dataModel);
  }

  @override
  Future<SignupData?> getSignupData() async {
    final dataModel = await localDataSource.getSignupData();
    return dataModel?.toEntity();
  }

  @override
  Future<void> clearSignupData() async {
    await localDataSource.clearSignupData();
  }
}

