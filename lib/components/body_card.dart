import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puppy_shop/colors.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class BodyCard extends StatelessWidget {
  final double height;
  final bool liked;
  final Function() btnLikedPressed;
  final bool fadein;
  final Function() btnBagPressed;

  const BodyCard({
    required this.height,
    this.liked = false,
    required this.btnLikedPressed,
    required this.btnBagPressed,
    this.fadein = true,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var upperCardHeight =  height * 0.69;
    var size =  MediaQuery.of(context).size;
    double lowerCardWidth =  size.width * 0.17;
    double borderRad =  37;
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: 25,
            left: 0,
            right: 0,
            child: DelayedDisplay(
              fadeIn: fadein,
              //delay: const Duration(milliseconds: 300),
              slidingBeginOffset: const Offset(0, -10),
              child: Container(
                height: upperCardHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(borderRad)
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top : 0,
                      left : 0,
                      right : 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: upperCardHeight/2,
                          decoration: BoxDecoration(
                            color : SolidColors.green,
                            borderRadius: BorderRadius.circular(borderRad)
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                       right: size.width * 0.06,
                        child: likeButton(context)
                    ),
                    //texts
                    Positioned(
                      left: 0,
                      bottom: 0,
                      right: 0,
                      top: upperCardHeight/2 ,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.6,
                              child: Text('Bwealthest Small Dog Sleeveless Sweater.',
                                style: GoogleFonts.poppins(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600),
                                maxLines: 2,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.6,
                                  child: Row(
                                    children: [
                                      Text('\$ 3.26',style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.bold),),
                                      const Spacer(),
                                      SvgPicture.asset('assets/icons/star.svg',color: SolidColors.green,),
                                      const SizedBox(width: 8,),
                                      Text('4.2',style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.bold),),
                                      const SizedBox(width: 8,),
                                      Text('Sold',style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w600),),
                                      const Spacer(),
                                  ],),
                                ),
                                const Spacer(),
                                Bounce(
                                  duration: const Duration(milliseconds: 200),
                                  onPressed: (){},
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFF8057),
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: SvgPicture.asset('assets/icons/archive-tick.svg',
                                      color: SolidColors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8,),
                                Bounce(
                                  duration: const Duration(milliseconds: 200),
                                  onPressed: btnBagPressed,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFF8057),
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: SvgPicture.asset('assets/icons/bag.svg',
                                      color: SolidColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,)
                          ],
                        ),
                      )
                    ),

                  ],
                ),
              ),
            ),
          ),
          //img dog1
          Positioned(
              top: -18,
              left: size.width/4,
              right: size.width/4,
              bottom: height * 0.53,
              child: DelayedDisplay(
                  fadeIn: fadein,
                  //delay: const Duration(milliseconds: 300),
                  slidingBeginOffset: const Offset(0, -10),
                  child: const Image(image: AssetImage('assets/images/dog1.png'),fit: BoxFit.fill,))
          ),
          Positioned(
              bottom: 4,
              left: 0,
              right: 0,
              child:
              SizedBox(
                height: height /2.77,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DelayedDisplay(
                        fadeIn: fadein,
                        delay: fadein ? const Duration(milliseconds: 100): const Duration(milliseconds: 10),
                        slidingBeginOffset: const Offset(0, 10),
                        child: BottomPuppyCard(lowerCardWidth: lowerCardWidth, img: 'assets/images/d1.png',)
                    ),
                    DelayedDisplay(
                        fadeIn: fadein,
                        delay: fadein ? const Duration(milliseconds: 200): const Duration(milliseconds: 10),
                        slidingBeginOffset: const Offset(0, 10),
                        child: BottomPuppyCard(lowerCardWidth: lowerCardWidth, img: 'assets/images/d2.png',)
                    ),
                    DelayedDisplay(
                        fadeIn: fadein,
                        delay: fadein ? const Duration(milliseconds: 300): const Duration(milliseconds: 10),
                        slidingBeginOffset: const Offset(0, 10),
                        child: BottomPuppyCard(lowerCardWidth: lowerCardWidth, img: 'assets/images/d3.png',)
                    ),
                  ],
                ),
              )
          )


        ],),
    );
  }

  Widget likeButton(BuildContext context) {
    return InkWell(
      onTap: btnLikedPressed,
      child: Container(
                        width: 32,
                        height: 32,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                              colors: [
                            SolidColors.white.withOpacity(0.67),
                            SolidColors.white.withOpacity(0.07),
                          ])
                        ),
                        child: AnimatedContainer(

                          duration: const Duration(milliseconds: 1000),
                          child: SvgPicture.asset('assets/icons/heart.svg',
                            color: liked ? SolidColors.red :SolidColors.white,
                            width: 12,
                            height: 12,
                          ),
                        )
                      ),
    );
  }
}

class BottomPuppyCard extends StatelessWidget {
  final String img;
  const BottomPuppyCard({
    Key? key,
    required this.lowerCardWidth, required this.img,
  }) : super(key: key);

  final double lowerCardWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 4, 6, 4),
      width: lowerCardWidth,
      decoration: BoxDecoration(
        color: SolidColors.white,
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Image(image: AssetImage(img),fit: BoxFit.cover,),
      )
    );
  }
}