import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('Setting'),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/home');
              },
              child: Text('home'),
            ),
            ElevatedButton(
                onPressed: () {
                  print("click");
    
                  GoRouter.of(context).go('/setting/settingTwo');
                },
                child: Text('next'))
          ],
        ),
      ),
    );
  }

  // Future<bool> _onBackButtonPressed(BuildContext context, bool didPop) async {
  //   if (didPop) {
  //     print('Back button pressed in SettingPage');
  //     Future.delayed(const Duration(seconds: 30));
  //     context.go('/home'); // Navigate to home directly
  //     return true;
  //   } else {
  //     print('jbhb');
  //     // Optional logic for programmatic pop (if needed)
  //     return false;
  //   }
  // }
  //  onPopInvoked: (didPop) {
  //       _onBackButtonPressed(context, didPop);
  //     },
  // Future<bool> _onBackButtonPressed(BuildContext context, bool didPop) async {
  //   if (didPop) {
  //     // Handle back button press
  //     final currentLocation = GoRouterState.of(context).fullPath;

  //     if (currentLocation == '/home') {
  //       context.pop(); // Allow app exit
  //     } else {
  //       // User is in a non-home screen, potentially show a message
  //       print('Back button pressed within a non-home screen');
  //     }
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
