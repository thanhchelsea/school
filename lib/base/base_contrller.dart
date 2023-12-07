import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:school_manager/utils/index.dart';
import 'package:school_manager/values/index.dart';
import '../repositories/exceptions/index.dart';

enum PageState {
  DEFAULT,
  LOADING,
  SUCCESS,
  FAILED,
  UPDATED,
  CREATED,
  NO_INTERNET,
  MESSAGE,
  UNAUTHORIZED,
}

abstract class BaseController extends GetxController {
//language

  final logoutController = false.obs;

  //Reload the page
  final _refreshController = false.obs;

  refreshPage(bool refresh) => _refreshController(refresh);

  //Controls page state
  final _pageSateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageSateController.value;

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.DEFAULT);

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();

  final _messageController = ''.obs;

  String get message => _messageController.value;

  showMessage(String msg) => _messageController(msg);

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  showErrorMessage(String msg) {
    _errorMessageController(msg);
    showErrorSnackBar(msg);
  }

  final _successMessageController = ''.obs;

  String get successMessage => _messageController.value;

  showSuccessMessage(String msg) => _successMessageController(msg);

  // ignore: long-parameter-list
  dynamic callDataService<T>(
    Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    Exception? _exception;
    if (onStart != null) onStart();
    showLoading();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on TimeoutException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on NetworkException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on JsonFormatException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on NotFoundException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on ApiException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on AppException catch (exception) {
      _exception = exception;
      if (exception.message == AppConfigs.LOGIN_NOT_EXISTED.toString()) {
        showErrorMessage("Vui lòng đăng nhập lại <3.");
        // Get.offAllNamed(RouterNames.SIGN_IN);
      } else {
        showErrorMessage(exception.message);
      }
    } catch (error) {
      _exception = AppException(message: "$error");
      Logger().e("Controller>>>>>> error $error");
    }

    if (onError != null) onError(_exception);

    onComplete == null ? hideLoading() : onComplete();
  }

  showErrorSnackBar(String message) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0),
      content: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 350,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.error,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  spreadRadius: 2.0,
                  blurRadius: 8.0,
                  offset: Offset(2, 4),
                )
              ],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.white),
                SizedBox(width: padding),
                Expanded(child: Text(message, style: const TextStyle(color: Colors.white))),
              ],
            ),
          ),
        ],
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });
  }

  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageSateController.close();
    super.onClose();
  }
}
