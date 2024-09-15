import 'package:flutter/material.dart';
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
    search(),
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
            items: const [
              BottomNavigationBarItem(
                  backgroundColor:Color(0xff514F4F) ,
                  icon: ImageIcon(
                    AssetImage("assets/images/Home.svg"),
                  ),
                  label: "Home"
              ),
              BottomNavigationBarItem(
                  backgroundColor:Color(0xff514F4F)  ,
                  icon: ImageIcon(
                    AssetImage("assets/images/SEARCH.svg"),
                  ),
                  label: "Search"
              ),
              BottomNavigationBarItem(
                  backgroundColor:Color(0xff514F4F)  ,
                  icon: ImageIcon(
                    AssetImage("assets/images/Browse.svg"),
                  ),
                  label: "Browse"
              ),
              BottomNavigationBarItem(
                  backgroundColor:Color(0xff514F4F)  ,
                  icon: ImageIcon(
                    AssetImage("assets/images/Watchlist.svg"),
                  ),
                  label: "Watchlist"
              ),

            ]
        ),
        body: Screen[selectedIndex],
      ),
    );
  }
}
