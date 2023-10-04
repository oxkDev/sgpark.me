import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sgpark_me/const.dart';

import 'card_sec.dart';

class SubLocation extends StatelessWidget {
  final String price;
  final String title;
  final int lots;
  final int maxLots;
  final bool sheltered;
  final Function onPressed;

  SubLocation(
    this.title, {
    required this.price,
    required this.lots,
    required this.maxLots,
    required this.sheltered,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double unit = MediaQuery.of(context).size.width * 0.1 + 20;

    return CardSecondary(
      height: unit,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width * 0.025),
              ),
            ),
          ),
        ),
        onPressed: () => onPressed(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.005,
                  horizontal: MediaQuery.of(context).size.width * 0.02,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: MainColours.darkGrey,
                        fontSize: unit * 0.3,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          price,
                          style: TextStyle(
                            color: MainColours.darkGrey,
                            fontSize: unit * 0.3,
                          ),
                        ),
                        Text(
                          sheltered ? "Indoor" : "Outdoor",
                          style: TextStyle(
                            color: sheltered
                                ? SubColours.darkGreen
                                : SubColours.red,
                            fontSize: unit * 0.3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: unit,
              width: unit,
              decoration: BoxDecoration(
                color: lots / maxLots < 1 / 3
                    ? SubColours.red
                    : lots / maxLots < 2 / 3
                        ? SubColours.yellow
                        : SubColours.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width * 0.025),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 4,
                    fit: FlexFit.loose,
                    child: Text(
                      lots.toString(),
                      style: TextStyle(
                        color: MainColours.white,
                        fontSize: unit * 0.40,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.loose,
                    child: Text(
                      "lots",
                      style: TextStyle(
                        color: MainColours.white,
                        fontSize: unit * 0.25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
