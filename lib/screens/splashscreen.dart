import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/screens/tracking_screen.dart';
import 'package:mybobby/services/local_storage_service.dart';
import 'package:mybobby/screens/home.dart';
import 'package:mybobby/screens/login.dart';

import '../models/user_detail.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    try {
      final user = ref.read(localStorageProvider).getUserDetails();
      final rideId = ref.read(localStorageProvider).getRideId();
      Future.delayed(const Duration(milliseconds: 800), () {
        if (user != null) {
          ref.read(userProvider.notifier).update((state) => state = user);
          if (rideId != null) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => TrackingScreen(rideId: rideId),
            ));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
          }
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
        }
      });
    } catch (e) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
    /*  Timer(const Duration(seconds: 3),() =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>OnBoarding_Screen())),);*/
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Image.asset(
          "assets/images/Splash.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
