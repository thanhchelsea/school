import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:logger/logger.dart';
import 'package:school_manager/utils/index.dart';
import '../repositories/dio.dart';
import '../repositories/error_handlers.dart';
import '../repositories/exceptions/index.dart';
import '../utils/client_utils.dart';

class BaseRepository {
  var logger = Logger();
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api,
      {bool? testMode = false, bool checkStatus = true, bool loginApi = false}) async {
    try {
      Response<T> response = await api;
      // print("======= ${response.data}");
      if (testMode != null && testMode) {
        return response;
      }
      if (response.statusCode == HttpStatus.ok ||
          (response.data as Map<String, dynamic>)['statusCode'] == HttpStatus.ok) {
        // print("Status server tra ve  ");
        // print((response.data as Map<String, dynamic>)['status']);
        // print((response.data as Map<String, dynamic>)['data']);

        int status = (response.data as Map<String, dynamic>)['status'] as int;
        if (status != AppConfigs.SUCCESS && checkStatus == true) {
          String statusMessage = ClientUltis.convertStatus(status);
          throw handleError((response.data as Map<String, dynamic>)['message']);
        }
      }
      return response;
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      logger.e("Throwing error from repository: >>>>>>> $exception : ${(exception as BaseException).message}");
      throw exception;
    } catch (error) {
      // logger.e("Generic error: >>>>>>> $error");
      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}
