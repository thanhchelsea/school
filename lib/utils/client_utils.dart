import 'package:school_manager/utils/index.dart';

class ClientUltis {
  static String convertStatus(int status) {
    String message = "";
    switch (status) {
      // case AppConfigs.LOGIN_SUCCESS:
      //   {
      //     message = "Đăng nhập thành công";
      //     break;
      //   }
      case AppConfigs.LOGIN_FAILED:
        {
          message = "Đăng nhập thất bại";
          break;
        }
      case AppConfigs.LOGIN_WRONG_PASSWORD:
        {
          message = "Sai mật khẩu";
          break;
        }
      case AppConfigs.REGISTER_ACCOUNT_IS_USED:
        {
          message = "Tài khoản đã được sử dụng";
          break;
        }
      case AppConfigs.LOGIN_ACCOUNT_IS_USED:
        {
          message = "Tài khoản đã được sử dụng";
          break;
        }
      case AppConfigs.TOKEN_VALID:
        {
          message = "Phiên đăng nhập hết hạn";
          break;
        }
      case AppConfigs.LOGIN_ACCOUNT_NOT_EXIST:
        {
          message = "Tài khoản không tồn tại";
          break;
        }
      case AppConfigs.LOGIN_NOT_EXISTED:
        {
          message = "${AppConfigs.LOGIN_NOT_EXISTED}";
          break;
        }
    }
    return message;
  }
}
