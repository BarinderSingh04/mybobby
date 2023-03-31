import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybobby/screens/helpandsupport_screen.dart';
import 'package:mybobby/screens/drawer_widget.dart';
import 'package:mybobby/screens/message_screen.dart';
import 'package:mybobby/screens/paymentMethod_screen.dart';
import 'package:timelines/timelines.dart';

import '../widgets/menuButton.dart';

class Tracking_Screen extends StatefulWidget {
  const Tracking_Screen({Key? key}) : super(key: key);

  @override
  State<Tracking_Screen> createState() => _Tracking_ScreenState();
}

class _Tracking_ScreenState extends State<Tracking_Screen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        // systemStatusBarContrastEnforced: true
      ),
      child: Scaffold(
        key: _key,
        drawer: const DrawerWidget(),
        body: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/confirmtrip.png"),
                      fit: BoxFit.fill)),
            ),
            Positioned(
              top: MediaQuery.of(context).viewPadding.top + 25,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuButton(onPressed: () {
                    _key.currentState!.openDrawer();
                  }),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width,
                height: size.height * 0.43,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF000000).withOpacity(0.12))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "ESTIMATED DISTANCE",
                      style: TextStyle(
                          color: Color(0xFF010317),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text.rich(
                      TextSpan(
                          text: "1.5  ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                              color: Color(0xFF010317)),
                          children: [
                            TextSpan(
                                text: "KMS",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF010317)))
                          ]),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    FixedTimeline(
                      direction: Axis.vertical,
                      children: [
                        TimelineTile(
                          nodeAlign: TimelineNodeAlign.start,
                          node: const TimelineNode(
                            indicator: OutlinedDotIndicator(
                              color: Color(
                                0xFFFAE046,
                              ),
                              size: 23,
                              borderWidth: 8,
                              backgroundColor: Colors.white,
                            ),
                            endConnector: SizedBox(
                              height: 15,
                              child: DecoratedLineConnector(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFf8f2c9),
                                      Color(0xFFefe49f),
                                      Color(0xFFEAD23E),
                                      Color(0xFFbfc3a6),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          contents: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              const Text(
                                "3517 W. Gray St. Utica, Pennsylvani...",
                                style: TextStyle(
                                  color: Color(0xFF212334),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TimelineTile(
                          nodeAlign: TimelineNodeAlign.start,
                          node: const TimelineNode(
                            indicator: OutlinedDotIndicator(
                              color: Color(
                                0xFF002F60,
                              ),
                              size: 23,
                              borderWidth: 8,
                              backgroundColor: Colors.white,
                            ),
                            startConnector: SizedBox(
                              height: 15,
                              child: DecoratedLineConnector(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFbfc3a6),
                                      Color(0xFF889daf),
                                      Color(0xFF002F60),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          contents: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              const Text(
                                "8502 Preston Rd. Inglewood, Maine 98380",
                                style: TextStyle(
                                  color: Color(0xFF212334),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // FlutterPhoneDirectCaller.callNumber('tel:+1234845313');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF4F5F5),
                                    border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: const Color(0xFFEBEBEB),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset("assets/images/call.png"),
                                ),
                              ),
                              const Text(
                                "Call Driver",
                                style: TextStyle(
                                    color: Color(0xFF212334),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Message_Screen()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF4F5F5),
                                    border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: const Color(0xFFEBEBEB),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child:
                                      Image.asset("assets/images/message.png"),
                                ),
                              ),
                              const Text(
                                "Message",
                                style: TextStyle(
                                    color: Color(0xFF212334),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF4F5F5),
                                    border: Border.all(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: const Color(0xFFEBEBEB),
                                    ),
                                    shape: BoxShape.circle),
                                child: Image.asset("assets/images/share.png"),
                              ),
                              const Text(
                                "Share",
                                style: TextStyle(
                                    color: Color(0xFF212334),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: size.width * 0.89,
                height: size.height * 0.1,
                decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    leading: Image.asset("assets/images/boypic.png"),
                    title: const Text(
                      "Guy Hawkins",
                      style: TextStyle(
                          color: Color(0xFF010317),
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    minVerticalPadding: 10,
                    subtitle: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 24,
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xFFEFEFEF),
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "4.5",
                                style: TextStyle(
                                    color: Color(0xFF201C1D),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image.asset("assets/images/yellowstargd.png")
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(context) {
  showModalBottomSheet(
      // constraints: BoxConstraints(maxHeight:900),
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      )),
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return FractionallySizedBox(
          heightFactor: 0.94,
          child: Container(
            // width: size.width,
            // height: size.height,

            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    // color: Colors.white,
                    height: 323,
                    child: Column(
                      children: [
                        Container(
                          width: 116,
                          height: 116,
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topLeft,
                              colors: [
                                Color(0xFF002F60),
                                Color(0xFF8E924B),
                                Color(0xFFEAD23E)
                              ],
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/expandboypic.png"),
                              radius: 50,
                            ),
                          ),
                        ),
                        const Text(
                          "Guy Hawkins",
                          style: TextStyle(
                              color: Color(0xFF010317),
                              fontWeight: FontWeight.w700,
                              fontSize: 28),
                        ),
                        Container(
                          width: 60,
                          height: 24,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xFFF4F5F5),
                              border: Border.all(
                                color: const Color(0xFFEFEFEF),
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "4.5",
                                style: TextStyle(
                                    color: Color(0xFF201C1D),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image.asset("assets/images/yellowstargd.png")
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          width: size.width,
                          height: size.height * 0.10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFF4F5F5),
                                        border: Border.all(
                                          width: 1,
                                          style: BorderStyle.solid,
                                          color: const Color(0xFFEBEBEB),
                                        ),
                                        shape: BoxShape.circle),
                                    child:
                                        Image.asset("assets/images/call.png"),
                                  ),
                                  const Text(
                                    "Call Driver",
                                    style: TextStyle(
                                        color: Color(0xFF212334),
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Message_Screen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      margin: const EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFF4F5F5),
                                          border: Border.all(
                                              width: 1,
                                              style: BorderStyle.solid,
                                              color: const Color(0xFFEBEBEB)),
                                          shape: BoxShape.circle),
                                      child: Image.asset(
                                          "assets/images/message.png"),
                                    ),
                                  ),
                                  const Text(
                                    "Message",
                                    style: TextStyle(
                                        color: Color(0xFF212334),
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFF4F5F5),
                                        border: Border.all(
                                            width: 1,
                                            style: BorderStyle.solid,
                                            color: const Color(0xFFEBEBEB)),
                                        shape: BoxShape.circle),
                                    child:
                                        Image.asset("assets/images/share.png"),
                                  ),
                                  const Text(
                                    "Share",
                                    style: TextStyle(
                                        color: Color(0xFF212334),
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 6,
                  decoration: const BoxDecoration(color: Color(0xFFF4F5F5)),
                ),
                Container(
                  width: size.width,
                  height: 150,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF000000).withOpacity(0.12))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "TRIP",
                            style: TextStyle(
                                color: Color(0xFF010317),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                letterSpacing: 1),
                          ),
                          Text.rich(
                            TextSpan(
                                text: "5-10  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0xFF010317)),
                                children: [
                                  TextSpan(
                                      text: "mins",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF010317)))
                                ]),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.008,
                      ),
                      FixedTimeline(
                        direction: Axis.vertical,
                        children: [
                          TimelineTile(
                            nodeAlign: TimelineNodeAlign.start,
                            node: const TimelineNode(
                              indicator: OutlinedDotIndicator(
                                color: Color(
                                  0xFFFAE046,
                                ),
                                size: 23,
                                borderWidth: 8,
                                backgroundColor: Colors.white,
                              ),
                              endConnector: SizedBox(
                                height: 12,
                                child: DecoratedLineConnector(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFf8f2c9),
                                        Color(0xFFefe49f),
                                        Color(0xFFEAD23E),
                                        Color(0xFFbfc3a6),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            contents: Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                const Text(
                                  "3517 W. Gray St. Utica, Pennsylvani...",
                                  style: TextStyle(
                                    color: Color(0xFF212334),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TimelineTile(
                            nodeAlign: TimelineNodeAlign.start,
                            node: const TimelineNode(
                              indicator: OutlinedDotIndicator(
                                color: Color(
                                  0xFF002F60,
                                ),
                                size: 23,
                                borderWidth: 8,
                                backgroundColor: Colors.white,
                              ),
                              startConnector: SizedBox(
                                height: 12,
                                child: DecoratedLineConnector(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFbfc3a6),
                                        Color(0xFF889daf),
                                        Color(0xFF002F60),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            contents: Row(
                              children: [
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                const Text(
                                  "8502 Preston Rd. Inglewood, Maine 98380",
                                  style: TextStyle(
                                    color: Color(0xFF212334),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 6,
                  decoration: const BoxDecoration(color: Color(0xFFF4F5F5)),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.22,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF000000).withOpacity(0.12))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "PAYMENT DETAILS",
                        style: TextStyle(
                            color: Color(0xFF010317),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "\$43.00",
                        style: TextStyle(
                            color: Color(0xFF212334),
                            fontWeight: FontWeight.w700,
                            fontSize: 28),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Divider(
                        color: Color(0xFFEBEBEB),
                        thickness: 1,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentMethod_Screen()));
                            },
                            child: const Text(
                              "Pay now",
                              style: TextStyle(
                                  color: Color(0xFF002F60),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentMethod_Screen()));
                            },
                            child: Row(
                              children: [
                                Image.asset('assets/images/stripe.png'),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xFFA1A1A1),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 6,
                  decoration: const BoxDecoration(color: Color(0xFFF4F5F5)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xFFFFFFFF),
                        fixedSize: Size(size.width, 56),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color(0xFFEBEBEB),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpAndSupport_Screen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/help.png"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Need Help",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF002F60),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
