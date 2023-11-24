import 'package:flutter/material.dart';

class ListBookmarks extends StatelessWidget {
  const ListBookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1,
      child: Center(
        child: Text('Bookmarks'),
      ),
    );
  }
}