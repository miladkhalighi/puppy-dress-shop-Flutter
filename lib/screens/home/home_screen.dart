import 'package:flutter/material.dart';
import 'package:puppy_shop/colors.dart';
import 'package:puppy_shop/components/dress_item.dart';
import '../../components/action_button.dart';
import '../../components/body_card.dart';
import '../../components/puppy_product_item.dart';
import '../../models/dress_model.dart';
import 'package:google_fonts/google_fonts.dart';

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

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            colors: GradientColors.bgHomeGradient)
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFEDEDED).withOpacity(0.5),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
               //color: Colors.red,
               height: 64,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   SizedBox(width: bodyMagin,),
                   ActionButton(icon: const Icon(Icons.ac_unit_rounded,color: Colors.black,), onTap: (){}),
                   const Spacer(),
                   ActionButton(icon: const Icon(Icons.ac_unit_rounded,color: Colors.black,), onTap: (){}),
                   SizedBox(width: bodyMagin,),
                   ActionButton(icon: const Icon(Icons.ac_unit_rounded,color: Colors.black,), onTap: (){}),
                   SizedBox(width: bodyMagin,),
                 ],
               ),
             ),
            Padding(
              padding: EdgeInsets.only(left: bodyMagin),
              child: Text('PUPPY',style: GoogleFonts.bebasNeue(fontSize: 40,color: Colors.black),),
            ),
            Padding(
              padding: EdgeInsets.only(left: bodyMagin),
              child: Text('Choose Your Dress...!',style: GoogleFonts.poppins(fontSize: 20,color: Colors.black),),
            ),
            const SizedBox(height: 32,),
            SizedBox(
              height: size.height * 0.07,
              child: ListView.builder(itemBuilder: (context,index)=>
                  Padding(
                    padding: EdgeInsets.fromLTRB(index==0 ? bodyMagin : 16, 0, index==dressList.length ? bodyMagin : 0, 0),
                    child: DressItem(selected: _dressItemIndexSelected==index ? true : false,onPressed: (){
                      setState((){
                        _dressItemIndexSelected = index;
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
              child: BodyCard(height: size.height/1.9),
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: bodyMagin),
              child: Text('Explore some more products',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
            ),
            Padding(
              padding: EdgeInsets.only(left: bodyMagin),
              child: PuppyProductCard(size: size),
            )

          ],
        ),
      ),
    );
  }
}









