
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class OnBoarding_ScreenPage extends StatelessWidget {
  const OnBoarding_ScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFE2F0FF),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
      child: Stack(
            children: [
              Align(alignment: Alignment.topCenter,
                child: Container(

                  height: size.height*0.51,
                  decoration: const BoxDecoration(
                      color: Color(0xFFE2F0FF)
                  ),
                  child: SizedBox(
                    // height: 250,
                      width: size.width,

                      child: Image.asset(
                        "assets/images/driver.png", fit: BoxFit.cover,)),
                ),
              ),
              Align(alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height*0.28,
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      )
                  ),

                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      SizedBox(height: size.height * 0.02,),

                      const Text("The rider is matched \n with a driver",
                        textAlign: TextAlign.center, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.7,

                            fontSize: 28
                        ),),
                      SizedBox(height: size.height * 0.015,),
                      const Text(
                        "A nearby driver sees and chooses to accept the\n rider’s ride request. The rider is automatically notified when the driver’s vehicle is about a minute away.",
                        textAlign: TextAlign.center, style: TextStyle(
                        // fontWeight: FontWeight.bold,
                          letterSpacing: 0.7,
                          color: Color(0xFF868686
                          )
                      ),),



                    ],
                  ),
                ),
              )
            ],

      ),
    );
  }



}
