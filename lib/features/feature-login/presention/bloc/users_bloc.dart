import 'package:bloc/bloc.dart';
import 'package:countries/features/feature-login/data/repository/users_repositoryimpl.dart';
import 'package:countries/features/feature-login/domain/use_cases/users_usecases.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersUseCases usersUseCases;

  UsersBloc(this.usersUseCases) : super(UsersInitial()) {
    on<LoadUsersEvent>((event, emit) async {

      try {
        final dataState = await usersUseCases;
        emit(UsersLoaded(dataState as bool));
        print('loaded');
      } catch (e) {
        emit(UsersError(e.toString()));
        print('error');
      }
    });
  }
}
