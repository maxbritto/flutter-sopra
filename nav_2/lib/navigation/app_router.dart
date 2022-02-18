import 'package:flutter/material.dart';
import 'package:nav_2/data/user.dart';
import 'package:nav_2/ecrans/login_screen.dart';
import 'package:nav_2/ecrans/login_viewmodel.dart';
import 'package:nav_2/ecrans/user_list_screen.dart';
import 'package:nav_2/ecrans/user_list_viewmodel.dart';

class AppRouteInfo {
  final bool isUserLoggedIn;

  const AppRouteInfo({this.isUserLoggedIn = false});
}

class AppRouter extends RouterDelegate<AppRouteInfo>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRouteInfo>
    implements RouteInformationParser<AppRouteInfo>, LoginRouter {
  User? _userLoggedIn;

  @override
  Widget build(BuildContext context) {
    final pages = <Page>[];
    final user = _userLoggedIn;

    pages.add(MaterialPage(child: LoginScreen(LoginViewModel(this))));
    if (user != null) {
      pages.add(
          MaterialPage(child: UserListScreen(UserListViewModel(user: user))));
    }
    return Navigator(
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (_userLoggedIn != null) {
          _userLoggedIn = null;
        }

        notifyListeners();
        return true;
      },
    );
  }

  @override
  AppRouteInfo? currentConfiguration = const AppRouteInfo();

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

  @override
  userDidLogin(User user) {
    _userLoggedIn = user;
    notifyListeners();
  }
}
