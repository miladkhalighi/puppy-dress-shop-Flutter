
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

class PuppyProductCard extends StatelessWidget {
  const PuppyProductCard({
    Key? key,
    required this.img, required this.title, required this.price,required this.height
  }) : super(key: key);

  final String img;
  final String title;
  final double price;
  final double height;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
      //height: size.height / 8,
      width: size.width/1.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: SolidColors.white
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: Image(image: AssetImage(img),fit: BoxFit.cover,width: height-6,height: height-6,)),
          const SizedBox(width: 16,),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                    style: GoogleFonts.poppins(fontSize: 11,color: Colors.black,fontWeight: FontWeight.w600),),
                  const SizedBox(height: 6,),
                  Text('\$ $price',
                    style: GoogleFonts.montserrat(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black),),
                ],
              )
          ),
          const SizedBox(width: 16,),
        ],
      ),
    );
  }
}