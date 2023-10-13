
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../app/config/route_config.dart';
import '../app/extensions/responsive_dimens.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'root');

const MethodChannel channel = MethodChannel('PDA');
const SCAN_CHANNEL = EventChannel('PDA-SCAN');

disableBack() {
  channel.invokeMethod('disable_back');
}

enableBack() {
  channel.invokeMethod('enable_back');
}

disableScan() {
  channel.invokeMethod('disable_scan');
}

enableScan() {
  channel.invokeMethod('enable_scan');
}

signalSuccess() {
  channel.invokeMethod('signal_success');
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ...RouteConfig.getRoutes,

    ],
  );

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          ScreenUtil.init(context);
          ResponsiveDimen.of(context);
          return MaterialApp.router(
            title: 'Base app',
            routerConfig: router,
          );
        }
    );
  }
}
