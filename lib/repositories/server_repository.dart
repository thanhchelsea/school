import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';

import 'package:logger/logger.dart';

import '../base/base_repository.dart';

class ServerRepository extends BaseRepository {
  ServerRepository._getIntance();
  static ServerRepository? _intance;
  factory ServerRepository() {
    _intance ??= ServerRepository._getIntance();
    return _intance!;
  }

  var logger = Logger();
}
