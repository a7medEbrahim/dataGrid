import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/data/data_source/user_data_source.dart';
import 'package:testapp/data/model/user_model.dart';
import 'package:testapp/data/repositoies/user_data_repo.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitState());
  List<User> users = [];

  static UserCubit get(context) => BlocProvider.of(context);

  getUsers() async {
    emit(UserLoadingState());
    UserDataRepo userDataRepo = UserDataRepo(UserRemoteDataSource());
    var resultt = await userDataRepo.getUsers();
    users = resultt.users ?? [];
    emit(UserSuccessState());
  }
}

abstract class UserState {}

class UserInitState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {}

class UserErrorState extends UserState {}
