class UserModels {
  String userName, password, type;

  UserModels({this.userName, this.password, this.type});

  factory UserModels.fromJson(dynamic data) {
    return UserModels(
        userName: data['userName'],
        password: data['password'],
        type: data['type']);
  }
}
