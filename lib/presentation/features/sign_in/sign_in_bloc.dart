import 'package:app_sales29112021/data/datasources/remote/resource_type.dart';
import 'package:app_sales29112021/data/repositories/authentication_repository.dart';
import 'package:app_sales29112021/presentation/features/sign_in/sign_in_event.dart';
import 'package:app_sales29112021/presentation/features/sign_in/sign_in_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEventBase,SignInStateBase>{
  late AuthenticationRepository _repository;

  SignInBloc(AuthenticationRepository repository) : super(SignInStateInit()){
    _repository = repository;

    on<SignInEvent>((event, emit) async{
      try{
        emit(SignInResult(ResourceType.loading()));
        Response response = await _repository.signIn(event.email,event.password);
        print(response.data.toString());
      }on DioError catch(dioError){
        print(dioError.response.toString());
      }catch(e){
        print(e.toString());
      }
    });
  }

}