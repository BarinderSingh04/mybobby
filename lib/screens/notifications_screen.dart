import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/circleBackButton.dart';
class Notifications_Screen extends StatelessWidget {
  Notifications_Screen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true ,
          title: const Text("Notifications",textAlign: TextAlign.center,style: TextStyle(
              fontSize: 18,
              color: Color(0xFF010317),
              fontWeight: FontWeight.w800
          ),),
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.only(
                left: 24,top: 5,bottom: 5
            ),
            child: CircleBack_Button(onPressed: () {
              Navigator.pop(context);

            },),
          ),
        ),
      body:ListView.separated(
        shrinkWrap: true  ,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,

              leading: Image.asset("assets/images/mb.png",width:size.width*0.12,alignment: Alignment.topCenter,fit: BoxFit.fill,),
              title:  RichText(text: TextSpan(
                text: "Lorem Ipsum",style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
                children: [
                  TextSpan(
                    text: nameList[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ))
                ]
              ),

                // textScaleFactor: 1.5,
              ),
              subtitle:  Text(subtitleList[index]),
             );


          },padding: const EdgeInsets.symmetric(horizontal: 26,vertical: 24),
          separatorBuilder: (context, index) {
            return const Divider(
              color: Color(0xFFEBEBEB),
              thickness: 1,
            );
          },
          itemCount: nameList.length)
    );
  }
  List<String> nameList =[
    "is simply dummy text of the printing and typesetting industry.",
    "is simply dummy text of the printing and typesetting industry.",
    "is simply dummy text of the printing.",
    "is simply dummy text of the printing.",
  ];
  List<String> subtitleList =[
   "2m",
   "3h",
   "2w",
   "4w",
  ];
}
