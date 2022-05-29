import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puppy_shop/colors.dart';

class BodyCard extends StatelessWidget {
  final double height;
  const BodyCard({required this.height,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var upperCardHeight =  height * 0.75;
    var size =  MediaQuery.of(context).size;
    double borderRad =  37;
    return Container(
      color: Colors.red, //todo : for test
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
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
                      child: likeButton()
                  ),
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
                            width: size.width * 0.7,
                            child: Text('Bwealthest Small Dog Sleeveless Sweater.',
                              style: GoogleFonts.poppins(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600),
                              maxLines: 2,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * 0.7,
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
                              Container(
                                width: 42,
                                height: 42,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF8057),
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: SvgPicture.asset('assets/icons/star.svg',
                                  color: SolidColors.white,
                                ),
                              ),
                              Container(
                                width: 42,
                                height: 42,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF8057),
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: SvgPicture.asset('assets/icons/star.svg',
                                  color: SolidColors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
          //img dog1
          Positioned(
              top: -20,
              left: size.width/3,
              right: size.width/3,
              //bottom: upperCardHeight,
              child: const Image(image: AssetImage('assets/images/dog1.png'),
                fit: BoxFit.cover,)),


        ],),
    );
  }

  Widget likeButton() {
    return Container(
                      width: 32,
                      height: 32,
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
                      child: IconButton(onPressed: (){},
                          icon: SvgPicture.asset('assets/icons/heart.svg',
                            color: SolidColors.white,
                            width: 24,
                            height: 24,
                          )),
                    );
  }
}