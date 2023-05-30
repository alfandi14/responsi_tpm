import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tpm_responsi/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final String text, route;

  const CustomButton({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            text,
            textAlign: TextAlign.center,
          )),
      style: ElevatedButton.styleFrom(
        primary: subColor,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        textStyle: GoogleFonts.poppins(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
