import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mybobby/screens/login.dart';
import 'package:mybobby/screens/onBoarding_ScreenPage.dart';

import '../widgets/customArrowButton.dart';

class OnBoarding_Screen extends StatefulWidget {
  const OnBoarding_Screen({Key? key}) : super(key: key);

  @override
  State<OnBoarding_Screen> createState() => _OnBoarding_ScreenState();
}

class _OnBoarding_ScreenState extends State<OnBoarding_Screen> {
  PageController controller = PageController(initialPage: 0);

  int currentPageValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE2F0FF),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFFE2F0FF),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
      ),
      extendBody: true,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  currentPageValue = index;
                });
              },
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: const [
                OnBoarding_ScreenPage(),
                OnBoarding_ScreenPage(),
                OnBoarding_ScreenPage(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicator(currentPageValue),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  CustomArrowButton(
                    title: "Get Started",
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Skip",
                    style: TextStyle(color: Color(0xFF010317)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget customIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 250),
      height: 20,
      width: 20,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        border: isActive
            ? Border.all(
                color: const Color(0xFF002F60),
                style: BorderStyle.solid,
                width: 1,
              )
            : null,
        shape: BoxShape.circle,
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? null : const Color(0xFF010317).withOpacity(0.2),
          gradient: isActive
              ? const LinearGradient(
                  // begin: Alignment.topRight,
                  // end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFFAE046),
                    Color(0xFFB29E22),
                  ],
                )
              : null,
        ),
      ),
    );
  }

  List<Widget> _buildIndicator(int currentIndex) {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(customIndicator(true));
      } else {
        indicators.add(customIndicator(false));
      }
    }
    return indicators;
  }
}
