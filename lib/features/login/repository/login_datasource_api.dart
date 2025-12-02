import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/api/login_api.dart';
import 'package:flutter_application_2/core/config/api_config.dart';
import '../models.dart';
import 'login_datasource.dart';


class LoginDataSourceApi implements LoginDataSource {
  final LoginApi _api;

  LoginDataSourceApi()
      : _api = LoginApi(
          Dio(BaseOptions(
            baseUrl: ApiConfig.baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          )),
        );

  /// 로그인
  @override
  Future<User?> findUserByCredentials(String userId, String password) async {
    try {
      final user = await _api.login({
        'userId': userId,
        'password': password,
      });
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 404) {
        return null;
      }
      throw Exception('로그인 실패: ${e.message}');
    } catch (e) {
      throw Exception('로그인 실패: $e');
    }
  }

  /// 회원가입
  @override
  Future<User> register(String userId, String password, {String? phone}) async {
    try {
      final user = await _api.register({
        'userId': userId,
        'password': password,
        if (phone != null) 'phone': phone
      });
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception('이미 존재하는 사용자입니다.');
      }
      throw Exception('회원가입 실패: ${e.message}');
    } catch (e) {
      throw Exception('회원가입 실패: $e');
    }
  }
}
