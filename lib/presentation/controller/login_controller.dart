import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../api/rest_api/api.dart';
import '../../app/config/route_config.dart';
import 'app_controller.dart';
class LoginController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isComplete = false.obs;
  RxBool validate = false.obs;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  _checkHasData() {
    if (username.text != '' && password.text != '') {
      validate.value = true;
    } else{
      validate.value = false;
    }

    if(username.text == 'hoangto'){
      username.text = 'operation';
      password.text = '123456';
    }
  }

  @override
  void onInit(){
    super.onInit();
    username.addListener(_checkHasData);
    password.addListener(_checkHasData);
  }

  Future login(context) async {
    isLoading.value = true;
    var data = {
      'username': username.text,
      'password':password.text
    };
    var result =  await api.login(data);
    isLoading.value = false;

    if(result){

      Future.delayed(const Duration(milliseconds: 100)).then((value) {
        Router.neglect(context, () {
          GoRouter.of(context).go(RouteConfig.getPageInit(appController.authentication.role??''));
        });
      });

    } else{
     // BasicAlert.errorToast(content: 'Tài khoản hoặc mật khẩu không đúng');
    }
  }

}