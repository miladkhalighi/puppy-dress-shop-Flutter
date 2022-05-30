import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:puppy_shop/colors.dart';
import 'package:puppy_shop/components/dress_item.dart';
import '../../components/action_button.dart';
import '../../components/body_card.dart';
import '../../components/puppy_product_item.dart';
import '../../models/dress_model.dart';
import '../../models/product_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer' as developer;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _dressItemIndexSelected = 0;
  int _badgeValue = 0;
  bool _liked = false;




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width * 0.05;

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
                padding: const EdgeInsets.only(top: 8,bottom: 8),
                child: buildAppBar(bodyMargin),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: bodyMargin),
                        child: Text('PUPPY',style: GoogleFonts.bebasNeue(fontSize: 40,color: Colors.black),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: bodyMargin),
                        child: Text('Choose Your Dress...!',style: GoogleFonts.poppins(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w500),),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        height: size.height * 0.06,
                        child: ListView.builder(itemBuilder: (context,index)=>
                            Padding(
                              padding: EdgeInsets.fromLTRB(index==0 ? bodyMargin : 16, 0, index==dressList.length-1 ? bodyMargin : 0, 0),
                              child: DressItem(
                                selected: _dressItemIndexSelected == index ? true : false,
                                onPressed: (){
                                  setState((){
                                    _dressItemIndexSelected = index;
                                  });
                                },
                                name: dressList[index].name,),
                            ),
                          itemCount: dressList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: bodyMargin),
                        child: DelayedDisplay(
                          child: BodyCard(height: size.height/2.1,liked: _liked, btnLikedPressed: () {
                            setState((){_liked = !_liked;}); },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: bodyMargin),
                        child: Text('Explore some more products',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        height: size.height / 7,
                        child: ListView.builder(itemBuilder: (context,index) =>
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  index==0 ? bodyMargin : 16,
                                  0,
                                  index==productList.length-1 ? bodyMargin : 0,
                                  0,
                              ),
                              child: DelayedDisplay(
                                child: PuppyProductCard(
                                    img: productList[index].img,
                                    title: productList[index].title,
                                    price: productList[index].price,
                                    height: size.height / 7,
                                ),
                              ),
                            ),
                          itemCount: productList.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                        ),
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


  Widget buildAppBar(double bodyMargin) {
    return SizedBox(
                height: 54,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: bodyMargin,),
                    ActionButton(img: 'assets/icons/setting.svg',color: Colors.black,onTap: (){},),
                    const Spacer(),
                    ActionButton(img: 'assets/icons/search.svg',color: Colors.black,onTap: (){},),
                    SizedBox(width: bodyMargin,),
                    ActionButton(img: 'assets/icons/bag.svg',color: Colors.black,onTap: (){},hasBadge: true,badgeValue: _badgeValue,),
                    SizedBox(width: bodyMargin,),
                  ],
                ),
              );
  }
}









