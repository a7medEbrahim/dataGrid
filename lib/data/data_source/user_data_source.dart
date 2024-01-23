import 'package:dio/dio.dart';
import 'package:testapp/core/Constant/endpoint.dart';
import 'package:testapp/data/model/user_model.dart';

import '../../core/Constant/strings.dart';

abstract class UserDataSource {
  Future<UsersModel> getUser();

  Future<UsersModel> postUser();
}

class UserRemoteDataSource implements UserDataSource {
  Dio dio = Dio();

  @override
  Future<UsersModel> getUser() async {
    try {
      var response = await dio.get('${Strings.baseUrl}${EndPoints.users}');
      UsersModel usersModel = UsersModel.fromJson(response.data);
      return usersModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UsersModel> postUser() {
    // TODO: implement postUser
    throw UnimplementedError();
  }
}

class UserLocalDataSource implements UserDataSource {
  @override
  Future<UsersModel> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<UsersModel> postUser() {
    // TODO: implement postUser
    throw UnimplementedError();
  }
}
