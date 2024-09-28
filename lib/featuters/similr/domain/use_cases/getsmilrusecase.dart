import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movieeapp/featuters/similr/domain/repositories/similr%20repe.dart';

import '../../../../Core/simsir response/simir response.dart';
@injectable
class getsimilrusecase{
  similrrepo repo;
  getsimilrusecase({required this.repo});
  Future<Either<SimilarResponse, String>> call(Movieid)=>repo.getsimilrrepo(Movieid);
}
