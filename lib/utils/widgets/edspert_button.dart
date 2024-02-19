import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EdspertButton {
  Widget primary({required String text, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        margin: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 25,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
                colors: [Color(0xff867AD2), Color(0xff6C61AF)])),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.openSans(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget full({required String text, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
                colors: [Color(0xff867AD2), Color(0xff6C61AF)])),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.openSans(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget icon(
      {required String svg, required String text, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        margin: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 25,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
                colors: [Color(0xff867AD2), Color(0xff6C61AF)])),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svg,
                width: 20,
                height: 16,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget regular({required String text, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
                colors: [Color(0xff867AD2), Color(0xff6C61AF)]),),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.openSans(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
