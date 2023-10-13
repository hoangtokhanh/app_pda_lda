import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import '../../app/config/route_config.dart';
import '../../app/widgets/loading_item.dart';
import '../controller/app_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> getData(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    // Check if the widget that initiated this function is still mounted
    if (mounted) {
      if (appController.checkLogin()) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          // Use the context from the current widget to navigate
          Router.neglect(context, () {
            context.go(RouteConfig.getPageInit(appController.authentication.role??''));
          });
        });
      } else {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          // Use the context from the current widget to navigate
          Router.neglect(context, () {
            context.go('/login');
          });
        });
      }
    }
  }

  @override
  void didChangeDependencies() {
    context.dependOnInheritedWidgetOfExactType();
    super.didChangeDependencies();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return const Center(
              child: LoadingItem(size: 200));
        },
      ),
    );
  }
}
