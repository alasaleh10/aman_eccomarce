part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSucsess2 extends HomeState {}

final class HomeFailure extends HomeState {
  final String message;

  HomeFailure({required this.message});
}

final class HomeFailure2 extends HomeState {
  final String message;

  HomeFailure2({required this.message});
}

final class HomeSucsess extends HomeState {
  final List<BannerModel> banners;
  final List<ItemsModel> items;
  final List<ItemsModel> monthStock;
  final List<CategorieeModel> categorisess;

  HomeSucsess(
      {required this.banners,
      required this.items,
      required this.monthStock,
      required this.categorisess});

  // HomeSucsess({required this.banners, required this.items});
}
