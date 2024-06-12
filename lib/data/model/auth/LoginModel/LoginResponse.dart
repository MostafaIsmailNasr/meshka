class LoginResponse {
  String? token;
  List<String>? permissions;
  bool? emailVerified;

  LoginResponse({this.token, this.permissions, this.emailVerified});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    permissions = json['permissions'].cast<String>();
    emailVerified = json['email_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['permissions'] = this.permissions;
    data['email_verified'] = this.emailVerified;
    return data;
  }
}