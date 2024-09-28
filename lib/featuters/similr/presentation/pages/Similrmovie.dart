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
              final similarMovies = state.Similrsucsussstate.; // Assuming similarResponse contains a list of movies
              return SimilarResponse(similarMovies:Result() );
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
