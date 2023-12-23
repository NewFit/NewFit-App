// ignore_for_file: non_constant_identifier_names

class DBToken {
  String access_token;
  String refresh_token;

  DBToken({
    required this.access_token,
    required this.refresh_token,
  });

  Map<String, dynamic> toMap() {
    return {
      'access_token': access_token,
      'refresh_token': refresh_token,
    };
  }

  @override
  String toString() {
    return 'Token{aceess_token: $access_token, refresh_token: $refresh_token}';
  }
}
