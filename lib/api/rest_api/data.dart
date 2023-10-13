import 'package:dio/dio.dart';
import '../../app/utils/list_string_config.dart';
import 'api.dart';

mixin DataApi on BaseApi {

  Future listJob() async {
    const url = '/Config/listNhapJob';
    try {
      Response response = await dio.get(url,
          options: Options(
              ));
      if (response.statusCode == 200) {
        List json = response.data;
        Map data = {'VCLK':'Vận chuyển lưu kho', 'CC':'Chất cây'};

        ListStringConfig.setListString('jobs', data);
      }
    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }

  Future listWarehouse() async {
    const url = '/Config/listwarehouse';
    try {
      Response response = await dio.get(url,
          options: Options(
            //     headers: {'token': userResponse.token},
          ));
      if (response.statusCode == 200) {
        List json = response.data;
        Map data = {};
        for (var element in json) {
          data[element['code']] = element['name'];
        }
        ListStringConfig.setListString('warehouses', data);
      }
    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }

  Future listProduct() async {
    const url = '/Config/listProduct';
    try {
      Response response = await dio.get(url,
          options: Options(
            //     headers: {'token': userResponse.token},
          ));
      if (response.statusCode == 200) {
        List json = response.data;
        Map data = {};
        for (var element in json) {
          data[element['code']] = element['name'];
        }
        ListStringConfig.setListString('products', data);
      }
    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }

  Future listType() async {
    const url = '/Config/listType';
    try {
      Response response = await dio.get(url,
          options: Options(
            //     headers: {'token': userResponse.token},
          ));
      if (response.statusCode == 200) {
        List json = response.data;
        Map data = {};
        for (var element in json) {
          data[element['code']] = element['name'];
        }
        ListStringConfig.setListString('types', data);
      }
    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }

  Future listPacket() async {
    const url = '/Config/getListPacket';
    try {
      Response response = await dio.get(url,
          options: Options(
            //     headers: {'token': userResponse.token},
          ));
      if (response.statusCode == 200) {
        List json = response.data;
        Map data = {};
        for (var element in json) {
          data[element['code']] = element['name'];
        }
        ListStringConfig.setListString('packets', data);
      }
    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }

  Future listUnit() async {
    const url = '/Config/getListUnit';
    try {
      Response response = await dio.get(url,
          options: Options(
            //     headers: {'token': userResponse.token},
          ));
      if (response.statusCode == 200) {
        List json = response.data;
        Map data = {};
        for (var element in json) {
          data[element['code']] = element['name'];
        }
        ListStringConfig.setListString('units', data);
      }
    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }

  Future listDevice() async {
    const url = '/Config/getListDevice';
    try {
      Response response = await dio.get(url,
          options: Options(
            //     headers: {'token': userResponse.token},
          ));
      if (response.statusCode == 200) {
        List json = response.data;
        Map data = {};
        for (var element in json) {
          data[element['code']] = element['name'];
        }
        ListStringConfig.setListString('devices', data);
      }
    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }
}
