import 'package:countries/core/resources/data-state.dart';
import 'package:countries/features/feature-login/data/data_source/local/local_provider.dart';
import 'package:countries/features/feature-login/data/models/users_model.dart';
import 'package:countries/features/feature-login/domain/entities/users_entities.dart';
import 'package:countries/features/feature-login/domain/repository/users_repository.dart';

class UsersRepositoryImpl extends UsersRepository {
  LocalProvider localProvider;

  UsersRepositoryImpl(this.localProvider);

  @override
  Future<bool> fetchUsersData(String email) async {
    final List<dynamic> jsonList = await localProvider.readUsers();

    jsonList
        .map((dynamic item) => UsersModel.fromJson(item).toEntity())
        .toList();
    for(int i =0;i<jsonList.length;i++) {
      if (jsonList[i] == email) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }
}
