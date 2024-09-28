import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movieeapp/Core/simsir%20response/simir%20response.dart';
import 'package:movieeapp/featuters/similr/domain/repositories/similr%20repe.dart';
import 'package:movieeapp/featuters/similr/domain/use_cases/getsmilrusecase.dart';

part 'similr_state.dart';
@injectable
class SimilrCubit extends Cubit<SimilrState> {
  @factoryMethod
  SimilrCubit(this.Getsimilrusecase) : super(SimilrInitial());
  getsimilrusecase Getsimilrusecase;
  void getSimilarMovies(Movieid) async{
    emit(Similrleodiongstate());
    var result= await Getsimilrusecase.call(Movieid);
    result.fold((SimilarResponse)  => {
emit(Similrsucsussstate(Similrrepo:SimilarResponse))
    }, (error)  {
emit(Similrerrorstate(error: error));
    });
  }
}
