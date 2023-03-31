import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mybobby/Services/local_storage_service.dart';
import 'package:mybobby/models/user.dart';
import 'package:mybobby/screens/home.dart';
import 'package:mybobby/screens/login.dart';

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
      Future.delayed(const Duration(milliseconds: 800), () {
        final user = ref.read(localStorageProvider).getUserDetails();
        if (user != null) {
          ref.read(userProvider.notifier).update((state) => state = user);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const Login_Screen(),
          ));
        }
      });
    } catch (e) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Login_Screen(),
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
