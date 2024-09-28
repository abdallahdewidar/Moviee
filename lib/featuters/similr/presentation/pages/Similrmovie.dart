import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieeapp/Core/simsir%20response/Result.dart';
// Import your Bloc
import '../../../../Core/simsir response/simir response.dart';
import '../../../../Core/simsir response/simir response.dart';
import '../../domain/use_cases/getsmilrusecase.dart';
import '../manager/similr_cubit.dart';
import '../manager/similr_cubit.dart';


class SimilarMoviesPage extends StatelessWidget {
  final int movieId; // The ID of the movie for which you want similar movies

  const SimilarMoviesPage({required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Similar Movies')),
      body: BlocProvider(
        create: (context) => SimilrCubit(context.read<getsimilrusecase>())..getSimilarMovies(movieId),
        child: BlocBuilder<SimilrCubit, SimilrState>(
          builder: (context, state) {
            if (state is Similrleodiongstate) {
              return Center(child: CircularProgressIndicator());
            } else if (state is Similrsucsussstate) {
              final similarMovies = Similrsucsussstate(Similrrepo: SimilarResponse()); // Assuming similarResponse contains a list of movies
                return ListView.builder(
                  itemCount: similarMovies.length,
                  itemBuilder: (context, index) {
                    final movie = similarMovies[index];
                    return ListTile(
                      title: Text(movie.title),
                      onTap: () {
                        // Navigate to the movie details page with the movie ID
                      },
                    );
                  },
                );
            } else if (state is Similrerrorstate) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return Center(child: Text('No similar movies found.'));
            }
          },
        ),
      ),
    );
  }
}
