import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sgpark_me/const.dart';
import 'package:sgpark_me/widgets/panel_view.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColours.white,
      appBar: AppBar(
        leading: IconButton(
          splashColor: SubColours.splash,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: MediaQuery.of(context).size.width * 0.07,
          ),
          onPressed: () {
            Navigator.pop(context);
            panelController.close();
          },
          color: MainColours.darkGrey,
        ),
        leadingWidth: MediaQuery.of(context).size.height * 0.05,
        toolbarHeight: MediaQuery.of(context).size.height * 0.05,
        centerTitle: true,
        backgroundColor: MainColours.white,
        shadowColor: Colors.transparent,
        title: Text(
          parkingInfo.name,
          style: TextStyle(
            color: MainColours.darkText,
            fontSize: MediaQuery.of(context).size.height * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
        ),
        child: PanelView(hasData: true),
      ),
    );
  }
}
