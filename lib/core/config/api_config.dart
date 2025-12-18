import 'dart:io' show Platform;

/// FastAPI 서버와 통신하기 위한 baseUrl 설정
class ApiConfig {
  /// 기본값: 플랫폼에 따라 자동 설정
  /// iOS: http://localhost:3000
  /// Android: http://10.0.2.2:3000 (에뮬레이터에서 호스트 머신 접근)
  /// 다른 서버 사용 시: flutter run --dart-define=API_BASE_URL=http://내 서버:port
  static String get baseUrl {
    const envUrl = String.fromEnvironment('API_BASE_URL');
    if (envUrl.isNotEmpty) {
      return envUrl;
    }
    
    // 플랫폼별 기본값 설정
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000'; // 안드로이드 에뮬레이터용
    } else {
      return 'http://localhost:3000'; // iOS 시뮬레이터 및 기타 플랫폼
    }
  }
}

