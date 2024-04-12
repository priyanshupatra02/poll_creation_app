import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:poll_creation_app/const/app_colors.dart';
import 'package:poll_creation_app/features/homepage/view/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

class PollWidget extends StatefulWidget {
  final Polls? selectedRadio;
  final String headerText;
  final Polls? value;
  final bool isSelected;
  final void Function(Polls?)? onChanged;
  const PollWidget({
    super.key,
    this.selectedRadio = Polls.mcq,
    required this.onChanged,
    required this.headerText,
    required this.value,
    required this.isSelected,
  });

  @override
  State<PollWidget> createState() => _PollWidgetState();
}

class _PollWidgetState extends State<PollWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged!(widget.value);
      },
      child: Opacity(
        opacity: widget.isSelected ? 1 : 0.5,
        child: Container(
          width: context.screenWidth * 0.27,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: widget.isSelected ? AppColors.kFillColor.withOpacity(0.6) : Colors.transparent,
            border: GradientBoxBorder(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.kPrimaryColor.withOpacity(0.06),
                  AppColors.kPrimaryColor,
                ],
              ),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              widget.headerText.text.uppercase
                  .color(AppColors.kHeaderTextColor)
                  .size(15)
                  .bold
                  .make(),
              'Poll'.text.color(AppColors.kHeaderTextColor).size(14).make(),
              Radio<Polls?>(
                value: widget.value,
                groupValue: widget.selectedRadio,
                onChanged: widget.onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
