import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BrowserCategory/Categories.dart';

class Browse extends StatelessWidget {
   Browse({Key? key}) : super(key: key);
  List<String>images=[
    "assets/images/png-clipart-movie-genres-folders-hannah-folder-icon-thumbnail.png",
    "assets/images/png-clipart-movie-genres-folders-hannah-folder-icon-thumbnail.png",
    "assets/images/png-clipart-movie-genres-folders-hannah-folder-icon-thumbnail.png",
    "assets/images/png-clipart-movie-genres-folders-hannah-folder-icon-thumbnail.png",
    "assets/images/png-clipart-movie-genres-folders-hannah-folder-icon-thumbnail.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Browser Category",
          style: Theme.of(context).textTheme.titleMedium,),
          Expanded(
            child: GridView.builder(
              itemCount:images.length ,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Categories();
                },),
          )
        ],
      ),
    );
  }
}
