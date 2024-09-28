import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movieeapp/Core/ApiManager.dart';
import 'package:movieeapp/Core/simsir%20response/simir%20response.dart';

import '../similrdao.dart';
@Injectable(as: SimilrDau)
class Dauapiimp extends SimilrDau{
  @override
  Future<Either<SimilarResponse, String>> getsimilrDua(MovieId)async {

 try{
var response= await ApiManager.similrmovies(MovieId);
return left(response);
 }catch(erorr){
return right(erorr.toString());
 }

}
}