class UserModel{
  late String userId;
  late String fullName;
  late String email;
  late String password;
  late String phone;
  late String address;
  late String role;
  late String createdAt;
  late String updatedAt;
  late String token;

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    token = json['token'];
  }

}