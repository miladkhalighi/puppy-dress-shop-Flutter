import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:puppy_shop/colors.dart';

class ActionButton extends StatelessWidget {
  final String img;
  final Function() onTap;
  final Color color;
  const ActionButton({
    Key? key, required this.img, required this.onTap,this.color = Colors.black
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: SolidColors.green,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3),blurRadius: 5)
          ],
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: SvgPicture.asset(img,color: color,width: 24,height: 24,),
      ),
    );
  }
}