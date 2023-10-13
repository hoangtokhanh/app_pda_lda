import 'package:app_pda_lda/app/config/app_text_styles.dart';
import 'package:app_pda_lda/app/utils/list_string_config.dart';
import 'package:app_pda_lda/presentation/controller/VHK_controller.dart';
import 'package:app_pda_lda/template/scaffold/common_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/rest_api/api.dart';
import '../../../app/extensions/responsive_dimens.dart';

class ConfirmVHKScreen extends StatefulWidget {
  const ConfirmVHKScreen({super.key});

  @override
  State<ConfirmVHKScreen> createState() => _ConfirmVHKScreenState();
}

class _ConfirmVHKScreenState extends State<ConfirmVHKScreen> {
  VHKController vhkController = Get.find();

  _buildInfoJob({required String title, required String content}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
      child: Row(
        children: [
          SizedBox(
              width: 120,
              child: Text(title, style: AppTextStyles.defaultStyle.copyWith(fontSize: Dimens.d16),)),
          Text(content, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }

  _buildProduct({required String title, required String content}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 120,
              child: Text(title, style: AppTextStyles.defaultStyle.copyWith(fontSize: Dimens.d16),)),
          Text(content, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        allowBack: true,
        title: const Text('Xác nhận công việc'),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                await api.createJob(vhkController.job.toJson()).then((value) {
                  if(value.isNotEmpty){
                    vhkController.codeJob = value;
                    print(vhkController.codeJob);
                  }
                });
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
                backgroundColor:
                MaterialStateProperty.all(const Color(0xFF3459E6)),
              ),
              child: const Text('Bắt đầu',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoJob(title: 'Công việc:', content: ListStringConfig.getValueInList('jobs', vhkController.job.job??'')),
            _buildInfoJob(title: 'Kho dỡ:', content: ListStringConfig.getValueInList('warehouses', vhkController.job.warehouseSrc??'')),
            _buildInfoJob(title: 'Đơn vị dỡ:', content: ListStringConfig.getValueInList('units', vhkController.job.transportunitSrc??'')),
            _buildInfoJob(title: 'Thiết bị dỡ:', content: ListStringConfig.getValueInList('devices', vhkController.job.deviceSrc??'')),
            _buildInfoJob(title: 'Kho bốc:', content: ListStringConfig.getValueInList('warehouses', vhkController.job.warehouseDst??'')),
            _buildInfoJob(title: 'Đơn vị bốc:', content: ListStringConfig.getValueInList('units', vhkController.job.transportunitDst??'')),
            _buildInfoJob(title: 'Thiết bị bốc:', content: ListStringConfig.getValueInList('devices', vhkController.job.deviceDst??'')),
            _buildInfoJob(title: 'Cung độ:', content: vhkController.job.distance.toString()),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              width: MediaQuery.of(context).size.width,
              height: 1.5,
              color: const Color(0xFFCED4DA),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
              child: Text(
                'Thông tin sản phẩm:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3459E6)),
              ),
            ),
            _buildProduct(title: 'Sản phẩm:', content: ListStringConfig.getValueInList('products', vhkController.job.productSrc??'')),
            _buildProduct(title: 'Loại sản phẩm:', content: ListStringConfig.getValueInList('types', vhkController.job.typeSrcBefore??'')),
            _buildProduct(title: 'Loại bao:', content: ListStringConfig.getValueInList('packets', vhkController.job.packetSrcBefore??'')),
          ],
        )
    );
  }
}
