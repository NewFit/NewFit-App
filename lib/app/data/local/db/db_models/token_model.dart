// ignore_for_file: non_constant_identifier_names

class DBToken {
  String user = 'user';
  String access_token;
  String refresh_token;

  DBToken({
    required this.access_token,
    required this.refresh_token,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'access_token': access_token,
      'refresh_token': refresh_token,
    };
  }

  @override
  String toString() {
    return 'Token{user: $user, aceess_token: $access_token, refresh_token: $refresh_token}';
  }
}
