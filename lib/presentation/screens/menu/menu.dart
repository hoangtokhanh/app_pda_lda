import 'package:app_pda_lda/presentation/controller/app_controller.dart';
import 'package:app_pda_lda/template/scaffold/common_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  Map<String, String> listMenu = {
    'Vận hành kho' : '/config-van-hanh-kho',
    'Nhập thêm' : '/nhap-them' ,
    'Xuất tiêu thụ' : '/xuat-tieu-thu',
    'Hạ tải' : '/ha-tai',
    'Nâng tải' : '/nang-tai',
    'Xuất đóng lại' : '/xuat-dong-lai',
    'Xuất' : '/xuat',
    'Báo cáo lỗi' : '/bao-cao-loi',
    'Tra cứu' : 'tra-cuu'
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disableBack();
    disableScan();
  }

  Widget _buildButtonMenu({required  String name, required String route}){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ), backgroundColor: const Color(0xFFEAEAEA),
          alignment: Alignment.centerLeft),
      onPressed: () {
        context.push(route);
      },
      child: Text(
        name,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
        title: Text('Tài khoản: ${appController.authentication.user}'),
        appBarActions: [
          PopupMenuButton(
              position: PopupMenuPosition.under,
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Lịch sử'),
                ),
                const PopupMenuItem(value: 2,child: Text('Đổi mật khẩu')),
              ],
              onSelected: (value){
                if(value == 1){
                  // Navigator.of(context).push(
                  //   MaterialPageRoute (
                  //     builder: (BuildContext context) =>  HistoryUserScreen(),
                  //   ),
                  // ).then((value) {
                  //   disableBack();
                  // });
                } else {
                 // Navigator.of(context).pushNamed("/changepassword-screen");
                }
              },
              child: const Icon(
                Icons.account_circle,)),
          //SizedBox(width: 12,),
          IconButton(
              onPressed: () {
                // Navigator.of(context)
                //     .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);

              },
              icon: const Icon(Icons.logout)),
        ],
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: GridView.count(
                clipBehavior: Clip.hardEdge,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                crossAxisCount: 2,
                childAspectRatio: (150 / 65),
                children: listMenu.entries.map((e) => _buildButtonMenu(name: e.key, route: e.value)).toList()
              )),
        ),
    );
  }
}
