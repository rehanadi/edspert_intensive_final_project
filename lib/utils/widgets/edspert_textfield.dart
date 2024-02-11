import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EdspertTextField {
  Widget textField(String hintText, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 47),
      decoration: BoxDecoration(
        color: const Color(0xff2F2C44),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          TextField(
            onChanged: (String value) {},
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.openSans(
                color: Colors.white.withOpacity(0.2),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.white.withOpacity(0.2),
              ),
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}