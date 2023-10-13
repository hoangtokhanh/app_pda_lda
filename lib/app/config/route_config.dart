import 'package:app_pda_lda/app/widgets/loading_item.dart';
import 'package:app_pda_lda/presentation/screens/menu/menu.dart';
import 'package:app_pda_lda/presentation/screens/splash.dart';
import 'package:app_pda_lda/presentation/screens/van_hanh_kho/config_product.dart';
import 'package:app_pda_lda/presentation/screens/van_hanh_kho/config_vhk.dart';
import 'package:app_pda_lda/presentation/screens/van_hanh_kho/confirm_vhk.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/login/login.dart';

class RouteConfig {
  static String get initRoute => '/';

  static final _initPage = {'admin': '/menu', 'manager': '/menu', 'viewer': '/menu', 'operation': '/menu'};

  static final List<MyRouter> _routes = [
    MyRouter(
        path: '/', builder: (BuildContext context, GoRouterState state) => const SplashScreen(), roles: const [], checkAuth: false, name: 'splash'),
    MyRouter(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
        roles: const [],
        checkAuth: false,
        name: 'login'),
    MyRouter(
        path: '/menu', builder: (BuildContext context, GoRouterState state) => const MenuScreen(), roles: const [], checkAuth: false, name: 'menu'),
    MyRouter(
        path: '/config-van-hanh-kho',
        builder: (BuildContext context, GoRouterState state) => const ConfigJobVHKScreen(),
        roles: const [],
        checkAuth: false,
        name: 'config-vhk'),
    MyRouter(
        path: '/config-san-pham-van-hanh-kho',
        builder: (BuildContext context, GoRouterState state) => const ConfigProductVHKScreen(),
        roles: const [],
        checkAuth: false,
        name: 'config-sanpham-vhk'),
    MyRouter(
        path: '/confirm-van-hanh-kho',
        builder: (BuildContext context, GoRouterState state) => const ConfirmVHKScreen(),
        roles: const [],
        checkAuth: false,
        name: 'confirm-vhk'),
  ];

  static List<MyRouter> get getRoutes => _routes;

  List<MyRouter> get getRoute => _routes;

  static String getPageInit(String role) {
    return _initPage[role] ?? '/dashboard';
  }
}

class RouteToPage {
  final String name;
  final Widget page;
  final List<String> roles;
  final bool checkAuth;

  RouteToPage({required this.name, required this.page, required this.roles, this.checkAuth = true});
}

// ignore: must_be_immutable
class MyRouter extends GoRoute {
  final List<String> roles;
  final bool checkAuth;
  IconData? icon;

  MyRouter({required super.path, required super.name, required super.builder, super.routes, required this.roles, this.checkAuth = true, this.icon});
}
