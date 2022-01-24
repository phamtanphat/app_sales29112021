import 'package:app_sales29112021/common/app_constant.dart';
import 'package:app_sales29112021/data/datasources/local/share_pref.dart';
import 'package:app_sales29112021/data/datasources/remote/resource_type.dart';
import 'package:app_sales29112021/data/models/user_model.dart';
import 'package:app_sales29112021/data/repositories/authentication_repository.dart';
import 'package:app_sales29112021/presentation/features/sign_in/sign_in_event.dart';
import 'package:app_sales29112021/presentation/features/sign_in/sign_in_state.dart';
import 'package:app_sales29112021/presentation/features/sign_up/sign_up_event.dart';
import 'package:app_sales29112021/presentation/features/sign_up/sign_up_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEventBase,SignUpStateBase>{
  late AuthenticationRepository _repository;

  SignUpBloc(AuthenticationRepository repository) : super(SignUpStateInit()){
    _repository = repository;

    on<SignUpEvent>((event, emit) async{
      try{
        emit(SignUpLoading());
        Response response = await _repository.signUp(event.email,event.password,event.address,event.phone,event.name);
        if(response.statusCode == 200){
          UserModel model = UserModel.fromJson(response.data["data"]);
          await SharePre.instance.set(AppConstant.token, model.token);
          emit(SignUpSuccess("Dang ky thanh cong"));
        }
      }on DioError catch(dioError){
        emit(SignUpError(dioError.response!.data["message"]));
      }catch(e){
        emit(SignUpError(e.toString()));
      }
    });
  }

}