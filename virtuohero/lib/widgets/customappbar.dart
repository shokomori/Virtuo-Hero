import 'package:flutter/material.dart';
import 'appname.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  const CustomAppBar({super.key, this.showBackButton = false});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.5),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: showBackButton
                ? IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  )
                : null,
            title: const SizedBox.shrink(), // Prevents default title shifting
            centerTitle: true,
          ),
          // Overlays the logo centered regardless of back button
          const Padding(
            padding: EdgeInsets.only(top: 10), // optional vertical alignment tweak
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: AssetImage('assets/logo.png'),
                  height: 40,
                ),
                SizedBox(width: 8),
                AppName(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
