import 'package:flutter/material.dart';
import 'package:sgpark_me/screens/favourites_screen.dart';
import 'package:sgpark_me/screens/recents_screen.dart';
import 'package:sgpark_me/screens/suggested_screen.dart';

import 'screens/home_screen.dart';
import 'screens/location_screen.dart';
import 'screens/search_screen.dart';

void main() {
  runApp(const SgParkMe());
}

class SgParkMe extends StatelessWidget {
  const SgParkMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      routes: {
        '/home': (context) => const HomeScreen(),
        '/Favourites': (context) => const FavouritesScreen(),
        '/Suggested': (context) => const SuggestedScreen(),
        '/Recents': (context) => const RecentsScreen(),
        '/search': (context) => const SearchScreen(),
        // '/location': (context) => const LocationScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/location") {
          return PageRouteBuilder(
            pageBuilder: (context, prianimation, secAnimation) =>
                const LocationScreen(),
            transitionsBuilder: (context, prianimation, secanimation, child) {
              Animatable<Offset> tween = Tween(
                  begin: Offset(
                      0,
                      MediaQuery.of(context).padding.top /
                          MediaQuery.of(context).size.height),
                  end: Offset.zero);

              return SlideTransition(
                position: prianimation.drive(tween),
                child: const LocationScreen(),
              );
            },
            transitionDuration: const Duration(
              milliseconds: 100,
            ),
            reverseTransitionDuration: const Duration(
              milliseconds: 10,
            ),
          );
        }
      },
    );
  }
}
