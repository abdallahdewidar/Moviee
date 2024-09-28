import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movieeapp/featuters/similr/data/data_sources/similrdao.dart';
import 'package:movieeapp/featuters/similr/domain/repositories/similr%20repe.dart';

import '../../../../Core/simsir response/simir response.dart';
@injectable

class simirlRepoimp extends similrrepo{
  SimilrDau apidua;
  @factoryMethod
  simirlRepoimp(this.apidua);
  @override
  Future<Either<SimilarResponse, String>> getsimilrrepo(Movieid)async {
    bool isconnected= await InternetConnection().hasInternetAccess;
    if(isconnected){
      var Result=  await apidua.getsimilrDua(Movieid);
      return Result.fold((SimilarResponse) {
        return left(SimilarResponse);
      } , (error) {
        return right(error);
      } );
     }else{
      return right("No Internet Connection");
 
    }

    }
  }

