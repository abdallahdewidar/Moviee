import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieeapp/screens/tabs%20screen/Browse.dart';
import 'package:movieeapp/screens/tabs%20screen/Home.dart';
import 'package:movieeapp/screens/tabs%20screen/search.dart';

import '../tabs screen/wishlist.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "Home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> Screen = [
    Home(),
    Search(),
    Browse(),
    Watchlist(),

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary
      ),
      child: Scaffold(

        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index){
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor:Color(0xff514F4F) ,
                  icon: SvgPicture.asset("assets/images/Home icon.svg") ,

                  label: "Home"
              ),
              BottomNavigationBarItem(
                  backgroundColor:Color(0xff514F4F)  ,
                  icon: SvgPicture.asset("assets/images/search-2 (1).svg"),

                  label: "Search"
              ),
              BottomNavigationBarItem(
                  backgroundColor:Color(0xff514F4F)  ,
                  icon: SvgPicture.asset
                   ("assets/images/Icon material-movie.svg"),
                  label: "Browse"
              ),
              BottomNavigationBarItem(
                  backgroundColor:Color(0xff514F4F)  ,
                  icon: SvgPicture.asset("assets/images/Icon ionic-md-bookmarks.svg"),
                  label: "Watchlist"
              ),

            ]
        ),
        body: Screen[selectedIndex],
      ),
    );
  }
}
