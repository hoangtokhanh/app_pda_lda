import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/app.dart';

class CommonDialog extends StatelessWidget {
  String content;
  int? scan;

  CommonDialog({super.key, required this.content, this.scan});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'Thông báo',
        style: TextStyle(color: Colors.indigo),
      ),
      content: Text(content, style: const TextStyle(color: Colors.black)),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (scan == 1) {
              enableScan();
            }
            context.pop('OK');
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
