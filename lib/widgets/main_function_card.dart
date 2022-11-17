import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import 'card_pri.dart';

class MainFunction extends StatelessWidget {
  final Color theme;
  final IconData icon;
  final String title;
  final List<Widget> widgets;

  const MainFunction(
    this.title, {
    required this.theme,
    required this.icon,
    required this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return CardPrimary(
      // height: MediaQuery.of(context).size.width * 0.23,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            height: MediaQuery.of(context).size.width * 0.1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.015,
                        right: MediaQuery.of(context).size.width * 0.01,
                        top: MediaQuery.of(context).size.width * 0.015,
                        bottom: MediaQuery.of(context).size.width * 0.015,
                      ),
                      child: Icon(
                        icon,
                        color: theme,
                        size: 7 + MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.005,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: theme,
                          fontSize:
                              7 + MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.17 + 10,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: theme,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width * 0.035),
                      bottomLeft: Radius.circular(
                          MediaQuery.of(context).size.width * 0.035),
                    ),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      splashFactory: InkSplash.splashFactory,
                      overlayColor:
                          MaterialStateProperty.all(SubColours.splash),
                      alignment: Alignment.center,
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                                MediaQuery.of(context).size.width * 0.035),
                            bottomLeft: Radius.circular(
                                MediaQuery.of(context).size.width * 0.035),
                          ),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 7,
                          fit: FlexFit.tight,
                          child: Text(
                            "more",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize:
                                  2 + MediaQuery.of(context).size.width * 0.04,
                              color: MainColours.white,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Icon(
                            CupertinoIcons.chevron_forward,
                            color: MainColours.white,
                            size: MediaQuery.of(context).size.width * 0.05,
                          ),
                        )
                      ],
                    ),
                    onPressed: () => Navigator.pushNamed(context, "/" + title),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: widgets,
          )
        ],
      ),
    );
  }
}
