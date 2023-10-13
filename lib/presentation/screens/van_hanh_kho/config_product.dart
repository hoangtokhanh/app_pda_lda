import 'package:app_pda_lda/template/scaffold/common_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../app/utils/list_string_config.dart';
import '../../../app/widgets/my_dropdown2.dart';
import '../../controller/VHK_controller.dart';

class ConfigProductVHKScreen extends StatefulWidget {
  const ConfigProductVHKScreen({super.key});

  @override
  State<ConfigProductVHKScreen> createState() => _ConfigProductVHKScreenState();
}

class _ConfigProductVHKScreenState extends State<ConfigProductVHKScreen> {
  VHKController vhkController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vhkController.job.productSrc = ListStringConfig.getListString('products').keys.first;
    vhkController.job.packetSrcBefore = vhkController.job.packetSrcAfter = ListStringConfig.getListString('packets').keys.first;
    vhkController.job.typeSrcBefore = vhkController.job.typeSrcAfter = ListStringConfig.getListString('types').keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      allowBack: true,
        title: const Text('Thiết lập sản phẩm'),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              context.push('/confirm-van-hanh-kho');
            },
            style: ButtonStyle(
              padding:
              MaterialStateProperty.all(const EdgeInsets.all(15.0)),
              backgroundColor:
              MaterialStateProperty.all(const Color(0xFF3459E6)),
            ),
            child: const Text('Xác nhận',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
          ),
        ),
      ),
      child: Column(
        children: [
          MyDropdown2Ez(
            items: ListStringConfig.getListString('products'),
            title: 'Sản phẩm',
            height: 50,
            hint: 'Chọn sản phẩm',
            onChanged: (v) {
              vhkController.job.productSrc = v;
              setState(() {});
            },
            value: vhkController.job.productSrc,
          ),
          MyDropdown2Ez(
            items: ListStringConfig.getListString('types'),
            title: 'Loại sản phẩm',
            height: 50,
            hint: 'Chọn loại sản phẩm',
            onChanged: (v) {
              vhkController.job.typeSrcBefore = vhkController.job.typeSrcAfter  = v;
              setState(() {});
            },
            value: vhkController.job.typeSrcBefore,
          ),
          MyDropdown2Ez(
            items: ListStringConfig.getListString('packets'),
            title: 'Loại bao',
            height: 50,
            hint: 'Chọn loại bao',
            onChanged: (v) {
              vhkController.job.packetSrcAfter = vhkController.job.packetSrcBefore = v;
              setState(() {});
            },
            value: vhkController.job.packetSrcBefore,
          ),

        ],
      ),
    );
  }
}

