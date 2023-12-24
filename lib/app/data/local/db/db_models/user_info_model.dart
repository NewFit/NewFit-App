// ignore_for_file: non_constant_identifier_names

class UserInfo {
  String user = 'user';
  String? access_token;
  String? refresh_token;
  int? user_id;
  int? authority_id;
  int? oauth_history_id;

  UserInfo({
    this.access_token,
    this.refresh_token,
    this.user_id,
    this.authority_id,
    this.oauth_history_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'access_token': access_token,
      'refresh_token': refresh_token,
      'user_id': user_id,
      'authority_id': authority_id,
      'oauth_history_id': oauth_history_id,
    };
  }

  @override
  String toString() {
    return 'Token{user: $user, aceess_token: $access_token, refresh_token: $refresh_token, user_id: $user_id, authority_id: $authority_id, oauth_history_id: $oauth_history_id}';
  }
}
