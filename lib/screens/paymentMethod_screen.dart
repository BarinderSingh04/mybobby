import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybobby/widgets/custombutton.dart';

import '../widgets/circleBackButton.dart';

class PaymentMethod_Screen extends StatelessWidget {
  const PaymentMethod_Screen({Key? key}) : super(key: key);

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
          "Payment Method",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              color: Color(0xFF010317),
              fontWeight: FontWeight.w800),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.005,
              ),
              SizedBox(
                width: 104,
                height: 48,
                child: Image.asset(
                  "assets/images/stripe.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: size.height * 0.022,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Card Number ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF010317)),
                    ),
                    SizedBox(
                      height: size.height * 0.012,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          hintText: "Enter card number here...",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade500),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFF002F60), width: 2),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFEBEBEB), width: 2),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          fillColor: const Color(0xFFF4F5F5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.024,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Expiry Date",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF010317)),
                              ),
                              SizedBox(
                                height: size.height * 0.012,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    hintText: "Expiry date",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF002F60), width: 2),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade500),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFEBEBEB), width: 2),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    fillColor: const Color(0xFFF4F5F5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.020,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Card Code(CVC)",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF010317)),
                              ),
                              SizedBox(
                                height: size.height * 0.012,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    filled: true,
                                    hintText: "Card code",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF002F60), width: 2),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade500),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFEBEBEB), width: 2),
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    fillColor: const Color(0xFFF4F5F5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.3,
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
                        "Pya Later",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF002F60),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.018,
                    ),
                    CustomButton(
                      title: "Pay(43.00)",
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
