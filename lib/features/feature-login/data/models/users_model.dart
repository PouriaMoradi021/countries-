import 'package:countries/features/feature-login/domain/entities/users_entities.dart';

/// username : "mina"
/// email : "mina@gmail.com"
/// state : "enable"

class UsersModel extends UsersEntities {
  UsersModel({
    String? username,
    String? email,
    String? state,
  }) : super(
          username: username,
          email: email,
          state: state,
        );

  factory UsersModel.fromJson(dynamic json) {
    return UsersModel(
      username: json['username'],
      email: json['email'],
      state: json['state'],
    );
  }

  UsersModel copyWith({
    String? username,
    String? email,
    String? state,
  }) =>
      UsersModel(
        username: username ?? username,
        email: email ?? email,
        state: state ?? state,
      );

  String? get username => username;

  String? get email => email;

  String? get state => state;

  UsersModel toEntity() {
    return UsersModel(
      username: username,
      email: email,
      state: state,
    );
  }
}
