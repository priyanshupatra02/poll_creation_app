import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poll_creation_app/const/app_colors.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Moderators Poll',
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: AppColors.kTertiaryColor,
      ),
    );
  }
}
