import 'package:equatable/equatable.dart';

abstract class SignUpStateBase extends Equatable{}


class SignUpStateInit extends SignUpStateBase{

  @override
  List<Object?> get props => [];

}
class SignUpLoading extends SignUpStateBase{

  @override
  List<Object?> get props => [];

}

class SignUpSuccess extends SignUpStateBase{

  late String message;

  SignUpSuccess(String message){
    this.message = message;
  }

  @override
  List<Object?> get props => [message];

}

class SignUpError extends SignUpStateBase{

  late String message;

  SignUpError(String message){
    this.message = message;
  }

  @override
  List<Object?> get props => [message];

}