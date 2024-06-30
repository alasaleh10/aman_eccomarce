part of 'all_categorisess_cubit.dart';

sealed class AllCategorisessState {}

final class AllCategorisessInitial extends AllCategorisessState {}

final class AllCategorisessLoading extends AllCategorisessState {}

final class AllCategorisessFailure extends AllCategorisessState {
  final String message;

  AllCategorisessFailure({required this.message});
}

final class AllCategorisessSucsess extends AllCategorisessState {
  final List<CategorieeModel> categorisess;

  AllCategorisessSucsess({required this.categorisess});
}
