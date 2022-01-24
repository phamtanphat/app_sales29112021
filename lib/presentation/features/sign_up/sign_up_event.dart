import 'package:equatable/equatable.dart';

abstract class SignUpEventBase extends Equatable{}


class SignUpEvent extends SignUpEventBase{

  late String email;
  late String password;
  late String name;
  late String phone;
  late String address;

  SignUpEvent({
    required this.email ,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [email,password,name,address,phone];

}