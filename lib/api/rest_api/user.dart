import 'dart:convert';

import 'package:dio/dio.dart';

import '../../data/models/user.dart';
import '../../presentation/controller/app_controller.dart';
import 'api.dart';

mixin UserApi on BaseApi {

  Future<List<User>> getListUser() async {
    const url = '/api/User/getListUser';
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: {
            'token': appController.authentication.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        return ((response.data) as List)
            .map((e) => User.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      saveLog(e);
      return [];
    }
  }

  //
  //
  // Future getListRole() async {
  //   const url = '/api/User/listRole';
  //   try {
  //     Response response = await dio.get(
  //       url,
  //       options: Options(
  //         headers: {
  //           'token': appController.authentication.token,
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       List json = response.data;
  //       Map data = {};
  //       for (var element in json) {
  //         data[element['name']] = element['code'];
  //       }
  //       ListStringConfig.setListString('role', data);
  //     } else {}
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<bool> createUser(data) async {
  //   const url = '/api/User/createUser';
  //   try {
  //     Response response = await dio.post(url,
  //         options: Options(
  //           headers: {
  //             'token': appController.token,
  //           },
  //         ),
  //         data: data);
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
  //
  // Future<bool> editUser(data) async {
  //   const url = '/api/User/editUser';
  //   try {
  //     Response response = await dio.put(url,
  //         options: Options(
  //           headers: {
  //             'token': appController.token,
  //           },
  //         ),
  //         data: data);
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     saveLog(e);
  //     return false;
  //   }
  // }
  //
  // Future<bool> deleteUser({required String code}) async {
  //   String url = '/api/User/$code/deleteUser';
  //   try {
  //     Response response = await dio.delete(url,
  //         options: Options(
  //           headers: {
  //             'token': appController.token,
  //           },
  //         ),
  //     );
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}
