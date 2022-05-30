import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:puppy_shop/colors.dart';
import 'package:puppy_shop/components/dress_item.dart';
import '../../components/action_button.dart';
import '../../components/body_card.dart';
import '../../components/puppy_product_item.dart';
import '../../models/dress_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as developer;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _dressItemIndexSelected = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMagin = size.width * 0.05;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEDEDED),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: GradientColors.bgHomeGradient)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 8),
                child: buildAppBar(bodyMagin),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: bodyMagin),
                        child: Text('PUPPY',style: GoogleFonts.bebasNeue(fontSize: 40,color: Colors.black),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: bodyMagin),
                        child: Text('Choose Your Dress...!',style: GoogleFonts.poppins(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        height: size.height * 0.06,
                        child: ListView.builder(itemBuilder: (context,index)=>
                            Padding(
                              padding: EdgeInsets.fromLTRB(index==0 ? bodyMagin : 16, 0, index==dressList.length ? bodyMagin : 0, 0),
                              child: DressItem(
                                selected: _dressItemIndexSelected == index ? true : false,
                                onPressed: (){
                                setState((){
                                  _dressItemIndexSelected = index;
                                  developer.log(_dressItemIndexSelected.toString(),name: "INDEX PRESSED");
                                });
                              }, name: dressList[index].name,),
                            ),
                          itemCount: dressList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: bodyMagin),
                        child: BodyCard(height: size.height/2.1),
                      ),
                      const SizedBox(height: 16,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: bodyMagin),
                        child: Text('Explore some more products',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                      ),
                      const SizedBox(height: 16,),
                      Padding(
                        padding: EdgeInsets.only(left: bodyMagin),
                        child: PuppyProductCard(size: size, title: 'gfdgdg', price: 2.17, img: 'fdg',),
                      ),
                      const SizedBox(height: 16,),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget buildAppBar(double bodyMagin) {
    return SizedBox(
                height: 54,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: bodyMagin,),
                    ActionButton(img: 'assets/icons/setting.svg',color: Colors.black,onTap: (){},),
                    const Spacer(),
                    ActionButton(img: 'assets/icons/search.svg',color: Colors.black,onTap: (){},),
                    SizedBox(width: bodyMagin,),
                    ActionButton(img: 'assets/icons/bag.svg',color: Colors.black,onTap: (){},),
                    SizedBox(width: bodyMagin,),
                  ],
                ),
              );
  }
}









