import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/router/bloc/route_bloc_bloc.dart';

import 'package:go_router/go_router.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  void initState() {
    super.initState();
    GoRouter.of(context).routerDelegate.addListener(_onRoute_Change);
  }

  void _onRoute_Change() {
    final location =
        (GoRouter.of(context).routeInformationProvider.value.uri).toString();
    print("KAnik ambane");
    print("rangan chettan knaikum : $location");
    print("Sradhikande ambane");
  }

  int _selectedIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  bool _onPopInvoked(bool didPop) {
    print("triggered");
    if (widget.navigationShell.currentIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      _goBranch(0);
      return false; // Prevents the app from exiting
    } else {
      SystemNavigator.pop(); // Exits the app
      return true; // Allows the app to exit
    }
  }

  @override
  Widget build(BuildContext context) {
    var Currentpath =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    var b = GoRouter.of(context).routeInformationProvider.value.uri.path;
    var c = GoRouter.of(context)
        .routerDelegate
        .currentConfiguration
        .last
        .toString();
    return PopScope(
      canPop: false,
      onPopInvoked: _onPopInvoked,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "home",
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "settings",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "profile",
            ),
          ],
          selectedIndex: widget.navigationShell.currentIndex,
          onDestinationSelected: (int index) {
            print("b:$b , currrentPath: $Currentpath ,c: $c");
            print("currrentPath: $Currentpath");
            print("c: $c");
            setState(() {
              _selectedIndex = index;
            });
            String path = GoRouter.of(context)
                .routerDelegate
                .currentConfiguration
                .fullPath;
            print('path: $path');
            context.read<RouteBlocBloc>().add(RouteNavigated(
                currentPath: GoRouter.of(context)
                    .routerDelegate
                    .currentConfiguration
                    .fullPath));
            print("Selected index: $_selectedIndex");
            _goBranch(_selectedIndex);
          },
        ),
        body: widget.navigationShell,
      ),
    );
  }
}
