import 'package:app_pda_lda/app/config/app_color.dart';
import 'package:app_pda_lda/app/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class MyInputField extends StatefulWidget {
  String label;
  double? width;
  double? fontTitleSize = 20;
  double? fontInputSize = 18;
  bool isPassword = false;
  TextEditingController input;
  final Function(String)? onSubmitted;

  MyInputField({
    super.key,
    required this.label,
    this.onSubmitted,
    required this.input,
    this.width,
    this.fontTitleSize,
    this.fontInputSize,
    this.isPassword = false,
  });

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    _passwordVisible = widget.isPassword ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppTextStyles.header.copyWith(fontSize: widget.fontTitleSize, color: AppColors.darkBluePrimary),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(width: 1, color: AppColors.grey2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(-7, 5), // changes position of shadow
                ),
              ],
            ),
            child: TextField(
              onTap: () {},
              // textAlignVertical: TextAlignVertical.center,
              // controller: Get.find<LoginController>().username,
              controller: widget.input,
              obscureText: _passwordVisible,
              onSubmitted: widget.onSubmitted,
              decoration: InputDecoration(
                hintText: 'Nhập ${widget.label}',
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                // contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          !_passwordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      )
                    : null,
              ),
              style: TextStyle(fontSize: widget.fontInputSize),
            ),
          ),
        ],
      ),
    );
  }
}
