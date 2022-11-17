import 'package:flutter/cupertino.dart';
import 'package:sgpark_me/const.dart';
import 'package:sgpark_me/main.dart';

class CardPrimary extends StatelessWidget {
  final Widget child;
  final Color backgroundColour;
  final Color? shadow;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final BoxConstraints? constraints;

  const CardPrimary({
    Key? key,
    required this.child,
    this.borderRadius,
    this.backgroundColour = MainColours.lightGrey,
    this.height,
    this.width = double.infinity,
    this.margin,
    this.padding,
    this.shadow,
    this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget = Container(
      margin: margin == null
          ? EdgeInsets.all(MediaQuery.of(context).size.width * 0.02)
          : margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColour,
        borderRadius: borderRadius == null
            ? BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.035))
            : borderRadius!,
        boxShadow: shadow == null
            ? null
            : <BoxShadow>[
                boxShadow(shadow!),
              ],
      ),
      child: child,
    );
    if (constraints == null) {
      return widget;
    } else {
      return ConstrainedBox(constraints: constraints!, child: widget);
    }
  }
}
