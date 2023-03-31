import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/screens/confirmTrip_screen.dart';
import 'package:mybobby/widgets/customArrowButton.dart';

class ChooseDriver_Screen extends ConsumerStatefulWidget {
 final double? lat;
 final double? lng;
  const ChooseDriver_Screen({Key? key,
  this.lat,
    this.lng,
  }) : super(key: key);

  @override
  ConsumerState<ChooseDriver_Screen> createState() => _ChooseDriver_ScreenState();
}

class _ChooseDriver_ScreenState extends ConsumerState<ChooseDriver_Screen> {
  List<String> imageList = [
    "assets/images/star.png",
    "assets/images/rocky.png",
  ];

  List<String> titleList = [
    "Bobby Classic",
    "Bobby Rocky",
  ];

  List<String> subTitleList = [
    "● Where does it come from? \n.Why do we use it? \n.Where can I get some?",
    ".Where does it come from?\n.Why do we use it? \n.Where can I get some?",
  ];

  List<String> priceList = [
    "\$100",
    "\$150",
  ];

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          systemStatusBarContrastEnforced: true),
      child: Container(
        decoration:   const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: blueGradientColor

              ),
        ),
        child: Scaffold(
          backgroundColor: transparentColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            automaticallyImplyLeading: false,
            elevation: 0,
            // leadingWidth: size.width*0.5,
            //
            // leading: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
            //   child: Image.asset("assets/images/Logo.png",fit: BoxFit.fill,),
            // ),
            titleSpacing: 0,

            title: Padding(
              padding: const EdgeInsets.only(top: 18, left: 24),
              child: Image.asset(
                "assets/images/Logo.png",
                fit: BoxFit.fill,
              ),
            ),

            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 48,
                  height: 48,
                  margin: const EdgeInsets.only(right: 24, top: 10),
                  // padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: lightGreyColor)),
                  child: Image.asset("assets/images/cross.png"),
                ),
              )
            ],
          ),
          body: Container(
            width: size.width,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Choose Driver",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: darkBlueColor),
                ),
                SizedBox(
                  height: size.height * 0.024,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: titleList.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 24,
                      );
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 16,right: 16,bottom: 32,left: 16),

                          decoration: BoxDecoration(
                            border: Border.all(
                                color: selectedIndex == index
                                    ? navyBlueColor
                                    : lightGreyColor),
                            borderRadius: BorderRadius.circular(20),
                            color: selectedIndex == index
                                ? lightColor
                                : whiteColor,
                          ),
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 58,
                                  height: 58,
                                  child: Image.asset(
                                    imageList[index],
                                    fit: BoxFit.contain,
                                  )),
                              const SizedBox(width: 16,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 5,),
                                    Text(
                                      titleList[index],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: darkBlueColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      priceList[index],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: darkBlueColor,
                                      ),
                                    ),
                                    const SizedBox(height: 12,),
                                    Row(
                                      children: [
                                        dotContainer(),
                                        const SizedBox(width:4 ,),
                                        Text(
                                          "Where does it come from? ",
                                          style: TextStyle(
                                            fontSize: 12,
                                              color:  darkBlueColor
                                                  .withOpacity(0.6),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3,),
                                    Row(
                                      children: [
                                        dotContainer(),
                                        const SizedBox(width:4 ,),
                                        Text(
                                          "Why do we use it?",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: darkBlueColor
                                                  .withOpacity(0.6),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3,),
                                    Row(
                                      children: [
                                        dotContainer(),
                                        const SizedBox(width:4 ,),
                                        Text(
                                          "Where can I get some? ",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: darkBlueColor
                                                  .withOpacity(0.6),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 8),
                                 child: SizedBox(
                                        height: 24,
                                        width: 24,
                                        child:selectedIndex==index? Image.asset(
                                          "assets/images/greentick.png",
                                          fit: BoxFit.fill,
                                        ):null),
                               )


                            ],

                          )

                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.024,
                ),
                CustomArrowButton(
                    title: "Continue",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ConfirmTrip_Screen(lng: widget.lng,lat: widget.lat,)));
                    }),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Center(
                    child: Text(
                  "Skip",
                  style: TextStyle(color: darkBlueColor),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget dotContainer() {
  return Container(
    width: 10,
    height: 5,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: darkBlueColor.withOpacity(0.6),
    ),
  );
}
