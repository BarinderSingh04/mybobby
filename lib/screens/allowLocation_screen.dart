import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:mybobby/commonClass/commonColors.dart';
import 'package:mybobby/screens/home.dart';
import 'package:mybobby/widgets/custombutton.dart';

class AllowLocation_Screen extends ConsumerStatefulWidget {
  const AllowLocation_Screen({Key? key}) : super(key: key);

  @override
  ConsumerState<AllowLocation_Screen> createState() =>
      AllowLocation_ScreenState();
}

class AllowLocation_ScreenState extends ConsumerState<AllowLocation_Screen> {
  Location location = Location();
  Future fetchLocation() async {
    PermissionStatus permissionGranted;
    permissionGranted = await location.requestPermission();
    if (permissionGranted == PermissionStatus.granted) {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset("assets/images/locationbg.png",
                fit: BoxFit.contain),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text(
                        "Allow Location",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          color: darkBlueColor,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "This app requires that Location services are \n "
                        "turned on your device and for this app. You must"
                        "\n enable them in settings before using this app.",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: sliverColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(
                          title: "Allow only while using the app",
                          onPressed: () async {
                            fetchLocation();
                          }),
                      const SizedBox(
                        height: 1,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: const Text(
                          "Don’t allow this app",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkBlueColor,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
