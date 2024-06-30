part of 'faviort_cubit.dart';

sealed class FaviortState {}

final class FaviortInitial extends FaviortState {}

final class FaviortLoading extends FaviortState {}

final class FaviortFailure extends FaviortState {
  final String message;

  FaviortFailure({required this.message});
}

final class FaviortSucess extends FaviortState {
  final List<FaviortModel> items;

  FaviortSucess({required this.items});
}

final class FaviortMessage extends FaviortState {
  final String message;

  FaviortMessage({required this.message});
}

final class FaviortSucsess2 extends FaviortState {}
