import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/widgets/custombutton.dart';

class Add_Address extends StatefulWidget {
   const Add_Address({Key? key}) : super(key: key);

  @override
  State<Add_Address> createState() => _Add_AddressState();
}

class _Add_AddressState extends State<Add_Address> {
List<String> addressType =[
  "Home",
  "Office",
  "Other"
];

   int selectedIndex=-1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light),
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/map.png"),
                        fit: BoxFit.fill)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: size.width,
                  height: size.height * 0.4,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(minVerticalPadding: 10,

                        leading: Image.asset("assets/images/location.png"),
                        title:   const Text(
                          "San Francisco, California", style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: darkBlueColor),

                        ),
                        subtitle: const Text("3517 W. Gray St. Utica, Pennsylvania 57867",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: sliverColor),),
                      ),

                      SizedBox(
                        height: size.height * 0.024,
                      ),
                      const Text(
                        "    CHOOSE ADDRESS TYPE", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 1,
                          color: blackColor),

                      ),

                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      SizedBox(
                        width: size.width,
                        height: size.height*0.08,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          shrinkWrap: true,
                            scrollDirection: Axis.horizontal  ,
                            itemBuilder: (context, index) {
                          return  GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedIndex=index;
                              });
                            },
                            child: Container(
                                width: size.width * 0.23,
                                // height: size.height * 0.02,
                              padding: const EdgeInsets.symmetric( horizontal: 8,vertical: 2),
                                decoration: BoxDecoration(
                                    color:selectedIndex==index? lightWhiteColor: whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                        color:blackColor
                                            .withOpacity(0.08),
                                        // blurStyle: BlurStyle.outer,
                                        // color: Colors.red,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                    border:selectedIndex==index?  Border.all(
                                        color: lightWhiteColor,
                                        width: 1,
                                        style: BorderStyle.solid
                                    ):Border.all(
                                        color:lightGreyColor,
                                        width: 1,
                                        style: BorderStyle.solid
                                    ),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child:  selectedIndex==index?Text(addressType[index],style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: darkBlueColor
                                  ),):Text(addressType[index],style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: darkBlueColor
                                  ),)
                                )),
                          );
                        },
                            separatorBuilder:(context, index) {
                              return SizedBox(width: size.width*0.05) ;
                            },
                            itemCount: addressType.length),
                      ),
                      // SizedBox(
                      //   height: size.height * 0.04,
                      // ),

                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child:    Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomButton(title: "Saved Address", onPressed: (){}),
                ),
              )
            ],
          ),
        ));
  }
}
