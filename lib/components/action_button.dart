import 'package:flutter/material.dart';
import 'package:puppy_shop/colors.dart';

class ActionButton extends StatelessWidget {
  final Icon icon;
  final Function() onTap;
  const ActionButton({
    Key? key, required this.icon, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: SolidColors.green,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3),blurRadius: 5)
          ],
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: icon,
      ),
    );
  }
}