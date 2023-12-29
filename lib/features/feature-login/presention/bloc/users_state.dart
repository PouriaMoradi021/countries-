part of 'users_bloc.dart';

abstract class UsersState{

}

class UsersInitial extends UsersState{}
class UsersLoaded extends UsersState{
final  bool loginButtonStatus;

UsersLoaded(this.loginButtonStatus);
}
class UsersError extends UsersState{
  final String message;

  UsersError(this.message);
}


