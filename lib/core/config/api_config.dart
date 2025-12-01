/// FastAPI 서버와 통신하기 위한 baseUrl 설정
class ApiConfig {
  /// 기본값: http://localhost:3000
  /// 다른 서버 사용 시: flutter run --dart-define=API_BASE_URL=http://내 서버:port
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:3000',
  );
}

