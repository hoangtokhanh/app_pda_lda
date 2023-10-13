import 'package:app_pda_lda/app/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../app/config/app_color.dart';
import '../../app/config/app_config.dart';

// ignore: must_be_immutable
class CommonScaffold extends StatefulWidget {
  Widget child;
  bool allowBack;
  List<Widget>? appBarActions;
  Widget? title;
  Widget? bottomNavigationBar;
  CommonScaffold({super.key, required this.child, this.title, this.allowBack = false, this.appBarActions, this.bottomNavigationBar});
  @override
  State<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.child,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: widget.allowBack ? IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop(),
          ) : null,
          title: widget.title,
          actions: widget.appBarActions,
        ),
        bottomNavigationBar: widget.bottomNavigationBar ?? Container(
          height: 30,
          padding: const EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomCenter,
          child:
          Text(AppConfig.version, style: AppTextStyles.small),
        ),
      ),
    );
  }
}