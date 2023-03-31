
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/widgets/circleBackButton.dart';
class HelpAndSupport_Screen extends StatelessWidget {
   HelpAndSupport_Screen({Key? key}) : super(key: key);

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
        title: const Text("Help & Support",textAlign: TextAlign.center,style: TextStyle(
            fontSize: 18,
            color: darkBlueColor,
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
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 24 ,vertical: 8),
        child: Column(
          children: [
            SizedBox(height: size.height*0.02,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 6),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              width: size.width,
              height: size.height*0.08,
              decoration: BoxDecoration(
                  color: whiteColor,
                boxShadow:
                    const [
                      BoxShadow(
                          blurRadius: 1,
                          spreadRadius: 2,
                        color: whiteSmokeColor,
                        // color: Colors.red,
                        offset: Offset(1,1),
                      )  ,
                    ],


                border: Border.all(
                    color: lightColor,
                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search,color: greyChateauColor,),
                    hintText: "Search Help Articles...",
                    hintStyle: TextStyle(fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: greyChateauColor,)

                  ),),
              ),
              ),

            SizedBox(height: size.height*0.02,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(


                      title: Text(titleList[index],style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: darkBlueColor,
                      ),
                    ),
                      trailing: IconButton(
                        onPressed:(){},
                        icon: const Icon(Icons.arrow_forward_ios_rounded,
                          color: grayColor,),
                      ),

                    );

                  },padding: const EdgeInsets.symmetric(horizontal: 1),
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: lightGreyColor,
                      thickness: 1,
                    );
                  },
                  itemCount: titleList.length),
            )
          ],
        ),
      ),
    );
  }
  List<String> titleList =[
    "Help with Trip",
    "Account & Payment",
    "A Guide to MyBobby",
    "About cancellation policy",
    "Call us",
  ];
}
