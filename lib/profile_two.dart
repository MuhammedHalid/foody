import 'package:flutter/material.dart';

class ProfileTwo extends StatefulWidget {
  const ProfileTwo({super.key});

  @override
  State<ProfileTwo> createState() => _ProfileTwoState();
}

class _ProfileTwoState extends State<ProfileTwo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text('Hai'),
      ),
    );
  }
}