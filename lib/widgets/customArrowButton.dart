
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomArrowButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

   const CustomArrowButton({super.key,  required this.title, required this.onPressed, });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,

          backgroundColor:const Color(0xFF002F60),
          fixedSize: Size(size.width, 56),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      onPressed: onPressed,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style:GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700
            ),
          ),
          const SizedBox(width: 4,),
          Image.asset("assets/images/whitearrowright.png")
        ],
      ),
    );
  }
}