import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:coffe/src/utils/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: ColorFiltered(
          colorFilter: const ColorFilter.mode(textSecondary, BlendMode.srcIn),
          child: SvgPicture.asset(
            'assets/svg/search.svg',
            width: 22,
            height: 22,
          ),
        ),
        onPressed: () {},
      ),
      title: Center(
        child: SvgPicture.asset(
            'assets/svg/logo.svg',
            width: 55,
            height: 55,
          ),
      ),
      actions: [
        IconButton(
          icon: ColorFiltered(
            colorFilter: const ColorFilter.mode(primary, BlendMode.srcIn),
            child: SvgPicture.asset(
              'assets/svg/shopping-cart.svg',
              width: 22,
              height: 21,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}