import 'package:dartz/dartz.dart';
import 'package:movieeapp/featuters/similr/domain/repositories/similr%20repe.dart';

import '../../../../Core/CategoryList/Results.dart';
import '../../../../Core/simsir response/simir response.dart';

abstract class SimilrDau{
 Future<Either<SimilarResponse, String>>getsimilrDua(MovieId);

}