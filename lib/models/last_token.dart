import 'dart:convert';

class FinalToken {
  final String token;
  FinalToken({
    required this.token,
  });

  FinalToken copyWith({
    String? token,
  }) {
    return FinalToken(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory FinalToken.fromMap(Map<String, dynamic> map) {
    return FinalToken(
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FinalToken.fromJson(String source) => FinalToken.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FinalToken(token: $token)';

  @override
  bool operator ==(covariant FinalToken other) {
    if (identical(this, other)) return true;
  
    return 
      other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}