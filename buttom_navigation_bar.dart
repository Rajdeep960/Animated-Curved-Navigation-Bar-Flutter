import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/pages/favourite_page.dart';
import 'package:quiz_app/screens/pages/home_page.dart';
import 'package:quiz_app/screens/pages/profile_page.dart';
import 'package:quiz_app/screens/pages/search_page.dart';
import 'package:quiz_app/screens/pages/settings_page.dart';

class ButtonNavigationBar extends StatefulWidget {
  const ButtonNavigationBar({Key? key}) : super(key: key);

  @override
  _ButtonNavigationBarState createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {

  int index = 2;

  final screens = [
    const HomePage(),
    const SearchPage(),
    const FavouritePage(),
    const SettingPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {

    final items = <Widget>[
      const Icon(Icons.home, size: 30,),
      const Icon(Icons.search, size: 30,),
      const Icon(Icons.favorite, size: 30,),
      const Icon(Icons.drive_file_move, size: 30,),
      const Icon(Icons.person, size: 30,),
    ];


    return Container(
      // this Container, SafeArea and ClipReact for fix ios
      color: Colors.white,
      child: SafeArea(
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            body: screens[index],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: const IconThemeData(color: Colors.blue),
              ),
              child: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                color: Colors.white,
                buttonBackgroundColor: Colors.black12,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                height: 60.0,
                index: index,
                onTap: (index) => setState(() {
                  this.index = index;
                }),
                items: items,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
