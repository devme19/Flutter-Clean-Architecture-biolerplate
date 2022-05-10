import 'package:flutter_clean_architecture/app/core/failures.dart';
import 'package:flutter_clean_architecture/app/core/use_case.dart';
import 'package:flutter_clean_architecture/app/domain/use_cases/user/login_use_case.dart';
import 'package:flutter_clean_architecture/app/domain/use_cases/user/verification_use_case.dart';
import 'package:flutter_clean_architecture/app/presantation/routes/app_routes.dart';
import 'package:flutter_clean_architecture/app/presantation/utils/state_status.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var loginStateStatus = StateStatus.INITIAL.obs;
  var verificationStateStatus = StateStatus.INITIAL.obs;
  String? phoneNumber;
  login(String phoneNumber) {
    this.phoneNumber = phoneNumber;
    EasyLoading.show(status: 'Loading ...');
    loginStateStatus.value = StateStatus.LOADING;
    LoginUseCase loginUseCase = Get.find();
    Map<String, dynamic> body = {
      'phone': phoneNumber,
    };
    loginUseCase.call(Params(body: body)).then((response) {
      if (response.isRight) {
        loginStateStatus.value = StateStatus.SUCCESS;
        EasyLoading.showSuccess('login successfully');
        if(response.right){
          print("login successfully");
        }
        else{
          EasyLoading.showError('user name or password not matched');
          print("user name or password not matched");
        }

      } else {
        if (response.isLeft) {
          loginStateStatus.value = StateStatus.ERROR;
          print("Error");
          response.left;
        }
      }
    });
  }
  verification(String code){
    EasyLoading.show(status: 'Loading ...');
    verificationStateStatus.value = StateStatus.LOADING;
    VerificationUseCase verificationUseCase = Get.find();
    Map<String, dynamic> body = {
      'phone': phoneNumber,
      'token':code
    };
    verificationUseCase.call(Params(body: body)).then((response) {
      if (response.isRight) {
        verificationStateStatus.value = StateStatus.SUCCESS;
        EasyLoading.showSuccess('login successfully');
        Get.offAndToNamed(AppRoutes.homePage);
      } else {
        if (response.isLeft) {
          verificationStateStatus.value = StateStatus.ERROR;
          ServerFailure failure = response.left as ServerFailure;
          if(failure.errorCode == 401) {
            EasyLoading.showError("invalid code");
          }
          print("Error");
        }
      }
    });
  }

}
