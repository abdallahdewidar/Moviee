import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../firebase/modle/newsmodle.dart'; // Assuming this is where your Movie model is located.

class Watchlist extends StatelessWidget {
  Watchlist({Key? key}) : super(key: key);
  final FirebaseFirestore moviesRef = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Watch List")
      ,backgroundColor: Color(0xff514F4F) ,),
      body: StreamBuilder<List<Movie>>(
        stream: getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No movies in watchlist"));
          }
          final movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.overview),
                leading: Image.network(movie.imageUrl),
              );
            },
          );
        },
      ),
    );
  }

  Stream<List<Movie>> getMovies() {
    return moviesRef.collection('movies').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Movie.fromJson(doc.data() as Map<String, dynamic>)).toList()
    );
  }
}
