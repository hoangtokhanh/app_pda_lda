import 'dart:convert';

import 'package:app_pda_lda/presentation/controller/app_controller.dart';
import 'package:dio/dio.dart';

import 'api.dart';



mixin JobApi on BaseApi {
  Future<String> createJob(data) async {
    const url = '/Job/createJob';
    try {
      Response response = await dio.post(url,
          options: Options(
            headers: {'token': appController.authentication.token},
          ),
          data: data);
      print(response.data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return '';
      }
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future addQRCodeJob(param) async {
    const url = '/Job/addQRCodeJob';
    try {
      Response response = await dio.get(url,
          options: Options(
            headers: {'token': appController.authentication.token},
          ),
          queryParameters: param);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return 'Xãy ra lỗi';
    }
  }

  Future removeQRCodeJob(param) async {
    const url = '/Job/removeQRCodeJob';
    try {
      Response response = await dio.get(url,
          options: Options(
            headers: {'token': appController.authentication.token},
          ),
          queryParameters: param);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print(e);
      return 'Xãy ra lỗi';
    }
  }

  // Future<QRCodeModel> infoQRCode(param) async {
  //   const url = '/Job/InfoQRCode';
  //   try {
  //     Response response = await dio.get(url,
  //         options: Options(
  //           headers: {'token': userResponse.token},
  //         ),
  //         queryParameters: param);
  //     if (response.statusCode == 200) {
  //       return QRCodeModel.fromJson(response.data);
  //     } else {
  //       return QRCodeModel();
  //     }
  //   } catch (e) {
  //     print(e);
  //     return QRCodeModel();
  //   }
  // }
  //
  // Future<List<QRCodeModel>> findQRCode(data) async {
  //   const url = '/Qrcode/findQRCode';
  //   try {
  //     Response response = await dio.post(url,
  //         options: Options(
  //           headers: {'token': userResponse.token},
  //         ),
  //         data: data);
  //     print(response.data);
  //     if (response.statusCode == 200) {
  //       return (response.data as List)
  //           .map((e) => QRCodeModel.fromJsonSearch(e))
  //           .toList();
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     return [];
  //   }
  // }
}
