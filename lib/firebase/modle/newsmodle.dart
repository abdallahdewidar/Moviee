import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title;
  final String overview;
  final String imageUrl;

  Movie({
    required this.title,
    required this.overview,
    required this.imageUrl,
  });

  // Convert Movie object to JSON (for Firestore)
  Map<String, dynamic> toJson() => {
    'title': title,
    'overview': overview,
    'imageUrl': imageUrl,
  };

  // Create Movie object from Firestore document
  static Movie fromJson(Map<String, dynamic> json) => Movie(
    title: json['title'],
    overview: json['overview'],
    imageUrl: json['imageUrl'],
  );
   static final CollectionReference<Movie> moviesRef =
  FirebaseFirestore.instance.collection('watchlist').withConverter<Movie>(
    fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
    toFirestore: (movie, _) => movie.toJson(),
  );

}

