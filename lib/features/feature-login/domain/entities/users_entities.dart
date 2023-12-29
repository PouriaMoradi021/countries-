import 'package:equatable/equatable.dart';

class UsersEntities extends Equatable {
  final String? username;
  final String? email;
  final String? state;

  const UsersEntities({this.username, this.email, this.state});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
