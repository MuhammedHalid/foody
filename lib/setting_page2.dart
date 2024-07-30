import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingTwo extends StatefulWidget {
  const SettingTwo({super.key});

  @override
  State<SettingTwo> createState() => _SettingTwoState();
}

class _SettingTwoState extends State<SettingTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Setting Two'),
      ),
    );
  }
//  onPopInvoked: (didPop) {
//         _onBackButtonPressed(context, didPop);
//       },
//   Future<bool> _onBackButtonPressed(BuildContext context, bool didPop) async {
//     if (didPop) {
//       print('Back button pressed in SettingPage');
//       setState(() {
//         context.go('/home'); // Navigate to home directly
//       });
//       return true;
//     } else {
//       print('jbhb');
//       // Optional logic for programmatic pop (if needed)
//       return false;
//     }
//   }
}
