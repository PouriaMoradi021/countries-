import 'package:countries/features/feature-login/domain/entities/users_entities.dart';

import '../../../../core/resources/data-state.dart';

abstract class UsersRepository {
  Future<bool> fetchUsersData(String email);
}
