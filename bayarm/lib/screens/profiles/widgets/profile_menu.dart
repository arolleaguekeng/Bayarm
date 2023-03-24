import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
    this.endText,
    this.switchBtn = false,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final String? endText;
  final Color? textColor;
  final bool switchBtn;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.white : Colors.black;
    bool isToggled = false;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyText2?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              child: const Icon(Icons.navigate_next_outlined,
                  size: 18.0, color: Colors.black),
            )
          : null,
    );
  }
}
