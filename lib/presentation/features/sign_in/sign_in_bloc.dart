import 'package:app_sales29112021/common/app_constant.dart';
import 'package:app_sales29112021/data/datasources/local/share_pref.dart';
import 'package:app_sales29112021/data/datasources/remote/resource_type.dart';
import 'package:app_sales29112021/data/models/user_model.dart';
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
        emit(SignInLoading());
        Response response = await _repository.signIn(event.email,event.password);
        if(response.statusCode == 200){
          UserModel model = UserModel.fromJson(response.data["data"]);
          await SharePre.instance.set(AppConstant.token, model.token);
          emit(SignInSuccess("Dang nhap thanh cong"));
        }
      }on DioError catch(dioError){
        emit(SignInSuccess(dioError.response!.data["message"]));
      }catch(e){
        emit(SignInSuccess(e.toString()));
      }
    });
  }

}