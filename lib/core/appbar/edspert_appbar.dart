import 'package:edspert_intensive_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_intensive_final_project/utils/edspert_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EdspertAppBar {
  AppBar main(String title) {
    return AppBar(
      backgroundColor: EdspertColor.topColor,
      leading: IconButton(
          onPressed: () => EdspertNavigation().pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      title: Center(
        child: Text(
          title,
          style: GoogleFonts.openSans(color: Colors.white),
        ),
      ),
    );
  }
}