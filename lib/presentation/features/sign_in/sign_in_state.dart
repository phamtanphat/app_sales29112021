import 'package:app_sales29112021/data/datasources/remote/resource_type.dart';
import 'package:app_sales29112021/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class SignInStateBase extends Equatable{}


class SignInStateInit extends SignInStateBase{

  @override
  List<Object?> get props => [];

}
class SignInLoading extends SignInStateBase{

  @override
  List<Object?> get props => [];

}

class SignInSuccess extends SignInStateBase{

  late String message;

  SignInSuccess(String message){
    this.message = message;
  }

  @override
  List<Object?> get props => [message];

}

class SignInError extends SignInStateBase{

  late String message;

  SignInError(String message){
    this.message = message;
  }

  @override
  List<Object?> get props => [message];

}