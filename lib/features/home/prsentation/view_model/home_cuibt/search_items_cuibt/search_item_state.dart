part of 'search_item_cubit.dart';

sealed class SearchItemState {}

final class SearchItemInitial extends SearchItemState {}

final class SearchItemILoading extends SearchItemState {}

final class SearchItemFailure extends SearchItemState {
  final String message;

  SearchItemFailure({required this.message});
}

final class SearchItemSucsess extends SearchItemState {
  final List<ItemsModel> items;

  SearchItemSucsess({required this.items});
}
