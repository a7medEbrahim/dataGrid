import 'package:testapp/data/data_source/user_data_source.dart';
import '../model/user_model.dart';

class UserDataRepo {
  UserDataSource userDataSource;

  UserDataRepo(this.userDataSource);

  Future<UsersModel> getUsers() => userDataSource.getUser();
}
