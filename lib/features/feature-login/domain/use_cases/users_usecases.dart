import 'package:countries/core/use_case/use_case.dart';
import 'package:countries/features/feature-login/domain/entities/users_entities.dart';
import 'package:countries/features/feature-login/domain/repository/users_repository.dart';

class UsersUseCases {
 final UsersRepository usersRepository;

 UsersUseCases(this.usersRepository);

 Future<bool> execute(String email) async {
    return  await usersRepository.fetchUsersData(email);
  }

}