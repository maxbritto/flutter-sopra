import 'package:flutter/material.dart';
import 'package:nav_2/ecrans/login_screen.dart';
import 'package:nav_2/ecrans/login_viewmodel.dart';

class AppRouteInfo {
  final bool isUserLoggedIn;

  const AppRouteInfo({this.isUserLoggedIn = false});
}

class AppRouter extends RouterDelegate<AppRouteInfo>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRouteInfo>
    implements RouteInformationParser<AppRouteInfo> {
  @override
  Widget build(BuildContext context) {
    final pages = <Page>[];
    pages.add(MaterialPage(child: LoginScreen(LoginViewModel())));
    return Navigator(
      pages: pages,
    );
  }

  @override
  final GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(configuration) {
    return Future.value();
  }

  @override
  Future<AppRouteInfo> parseRouteInformation(
      RouteInformation routeInformation) {
    return Future.value(const AppRouteInfo());
  }

  @override
  RouteInformation? restoreRouteInformation(configuration) {
    return const RouteInformation(location: "/");
  }
}
