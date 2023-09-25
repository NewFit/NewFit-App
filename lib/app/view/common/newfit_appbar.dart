import 'package:flutter/material.dart';

class NewfitAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewfitAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
