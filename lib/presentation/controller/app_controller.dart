import 'dart:convert';
import 'package:app_pda_lda/app/config/app_color.dart';
import 'package:app_pda_lda/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/rest_api/api.dart';
import '../../app/config/route_config.dart';
import '../../app/utils/route_ultis.dart';
import '../../data/models/authentication.dart';

typedef  CallbackValue = void Function(Object);
typedef Callback = void Function();

class AppController extends GetxController {
  RxInt index = 0.obs;
  RxBool isLoading = false.obs;
  String errorLog = '';
  Authentication authentication =  const Authentication(user: 'admin', role: 'admin');
  LoginController loginController = Get.put(LoginController());
  TextEditingController oldPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  late final SharedPreferences prefs;
  Color getColorNavBar(MyRouter main,BuildContext context,[bool large = true, Color defaultColor = Colors.white]){
    Color color = defaultColor;
    String currentRoute = GoRouterState.of(context).uri.toString();
    if(main.path == currentRoute){
      return large?AppColors.green2:AppColors.green2.withOpacity(0.3);
    }
    for(MyRouter routeModel in main.routes.cast<MyRouter>()){
      if(routeModel.path == currentRoute){
        return large?AppColors.green2:AppColors.green2.withOpacity(0.3);
      }
    }
    return color;
  }

  Future getLoginData() async {
    await getStorage();
    await initData();
  }

  ///get role api v.v...
  Future initData() async {
    Future.wait([
      api.listJob(),
      api.listWarehouse(),
      api.listProduct(),
      api.listPacket(),
      api.listType(),
      api.listUnit(),
      api.listDevice(),
    ]);
  }

  Future saveLogin(data) async {
    prefs.setString('authentication', jsonEncode(data));
    await getLoginData();
  }


  getStorage()  {
    //print(LocalStorageHelper.getValue('authentication'));
    if(prefs.containsKey('authentication')) {
      authentication = Authentication.fromJson(jsonDecode(prefs.getString('authentication')??''));
    }
  }


  Future resetStorageData() async {
    prefs.clear();
    await getLoginData();
  }

  bool checkLogin() {
    if(authentication.token == null || authentication.token!.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  logout(BuildContext context) async {
    context.pop();
    // await appController.resetStorageData();
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   //clearAndNavigate(context, '/');
    // });
  }
}

AppController appController = Get.put(AppController());
