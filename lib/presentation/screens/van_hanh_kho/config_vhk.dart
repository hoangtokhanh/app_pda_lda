import 'package:app_pda_lda/app/widgets/my_dropdown2.dart';
import 'package:app_pda_lda/presentation/controller/VHK_controller.dart';
import 'package:app_pda_lda/template/scaffold/common_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../app/utils/list_string_config.dart';
import '../../../app/widgets/common_dialog.dart';
import '../../../app/widgets/common_text_input_field.dart';

class ConfigJobVHKScreen extends StatefulWidget {
  const ConfigJobVHKScreen({super.key});

  @override
  State<ConfigJobVHKScreen> createState() => _ConfigJobVHKScreenState();
}

class _ConfigJobVHKScreenState extends State<ConfigJobVHKScreen> {
  VHKController vhkController = Get.put(VHKController());
  TextEditingController arcController = TextEditingController();

  _checkWarehouse() {
    if (!flagJob) {
      vhkController.job.warehouseSrc = vhkController.job.warehouseSrc;
    }
    if ((vhkController.job.warehouseSrc == 'TT') &&
        (vhkController.job.warehouseSrc == vhkController.job.warehouseDst)) {
      print('trùng');

      showDialog<String>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => CommonDialog(
            content: 'Kho dỡ và kho bốc không được cùng là "Kho trung tâm"',
          ));
    } else {
      //print('không trùng: ${myData.value_khodo}  ${myData.value_khoboc}');
      context.push('/config-san-pham-van-hanh-kho');
      //Navigator.of(context).pushNamed("/setting-sp-vanhanhkho");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vhkController.job.job = ListStringConfig.getListString('jobs').keys.first;
    vhkController.job.warehouseSrc = vhkController.job.warehouseDst = ListStringConfig.getListString('warehouses').keys.first;
    vhkController.job.transportunitSrc = vhkController.job.transportunitDst = ListStringConfig.getListString('units').keys.first;
    vhkController.job.deviceSrc = vhkController.job.deviceDst = ListStringConfig.getListString('devices').keys.first;
    arcController.text = '0';
    vhkController.job.distance = int.tryParse(arcController.text) ?? 0;
  }

  bool flagJob = true;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      allowBack: true,
      title: const Text('Thiết lập vận hành kho'),
      bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            if (arcController.text.isNotEmpty) {
              _checkWarehouse();
            }
          },
          style: ButtonStyle(
            padding:
            MaterialStateProperty.all(const EdgeInsets.all(15.0)),
            backgroundColor:
            MaterialStateProperty.all(const Color(0xFF3459E6)),
          ),
          child: const Text('Tiếp tục',
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      ),
    ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyDropdown2Ez(
                items: ListStringConfig.getListString('jobs'),
                title: 'Chọn công việc',
                height: 50,
                hint: 'Chọn công việc',
                onChanged: (v) {
                  vhkController.job.job = v;
                  if (v == 'Vận chuyển lưu kho') {
                    flagJob = true;
                  } else {
                    flagJob = false;
                    arcController.text = '0';
                    vhkController.job.distance = int.tryParse(arcController.text) ?? 0;
                  }
                  setState(() {});
                },
                value: vhkController.job.job,
              ),
              MyDropdown2Ez(
                items: ListStringConfig.getListString('warehouses'),
                title: 'Kho dỡ',
                height: 50,
                hint: 'Chọn kho dỡ',
                onChanged: (v) {
                  vhkController.job.warehouseSrc = v;
                  setState(() {});
                },
                value: vhkController.job.warehouseSrc,
              ),
              Row(
                children: [
                  Flexible(
                    child: MyDropdown2Ez(
                      items: ListStringConfig.getListString('units'),
                      title: 'Đơn vị dỡ',
                      height: 50,
                      hint: 'Chọn đơn vị dỡ',
                      onChanged: (v) {
                        vhkController.job.transportunitSrc = v;
                        setState(() {});
                      },
                      value: vhkController.job.transportunitSrc,
                    ),
                  ),
                  Flexible(
                    child: MyDropdown2Ez(
                      items: ListStringConfig.getListString('devices'),
                      title: 'Thiết bị dỡ',
                      height: 50,
                      hint: 'Chọn thiết bị dỡ',
                      onChanged: (v) {
                        vhkController.job.deviceSrc = v;
                        setState(() {});
                      },
                      value: vhkController.job.deviceSrc,
                    ),
                  ),
                ],
              ),
              if(vhkController.job.job != 'CC')
                Column(
                  children: [
                    MyDropdown2Ez(
                      items: ListStringConfig.getListString('warehouses'),
                      title: 'Kho bốc',
                      height: 50,
                      hint: 'Chọn kho bốc',
                      onChanged: (v) {
                        vhkController.job.warehouseDst = v;
                        setState(() {});
                      },
                      value: vhkController.job.warehouseDst,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: MyDropdown2Ez(
                            items: ListStringConfig.getListString('units'),
                            title: 'Đơn vị bốc',
                            height: 50,
                            hint: 'Chọn đơn vị bốc',
                            onChanged: (v) {
                              vhkController.job.transportunitDst = v;
                              setState(() {});
                            },
                            value: vhkController.job.transportunitDst,
                          ),
                        ),
                        Flexible(
                          child: MyDropdown2Ez(
                            items: ListStringConfig.getListString('devices'),
                            title: 'Thiết bị bốc',
                            height: 50,
                            hint: 'Chọn thiết bị bốc',
                            onChanged: (v) {
                              vhkController.job.deviceDst = v;
                              setState(() {});
                            },
                            value: vhkController.job.deviceDst,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              CommonTextInputField(
                title: 'Cung độ',
                isRequired: true,
                readOnly: !flagJob,
                controller: arcController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (v) {
                  vhkController.job.distance = int.tryParse(arcController.text) ?? 0;
                },
              ),

            ],
          ),
        ),);
  }
}
