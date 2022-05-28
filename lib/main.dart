import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puppy_shop/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PUPPY SHOP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroScreen(),
    );
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMagin = size.width * 0.05;

    return Scaffold(
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
              Text('PUPPY',style: GoogleFonts.bebasNeue(color: SolidColors.white,fontSize: 40),),
              Padding(
                padding: EdgeInsets.only(left: size.width/ 3),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("unless there is a necessity for it, don't do it to your dog",
                    style: GoogleFonts.poppins(color: SolidColors.white,fontSize: 12,),
                    softWrap: true,
                    maxLines: 2,

                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                children: [
                  TextSpan(text: "Love Is a",style: GoogleFonts.asapCondensed(color: SolidColors.white,fontSize: 60)),
                  TextSpan(text: "\nFour-legged".toUpperCase(),style: GoogleFonts.asapCondensed(color: SolidColors.white,fontSize: 38,letterSpacing: 5)),
                  TextSpan(text: "\nword",style: GoogleFonts.francoisOne(color: SolidColors.white,fontSize: 38)),
                ]),
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
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Watch Now',style: GoogleFonts.poppins(color: SolidColors.white,fontSize: 10),),
                            const SizedBox(width: 8,),
                            SvgPicture.asset('icons/play.svg')
                        ],),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(height: 80,child:
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Start Shopping Now',style: GoogleFonts.poppins(color: SolidColors.white,fontSize: 14),),
                  Container(
                    height: 48,width:size.width/2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/vector1.png'),fit: BoxFit.contain,
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: SolidColors.white,
                          shape: BoxShape.circle
                        ),
                        child: const Icon(Icons.keyboard_arrow_up_outlined,color: SolidColors.red,),
                      ),
                    ),
                  )

                ],),
              )  ,),
            ],
          ),
        ),
      ),
    );
  }
}

