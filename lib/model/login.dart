class Login {
  int? code;
  bool? status;
  String? token;
  int? userID;
  String? userEmail;

  Login({this.code, this.status, this.token, this.userID, this.userEmail});

  factory Login.fromJson(Map<String, dynamic> obj) {
    var user = obj['data'] != null ? obj['data']['user'] : null;
    return Login(
      code: obj['code'],
      status: obj['status'],
      token: obj['data'] != null ? obj['data']['token'] : null,
      userID: user != null
          ? (user['id'] is int ? user['id'] : int.tryParse(user['id'].toString()))
          : null,
      userEmail: user != null ? user['email'] : null,
    );
  }
}

