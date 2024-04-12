import 'package:flutter/material.dart';
import 'package:poll_creation_app/const/app_colors.dart';

class HeaderText extends StatelessWidget {
  final String headerText;
  final double? size;
  final Color? color;

  const HeaderText({
    super.key,
    required this.headerText,
    this.size = 16,
    this.color = AppColors.kHeaderTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
