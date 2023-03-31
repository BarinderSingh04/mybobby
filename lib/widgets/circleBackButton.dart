import 'package:flutter/material.dart';

class CircleBack_Button extends StatelessWidget {
  const CircleBack_Button({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.grey,
        shape: const CircleBorder(
          side: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: Color(0xFFEBEBEB),
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        // fixedSize: Size(size.width, 56),

        padding: EdgeInsets.all(size.width * 0.02),
      ),
      child: Image.asset(
        'assets/images/back.png',
        fit: BoxFit.fill,
      ),
    );
  }
  // ElevatedButton(
  //
  // onPressed: onPressed,
  // child: Image.asset('assets/images/back.png',fit: BoxFit.fill,),
  // style: ElevatedButton.styleFrom(
  // shape: CircleBorder(
  // side: BorderSide(color:  Color(0xFFEBEBEB),width: 1
  // )
  // ),
  // elevation: 0,
  // backgroundColor:Color(0xFFFFFFFF),
  // // fixedSize: Size(size.width, 56),
  //
  //
  // padding: EdgeInsets.all(15),
  // ),
  // );

  //
  // IconButton(
  //
  // onPressed: onPressed,
  // icon: Image.asset('assets/images/back.png',fit: BoxFit.fill,),
  // style: IconButton.styleFrom(
  // shape: CircleBorder(
  // side: BorderSide(color:  Color(0xFFEBEBEB),width: 1
  // )
  // ),
  // elevation: 0,
  // backgroundColor:Color(0xFFFFFFFF),
  // // fixedSize: Size(size.width, 56),
  //
  //
  // padding: EdgeInsets.all(15),
  // ),
  // );
}
