import 'package:app_sales29112021/data/datasources/remote/resource_type.dart';
import 'package:app_sales29112021/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class SignInStateBase extends Equatable{}


class SignInStateInit extends SignInStateBase{

  @override
  List<Object?> get props => [];

}

class SignInResult extends SignInStateBase{

  late ResourceType<UserModel> result;

  SignInResult(ResourceType<UserModel> result ){
    this.result = result;
  }

  @override
  List<Object?> get props => [result];

}