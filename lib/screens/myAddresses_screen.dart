import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybobby/screens/addAddress_screen.dart';

import '../widgets/circleBackButton.dart';

class MyAddresses_Screen extends StatelessWidget {
  MyAddresses_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "My Addresses",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xFF010317)),
        ),
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24, top: 5, bottom: 5),
          child: CircleBack_Button(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        isThreeLine: true,
                        contentPadding: EdgeInsets.zero,
                        leading: SizedBox(
                            width: 46,
                            height: 46,
                            child: Image.asset(
                              imageList[index],
                              fit: BoxFit.fill,
                            )),
                        title: Text(
                          titleList[index],
                          style: const TextStyle(
                              color: Color(0xFF010317),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        minVerticalPadding: 14,
                        subtitle: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              subTitleList[index],
                              style: const TextStyle(
                                  color: Color(0xFF868686),
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: size.height * 0.024,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Add_Address()));
                                  },
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(
                                        color: Color(0xFF002F60),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(
                                  width: 47,
                                ),
                                const Text(
                                  "Delete",
                                  style: TextStyle(
                                      color: Color(0xFF868686),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: titleList.length),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFFFFFFFF),
                  fixedSize: Size(size.width, 56),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color(0xFFEBEBEB),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Add new address",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF002F60),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> titleList = ["Home", "Office", "Other"];
  List<String> subTitleList = [
    "3517 W. Gray St. Utica, Pennsylvania 57867",
    "3517 W. Gray St. Utica, Pennsylvania 57867",
    "3517 W. Gray St. Utica, Pennsylvania 57867",
  ];
  List<String> imageList = [
    "assets/images/homeicon.png",
    "assets/images/office.png",
    "assets/images/location.png",
  ];
}
