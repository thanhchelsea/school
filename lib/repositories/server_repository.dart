import 'package:logger/logger.dart';
import 'package:school_manager/repositories/index.dart';

import '../base/base_repository.dart';
import '../models/index.dart';

class ServerRepository extends BaseRepository {
  ServerRepository._getIntance();
  static ServerRepository? _intance;
  factory ServerRepository() {
    _intance ??= ServerRepository._getIntance();
    return _intance!;
  }

  var logger = Logger();

  Future<List<Role>> getAllRole() async {
    List<Role> roles;
    String endPoint = "${ApiConfig.apiEndPoint}roles/getRoleByIds";
    var params = {"roleIds": [], "isGetAll": true};
    var login = dioClient.get(
      endPoint,
      queryParameters: params,
    );
    try {
      return callApiWithErrorParser(login).then((response) {
        roles = (response.data['data'] as List).map((e) => Role.fromMap(e)).toList();
        return roles;
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signIn({required String username, required String password}) async {
    User? user;
    String endPoint = "${ApiConfig.apiEndPoint}user/login";
    var body = {
      "username": username,
      "password": password,
    };

    var login = dioClient.post(
      endPoint,
      data: body,
    );
    try {
      return callApiWithErrorParser(login, loginApi: true).then((response) {
        user = User.fromMap(response.data['data']);
        return user;
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signInWithSessionId({
    required String sessionId,
  }) async {
    User? user;
    String endPoint = "${ApiConfig.apiEndPoint}user/checkLogin";
    var body = {"sessionId": sessionId};
    var login = dioClient.post(
      endPoint,
      data: body,
    );
    try {
      return callApiWithErrorParser(login).then((response) {
        user = User.fromMap(response.data['data']);
        return user;
      });
    } catch (e) {
      rethrow;
    }
  }
}
