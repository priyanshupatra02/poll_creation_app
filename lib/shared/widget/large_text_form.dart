import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poll_creation_app/const/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

class LargeTextForm extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isReadOnly;
  final bool isObscureText;
  final bool? isFilled;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final Color? filledColor;
  final bool? isErrorText;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final InputBorder? enabledBorder;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;
  final String name;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? initialValue;
  final int? minLine;
  final int? maxLine;
  final bool? autoFocus;
  final bool? isDense;
  final Color? enabledBorderColor;
  final InputBorder? focusedBorder;
  final void Function(String?)? onSubmit;
  final double fontSize;
  final double? letterSpacing;
  final void Function(PointerDownEvent)? onTapOutside;
  const LargeTextForm({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.isReadOnly = false,
    this.validator,
    required this.hintText,
    this.keyboardType,
    this.onTap,
    this.focusNode,
    this.onChanged,
    required this.name,
    this.textInputAction,
    this.controller,
    this.initialValue,
    this.minLine,
    this.maxLine = 1,
    this.enabledBorderColor,
    this.focusedBorder,
    this.fontSize = 16,
    this.letterSpacing = 0.3,
    this.isErrorText = false,
    this.autoFocus = false,
    this.isFilled = false,
    this.filledColor = Colors.transparent,
    this.isObscureText = false,
    this.onTapOutside,
    this.onSubmit,
    this.isDense = true,
    this.contentPadding = EdgeInsets.zero,
    this.border,
    this.enabledBorder,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: controller,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      onTapOutside: onTapOutside,
      onSubmitted: onSubmit,
      name: name,
      autofocus: autoFocus!,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: isObscureText,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: isReadOnly,
      minLines: minLine,
      maxLines: maxLine, // to allow the text field to expand vertically as more lines are added
      style: GoogleFonts.inter(
        fontSize: Vx.dp16,
        color: Colors.white.withOpacity(0.7),
        fontWeight: FontWeight.w600,
      ),
      focusNode: focusNode,
      validator: validator,
      decoration: InputDecoration(
        isDense: isDense,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding,
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          fontSize: Vx.dp16,
          color: Colors.white.withOpacity(0.2),
          fontWeight: FontWeight.w600,
        ),
        filled: isFilled,
        fillColor: filledColor,
        errorStyle: isErrorText! ? const TextStyle(color: AppColors.kErrorColor) : null,
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kErrorColor, width: 1.0),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.kErrorColor, width: 1.0),
          borderRadius: BorderRadius.circular(8),
        ),
        border: border ?? InputBorder.none,
      ),
    );
  }
}

/**
 * Consequat tempor reprehenderit in ad. Et sint dolore Lorem laborum esse enim reprehenderit cupidatat tempor. Excepteur eu culpa deserunt magna culpa culpa ut exercitation aliquip commodo aute. Ad est veniam aliqua quis nisi commodo non. Fugiat est elit exercitation in amet officia fugiat eiusmod do.
 */