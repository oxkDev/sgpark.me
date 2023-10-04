import 'package:flutter/cupertino.dart';

import '../const.dart';
import '../main.dart';

class CardSecondary extends StatelessWidget {
  @override
  final Widget child;
  final Color backgroundColour;
  final Color? shadow;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? height;

  const CardSecondary({
    Key? key,
    required this.child,
    this.borderRadius,
    this.backgroundColour = MainColours.white,
    this.height,
    this.margin,
    this.padding,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      padding: padding,
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColour,
        borderRadius: borderRadius?? BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.025)),
        boxShadow: shadow == null
            ? null
            : <BoxShadow>[
                boxShadow(shadow!),
              ],
      ),
      child: child,
    );
  }
}
