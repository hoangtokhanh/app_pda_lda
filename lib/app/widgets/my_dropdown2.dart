import 'package:app_pda_lda/app/config/app_dimen.dart';
import 'package:app_pda_lda/app/config/app_text_styles.dart';
import 'package:app_pda_lda/app/extensions/responsive_dimens.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../config/app_color.dart';

class MyDropdown2Ez extends StatelessWidget {
  const MyDropdown2Ez({
    Key? key,
    required this.items,
    this.height,
    this.title,
    required this.onChanged,
    required this.value,
    this.fontSize,
    this.hint,
    this.style,
  }) : super(key: key);
  final Map items;
  final Function(dynamic)? onChanged;
  final double? height;
  final dynamic value;
  final hint;
  final TextStyle? style;
  final String? title;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            title != ''
                ? Text('$title:',
                style: style ?? AppTextStyles.defaultStyle.copyWith(fontWeight: FontWeight.bold))
                : const SizedBox(),
            const SizedBox(height: 4,),
            Expanded(
              child: SizedBox(
                height: height ?? 60.0.responsive(),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isDense: true,
                    buttonStyleData: ButtonStyleData(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: AppColors.grey)),
                    ),
                    hint: hint !=null ? Text(hint, style: TextStyle(fontSize: fontSize ?? AppDimens.defaultSize, color: AppColors.grey),) : null,
                    isExpanded: true,
                    style: TextStyle(fontSize: fontSize ?? AppDimens.defaultSize, color: Colors.black),
                    onChanged: onChanged,
                    value: value,
                    items: items.entries
                        .map<DropdownMenuItem>((entry) => DropdownMenuItem(
                            value: entry.key,
                            child: Text(
                              entry.value,
                              style: style,
                            )))
                        .toSet()
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
