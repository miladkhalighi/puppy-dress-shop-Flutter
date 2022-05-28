import 'package:flutter/material.dart';
import 'package:puppy_shop/colors.dart';

import '../../components/action_button.dart';
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
        body: Padding(
          padding: EdgeInsets.all(bodyMagin),
          child: Column(
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
              Text('PUPPY',style: GoogleFonts.bebasNeue(fontSize: 40,color: Colors.black),),
              Text('Choose Your Dress...!',style: GoogleFonts.poppins(fontSize: 20,color: Colors.black),),
              const SizedBox(height: 32,),
              SizedBox(
                height: 100,
                child: ListView.builder(itemBuilder: (context,index)=>
                    Padding(
                      padding: EdgeInsets.all(bodyMagin),
                      child: DressItem(selected: _dressItemIndexSelected==index ? true : false,onPressed: (){
                        setState((){
                          _dressItemIndexSelected = index;
                        });
                      }),
                    ),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DressItem extends StatelessWidget {
  final bool selected;
  final Function() onPressed;

  const DressItem({
    Key? key, this.selected = false, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFFF8057) : SolidColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(14))
      ),
      child: Text('text',style: GoogleFonts.poppins(fontSize: 14,color: selected ? Colors.white : Colors.black),),
    );
  }
}


