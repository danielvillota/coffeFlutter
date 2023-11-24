import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:coffe/src/utils/constants/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final void Function({required int position}) onChangeView;

  const CustomBottomNavigationBar({
    Key? key,
    required this.onChangeView,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    widget.onChangeView(position: index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: _currentIndex,
      color: primary,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: primary,
      animationDuration: Duration(milliseconds: 300),
      height: 50,
      onTap: _onTabTapped,
      items: <Widget>[
        SvgPicture.asset(
          'assets/svg/home.svg',
          width: 24,
          height: 24,
          color: white,
        ),
        SvgPicture.asset(
          'assets/svg/marker.svg',
          width: 24,
          height: 24,
          color: white,
        ),
        SvgPicture.asset(
          'assets/svg/bell.svg',
          width: 24,
          height: 24,
          color: white,
        ),
        SvgPicture.asset(
          'assets/svg/user.svg',
          width: 24,
          height: 24,
          color: white,
        ),
      ],
    );
  }
}