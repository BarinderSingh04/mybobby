import 'package:flutter/material.dart';

class PersonBackButton extends StatelessWidget {
  const PersonBackButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: const Color(0xff000014),
        shape: const CircleBorder(
          side: BorderSide(
            style: BorderStyle.solid,
            color: Color(0xFFEBEBEB),
            width: 1,
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        // fixedSize: Size(size.width, 56),

        padding: const EdgeInsets.all(15),
      ),
      child: Image.asset(
        'assets/images/person.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
