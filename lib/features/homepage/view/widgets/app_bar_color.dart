import 'package:flutter/material.dart';
import 'package:poll_creation_app/const/app_colors.dart';

class AppBarColor extends StatelessWidget {
  const AppBarColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.primaryColor,
            AppColors.secondPrimaryColor,
          ],
        ),
      ),
    );
  }
}
