import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image(
            image: AssetImage("assets/images/png-clipart-movie-genres-folders-hannah-folder-icon-thumbnail.png"),fit: BoxFit.fill,
          ),
        ),
        Center(child: Text("Action",style: Theme.of(context).textTheme.titleMedium?..copyWith(fontSize: 14),))
      ],
       
    );
  }
}
