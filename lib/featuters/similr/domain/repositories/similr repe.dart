import 'package:dartz/dartz.dart';

import '../../../../Core/simsir response/simir response.dart';

abstract class similrrepo{
  Future<Either<SimilarResponse, String>> getsimilrrepo(Movieid);
}