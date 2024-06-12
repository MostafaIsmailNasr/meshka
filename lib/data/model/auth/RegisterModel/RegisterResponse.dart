class RegisterResponse {
  String? token;
  List<String>? permissions;

  RegisterResponse({this.token, this.permissions});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    permissions = json['permissions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['permissions'] = this.permissions;
    return data;
  }
}