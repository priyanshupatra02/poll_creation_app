import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poll_creation_app/const/app_colors.dart';

class AppBarTitle extends StatelessWidget {
  final String appbarTitle;
  const AppBarTitle({
    super.key, required this.appbarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      appbarTitle,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: AppColors.kTertiaryColor,
      ),
    );
  }
}
