import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';

import 'package:logger/logger.dart';
import 'package:school_manager/repositories/index.dart';

import '../base/base_repository.dart';
import '../models/user.dart';

class ServerRepository extends BaseRepository {
  ServerRepository._getIntance();
  static ServerRepository? _intance;
  factory ServerRepository() {
    _intance ??= ServerRepository._getIntance();
    return _intance!;
  }

  var logger = Logger();

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
}
