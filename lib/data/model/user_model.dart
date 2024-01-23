class UsersModel {
  List<User> users;
  int total;
  int skip;
  int limit;

  UsersModel(
      {this.users = const [], this.total = 0, this.skip = 0, this.limit = 0});

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      users: (json['users'] as List<dynamic>?)!
          .map((v) => User.fromJson(v))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class User {
  int id;
  String firstName;
  String lastName;

  User({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
