import 'package:flutter/material.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1,
      child: Center(
        child: Text('Profile'),
      ),
    );
  }
}