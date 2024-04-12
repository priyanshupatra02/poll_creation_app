import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:poll_creation_app/features/homepage/const/home_page_form_keys.dart';
import 'package:poll_creation_app/shared/widget/large_text_form.dart';

class TopicForm extends StatelessWidget {
  const TopicForm({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: LargeTextForm(
        hintText: 'write here...',
        name: HomepageFormKeys.topic,
        isDense: false,
        maxLine: null,
        minLine: 5,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        enabledBorder: GradientOutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          width: 0.75,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // stops: [0.1, 0.9],
            colors: [
              Colors.white.withOpacity(0.02),
              Colors.white.withOpacity(0.5),
              Colors.white,
            ],
          ),
        ),
        focusedBorder: GradientOutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          width: 0.75,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // stops: [0.1, 0.9],
            colors: [
              Colors.white.withOpacity(0.01),
              Colors.white,
              Colors.white,
              Colors.white,
            ],
          ),
        ),
      ),
    );
  }
}
