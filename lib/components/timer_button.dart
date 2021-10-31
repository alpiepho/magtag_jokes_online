import 'package:flutter/material.dart';
//import 'package:timers_tn/constants.dart';

class TimerButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TimerButton({
    required this.margin, 
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
        onTap: onPress as void Function()?,
        child: Container(
          child: cardChild,
          margin: margin,
          width: double.infinity,
        ),
      );
  }
}
