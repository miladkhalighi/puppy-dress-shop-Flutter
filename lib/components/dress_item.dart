import 'package:flutter/material.dart';

import '../colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DressItem extends StatelessWidget {
  final String name;
  final bool selected;
  final Function() onPressed;

  const DressItem({
    Key? key, this.selected = false, required this.onPressed, required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: selected ? const Color(0xFFFF8057) : SolidColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(14))
        ),
        child: Center(
          child: Text(name,
            style: GoogleFonts.poppins(fontSize: 14,color: selected ? Colors.white : Colors.black,fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}