import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sgpark_me/const.dart';
import 'package:sgpark_me/widgets/panel_view.dart';
import 'package:sgpark_me/widgets/sub_location_card.dart';
import 'package:sgpark_me/widgets/card_pri.dart';
import 'package:sgpark_me/widgets/main_function_card.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final PanelController controller = PanelController();

class _HomeScreenState extends State<HomeScreen> {
  void openSlider() {
    panelController.animatePanelToPosition(
      0.7,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCirc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: parkingStream,
      builder: (context, snapshot) {
        return Stack(
          children: <Widget>[
            Scaffold(
              backgroundColor: MainColours.orange,
              body: CustomScrollView(
                physics:
                    const PageScrollPhysics(parent: ClampingScrollPhysics()),
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: false,
                    backgroundColor: MainColours.orange,
                    elevation: 0,
                    collapsedHeight: MediaQuery.of(context).padding.top +
                        MediaQuery.of(context).size.height * 0.05 +
                        10,
                    expandedHeight: MediaQuery.of(context).padding.top +
                        MediaQuery.of(context).size.height * 0.2,
                    toolbarHeight: MediaQuery.of(context).padding.top,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(
                            MediaQuery.of(context).size.width * 0.07),
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.none,
                      centerTitle: true,
                      background: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "SgPark",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MainColours.white,
                              fontSize:
                                  20 + MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            ".",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MainColours.black,
                              fontSize:
                                  20 + MediaQuery.of(context).size.width * 0.07,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "at",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: MainColours.black,
                              fontSize:
                                  20 + MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CardPrimary(
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.8),
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      backgroundColour: MainColours.white,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                              MediaQuery.of(context).size.width * 0.07)),
                      child: Column(
                        children: [
                          MainFunction(
                            "Favourites",
                            theme: MainColours.orange,
                            icon: CupertinoIcons.star_fill,
                            widgets: <Widget>[
                              SubLocation(
                                "yewcher again",
                                price: "\$1/hr",
                                lots: 200,
                                maxLots: 1000,
                                sheltered: true,
                                onPressed: () {
                                  parkingInfo.retrieveData();
                                  parkingInfo.selectResult(0);
                                  openSlider();
                                },
                              ),
                            ],
                          ),
                          MainFunction(
                            "Suggested",
                            theme: MainColours.grey,
                            icon: CupertinoIcons.checkmark_alt_circle_fill,
                            widgets: <Widget>[
                              SubLocation(
                                "another yewcher",
                                price: "\$0.50/entry",
                                lots: 10,
                                maxLots: 10,
                                sheltered: true,
                                onPressed: () {
                                  parkingInfo.retrieveData();
                                  parkingInfo.selectResult(0);
                                  openSlider();
                                },
                              ),
                            ],
                          ),
                          MainFunction(
                            "Recents",
                            theme: MainColours.red,
                            icon: CupertinoIcons.clock_fill,
                            widgets: <Widget>[
                              SubLocation(
                                "yewcher",
                                price: "\$1/hr",
                                lots: 10,
                                maxLots: 30,
                                sheltered: true,
                                onPressed: () {
                                  parkingInfo.retrieveData();
                                  parkingInfo.selectResult(0);
                                  openSlider();
                                },
                              ),
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02),
                width: 10 + MediaQuery.of(context).size.width * 0.2,
                height: 10 + MediaQuery.of(context).size.width * 0.2,
                constraints: const BoxConstraints(
                  maxHeight: 100,
                  maxWidth: 100,
                  minHeight: 40,
                  minWidth: 40,
                ),
                child: FloatingActionButton(
                  focusColor: SubColours.splash,
                  hoverColor: SubColours.splash,
                  elevation: 50,
                  hoverElevation: 100,
                  focusElevation: 100,
                  highlightElevation: 100,
                  backgroundColor: MainColours.orange,
                  splashColor: SubColours.splash,
                  child: Icon(
                    CupertinoIcons.search,
                    size: 15 + MediaQuery.of(context).size.width * 0.1,
                  ),
                  onPressed: () => Navigator.pushNamed(context, "/search"),
                ),
              ),
            ),
            SlidingUpPanel(
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
                return Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.03,
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
                );
              },
              onPanelOpened: () {
                if (panelController.isPanelOpen) {
                  Navigator.pushNamed(
                    context,
                    "/location",
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
