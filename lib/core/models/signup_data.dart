// 싱글톤 패턴
// - 앱 전체에서 단 하나의 인스턴스만 존재하도록 보장하는 디자인 패턴
// - 어디서든 같은 데이터에 접근할 수 있음

class SignupData {
  // private 생성자
  // 외부에서 new SignupData()로 생성할 수 없게 막음
  SignupData._();

  // static 인스턴스
  // 앱 전체에서 하나만 존재하는 인스턴스
  static final SignupData _instance = SignupData._();

  // instance getter
  // SignupData.instance로 접근하면 항상 같은 인스턴스를 반환
  static SignupData get instance => _instance;

  // 회원가입 정보 필드
  String? nickname;
  String? birthday;
  String? gender;
  String? referralCode;
  
  // 약관 동의 정보
  bool serviceTerms = false;
  bool privacyPolicy = false;
  bool locationInfo = false;
  bool marketingInfo = false;

  /// 모든 정보를 초기화하는 메서드
  void clear() {
    nickname = null;
    birthday = null;
    gender = null;
    referralCode = null;
    serviceTerms = false;
    privacyPolicy = false;
    locationInfo = false;
    marketingInfo = false;
  }

  /// 저장된 정보를 문자열로 반환 (얼럿 표시용)
  String getSummary() {
    final buffer = StringBuffer();
    buffer.writeln('회원가입 정보');
    buffer.writeln('━━━━━━━━━━━━━━━━');
    
    if (nickname != null) {
      buffer.writeln('닉네임: $nickname');
    }
    if (birthday != null) {
      buffer.writeln('생일: $birthday');
    }
    if (gender != null) {
      buffer.writeln('성별: $gender');
    }
    if (referralCode != null && referralCode!.isNotEmpty) {
      buffer.writeln('추천코드: $referralCode');
    }
    
    buffer.writeln('약관 동의');
    buffer.writeln('━━━━━━━━━━━━━━━━');
    buffer.writeln('서비스 이용약관: ${serviceTerms ? "✅" : "❌"}');
    buffer.writeln('개인정보 수집 및 이용: ${privacyPolicy ? "✅" : "❌"}');
    buffer.writeln('위치정보 이용: ${locationInfo ? "✅" : "❌"}');
    buffer.writeln('마케팅 정보 수신: ${marketingInfo ? "✅" : "❌"}');
    
    return buffer.toString();
  }
}

