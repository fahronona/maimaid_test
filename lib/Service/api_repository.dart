import 'package:maimaiid_test/Model/model_user.dart';
import 'package:maimaiid_test/Service/api_service.dart';

class ApiRepository {
  final _provider = ApiService();

  Future<UserModel> fetchUserlList(String page) {
    return _provider.getListUser(page);
  }
}

class NetworkError extends Error {}
