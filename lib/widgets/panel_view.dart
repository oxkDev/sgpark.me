import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sgpark_me/const.dart';
import 'package:sgpark_me/widgets/card_pri.dart';

class PanelView extends StatelessWidget {
  final bool hasData;

  const PanelView({
    required this.hasData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardPrimary(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.6,
          child: !hasData
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: MediaQuery.of(context).size.width * 0.01,
                    color: MainColours.loading,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(
                      MediaQuery.of(context).size.width * 0.035)),
                  child: GoogleMap(
                    myLocationEnabled: true,
                    scrollGesturesEnabled: false,
                    initialCameraPosition:
                        initialPosition(parkingInfo.location),
                  ),
                ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.035,
          child: Text(
            "Rates",
            style: TextStyle(
              color: MainColours.darkText,
              fontSize: MediaQuery.of(context).size.height * 0.035,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        CardPrimary(
          // height: MediaQuery.of(context).size.height * 0.1,
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.017),
          child: !hasData
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: MediaQuery.of(context).size.width * 0.01,
                    color: MainColours.loading,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: parkingInfo.rates!.entries.map<Widget>((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          entry.key,
                          style: TextStyle(
                            color: MainColours.darkText,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.04),
                          height: MediaQuery.of(context).size.height * 0.026,
                          child: Text(
                            entry.value,
                            style: TextStyle(
                              color: MainColours.darkGrey,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.026,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
        ),
      ],
    );
  }
}
