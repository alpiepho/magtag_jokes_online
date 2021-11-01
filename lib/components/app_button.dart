import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AppButton(
      {required this.margin,
      this.disabled = false,
      this.cardChild,
      this.onPress});

  final EdgeInsets margin;
  final bool disabled;
  final Widget? cardChild;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPress as void Function()?,
      child: Container(
        child: cardChild,
        margin: margin,
        width: double.infinity,
      ),
    );
  }
}
