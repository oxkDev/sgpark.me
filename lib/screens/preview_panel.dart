import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sgpark_me/const.dart';
import 'package:sgpark_me/widgets/panel_view.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class PreviewPanel extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final PanelController panelController;

  const PreviewPanel({Key? key, required this.snapshot, required this.panelController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
              isDraggable: true,
              controller: panelController,
              backdropEnabled: true,
              minHeight: 0,
              snapPoint: 0.7,
              maxHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              boxShadow: [boxShadow(MainColours.shadow)],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(MediaQuery.of(context).size.width * 0.07),
              ),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              // panelBuilder: ,
              panelBuilder: (_) {
                return Scaffold(
                  body: Column(children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.03,
                      child: TextButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          overlayColor:
                              MaterialStateProperty.all(SubColours.splash),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                        onPressed: () => panelController.close(),
                        onLongPress: () => panelController.open(),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height:
                              7 + MediaQuery.of(context).size.height * 0.003,
                          decoration: const BoxDecoration(
                            color: MainColours.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    !snapshot.hasData
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: LinearProgressIndicator(
                              minHeight:
                                  MediaQuery.of(context).size.height * 0.04,
                              color: MainColours.lightGrey,
                              backgroundColor: MainColours.loading,
                            ),
                          )
                        : Text(
                            parkingInfo.name,
                            style: TextStyle(
                              color: MainColours.darkText,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                    PanelView(
                      hasData: snapshot.hasData,
                    ),
                  ],
                ),);
              },
              onPanelOpened: () {
                if (panelController.isPanelOpen) {
                  Navigator.pushNamed(
                    context,
                    "/location",
                  );
                }
              },
            );
  }
}