import 'package:flutter/material.dart';
import 'package:poll_creation_app/const/app_colors.dart';
import 'package:poll_creation_app/shared/widget/animated_widgets/jumping_dots.dart';
import 'package:velocity_x/velocity_x.dart';

class PrimaryActionButton extends StatelessWidget {
  final String buttonLabel;
  final void Function()? onPressed;
  final bool isLoading;
  const PrimaryActionButton({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
          fixedSize: Size(context.screenWidth * 0.5, 65),
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      child: isLoading
          ? JumpingDots(
              color: AppColors.kTertiaryColor,
              radius: 10,
              animationDuration: const Duration(milliseconds: 250),
            )
          : buttonLabel.text.size(20).bold.color(AppColors.kSecondaryColor).make(),
    );
  }
}
