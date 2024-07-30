import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('Hai'),
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/profile/profileTwo');
              },
              child: const Text("next"))
        ],
      ),
    );
  }
}
