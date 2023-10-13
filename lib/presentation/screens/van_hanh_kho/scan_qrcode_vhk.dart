import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../app.dart';
import '../../controller/VHK_controller.dart';

class ScanQRCodeVHK extends StatefulWidget {
  const ScanQRCodeVHK({super.key});

  @override
  State<ScanQRCodeVHK> createState() => _ScanQRCodeVHKState();
}

class _ScanQRCodeVHKState extends State<ScanQRCodeVHK> {

  VHKController vhkController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    enableScan();
    SCAN_CHANNEL.receiveBroadcastStream().listen(_onEvent);
    disableBack();
  }

  void _onEvent(Object? event) async {
    if(!vhkController.isBusy){
      vhkController.isBusy = true;
        QRCodeModel model = await api.infoQRCode({'qrcode': qr.text});
        var temp = stateScan
            ? await api.addQRCodeJob(
            {'job': myData.mavanchuyen, 'qrcode': qr.text, 'indexs':[]})
            : await api
            .removeQRCodeJob({'job': myData.mavanchuyen, 'qrcode': qr.text});
    }
    // qr.text = event.toString();
    // if(!myData.isBusy) {
    //   myData.isBusy = true;
    //   QRCodeModel model = await api.infoQRCode({'qrcode': qr.text});
    //   var temp = stateScan
    //       ? await api.addQRCodeJob(
    //       {'job': myData.mavanchuyen, 'qrcode': qr.text, 'indexs':[]})
    //       : await api
    //       .removeQRCodeJob({'job': myData.mavanchuyen, 'qrcode': qr.text});
    //   setState(() {
    //     _qrModel = model;
    //     try {
    //       num = temp;
    //       print('test: ' + temp.toString());
    //       print('test: ' + num.toString());
    //       signalSuccess();
    //     } catch (e) {
    //       disableScan();
    //       showDialog<String>(
    //         barrierDismissible: false,
    //         context: context,
    //         builder: (BuildContext context) =>
    //             DialogWidget(
    //               content: temp.toString(),
    //               scan: 1,
    //             ),
    //       );
    //     }
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
