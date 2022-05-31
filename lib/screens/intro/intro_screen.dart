import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puppy_shop/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:puppy_shop/screens/home/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:puppy_shop/screens/root/rootScreen.dart';
import 'package:shimmer/shimmer.dart';

import '../../colors.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMagin = size.width * 0.05;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/intro_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child:  Padding(
            padding: EdgeInsets.only(top:bodyMagin,left: bodyMagin,right: bodyMagin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DelayedDisplay(
                  slidingBeginOffset: const Offset(0, -1),
                  delay: const Duration(milliseconds: 200),
                    child: Text('PUPPY',style: GoogleFonts.bebasNeue(color: SolidColors.white,fontSize: 40),)
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width/ 3),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: DelayedDisplay(
                      slidingBeginOffset: const Offset(0, -1),
                      delay: const Duration(milliseconds: 300),
                      child: Text("unless there is a necessity for it, don't do it to your dog",
                        style: GoogleFonts.poppins(color: SolidColors.white,fontSize: 12,),
                        softWrap: true,
                        maxLines: 2,

                      ),
                    ),
                  ),
                ),
                DelayedDisplay(
                  slidingBeginOffset: const Offset(-1, 0),
                  delay: const Duration(milliseconds: 1500),
                  child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: "Love Is a",style: GoogleFonts.asapCondensed(color: SolidColors.white,fontSize: 60)),
                          TextSpan(text: "\nFour-legged".toUpperCase(),style: GoogleFonts.asapCondensed(color: SolidColors.white,fontSize: 38,letterSpacing: 5)),
                          const TextSpan(text: "\nWord",style: TextStyle(fontFamily: 'Frasell',fontSize: 40,color: SolidColors.white)),
                        ]),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: SolidColors.white.withOpacity(0.6),
                      onTap: (){},
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  SolidColors.white.withOpacity(0.36),
                                  SolidColors.white.withOpacity(0.06),
                                ]),
                            borderRadius: const BorderRadius.all(Radius.circular(12))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Watch Now',style: GoogleFonts.poppins(color: SolidColors.white,fontSize: 10),),
                              const SizedBox(width: 8,),
                              SvgPicture.asset('assets/icons/play2.svg',color: SolidColors.white,width: 16,height: 16,)
                            ],),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                DelayedDisplay(
                  slidingBeginOffset: const Offset(0, 1),
                  delay: const Duration(milliseconds: 2000),
                  child: SizedBox(height: 80,child:
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Start Shopping Now',style: GoogleFonts.poppins(color: SolidColors.white,fontSize: 14),),
                        startButtom(size, context)

                      ],),
                  )  ,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container startButtom(Size size, BuildContext context) {
    return Container(
                        height: 58,width:size.width/2,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/vector1.png'),fit: BoxFit.contain,
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8,12,8,8),
                          child: GestureDetector(
                            onTap: (){
                                Navigator.of(context).push(PageTransition(child: const RootScreen(),
                                  type: PageTransitionType.bottomToTop,
                                  alignment: Alignment.bottomCenter,
                                  duration: const Duration(milliseconds: 1000),
                                  opaque: true
                                )
                                );
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                  color: SolidColors.white,
                                  shape: BoxShape.circle
                              ),
                              child: const Shimmer(
                                  gradient: LinearGradient(colors: [SolidColors.white,SolidColors.red]),
                                  child: Icon(Icons.keyboard_arrow_up_outlined,color: SolidColors.red,)),
                            ),
                          ),
                        ),
                      );
  }
}