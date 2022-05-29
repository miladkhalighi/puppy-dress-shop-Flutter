import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class PuppyProductCard extends StatelessWidget {
  const PuppyProductCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 6),
      height: 70,
      width: size.width/1.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: SolidColors.white
      ),
      child: Row(
        children: [
          Expanded(
            flex :2,
            child: AspectRatio(aspectRatio: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: const Image(image: AssetImage('assets/images/d1.png'),fit: BoxFit.cover,)),),
          ),
          const SizedBox(width: 16,),
          Expanded(
              flex :3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sage Reversible \nSided Coat',
                    style: GoogleFonts.poppins(fontSize: 10,color: Colors.black,fontWeight: FontWeight.w600),),
                  const SizedBox(height: 6,),
                  Text('\$ 2.17',
                    style: GoogleFonts.montserrat(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
                ],
              )
          ),
          const SizedBox(width: 16,),
        ],
      ),
    );
  }
}