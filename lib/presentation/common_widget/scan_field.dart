import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanBox extends StatelessWidget {

  final onChanged;

   ScanBox({super.key, required this.onChanged});

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 80,
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              textAlign: TextAlign.start,
              minLines: 1,
              maxLines: 2,
              controller: textEditingController,
              enabled: true,
              onChanged: onChanged,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: 'Scan QR Code',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                prefixIcon: Icon(
                  Icons.qr_code,
                  size: 42,
                  color: Colors.black,
                ),
                border: InputBorder.none,
              ),
            ),
          )),
    );
  }
}
