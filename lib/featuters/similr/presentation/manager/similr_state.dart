part of 'similr_cubit.dart';

@immutable
sealed class SimilrState {}

final class SimilrInitial extends SimilrState {}
final class Similrleodiongstate extends SimilrState {}
final class Similrsucsussstate extends SimilrState {
SimilarResponse Similrrepo;
Similrsucsussstate({required this.Similrrepo });
}
class Similrerrorstate extends SimilrState {
  String error;
  Similrerrorstate({required this.error });
}
