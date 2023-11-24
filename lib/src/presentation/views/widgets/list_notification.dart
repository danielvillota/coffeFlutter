import 'package:flutter/material.dart';

class ListNotifications extends StatelessWidget {
  const ListNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1,
      child: Center(
        child: Text('Notifications'),
      ),
    );
  }
}