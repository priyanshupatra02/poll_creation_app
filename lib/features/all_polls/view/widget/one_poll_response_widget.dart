import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:poll_creation_app/const/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class OnePollResponseWidget extends StatelessWidget {
  const OnePollResponseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppColors.kSecondaryColor,
                offset: Offset(4, 6),
                blurRadius: 2,
              ),
            ],
            border: GradientBoxBorder(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.kPrimaryColor.withOpacity(0.04),
                  AppColors.kPrimaryColor,
                ],
              ),
              width: 2,
            ),
          ),
          child: LinearProgressIndicator(
            value: 0.34,
            backgroundColor: AppColors.kFillColor,
            minHeight: 60,
            borderRadius: BorderRadius.circular(10),
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.kPrimaryColor.withOpacity(0.6),
            ),
          ),
        ),
        'US Intel Aids Canada in Nijjar Case \n 34%'
            .text
            .align(TextAlign.center)
            .size(16)
            .color(AppColors.kTertiaryColor)
            .make(),
      ],
    );
  }
}
