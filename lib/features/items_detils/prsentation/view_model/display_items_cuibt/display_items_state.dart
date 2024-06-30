part of 'display_items_cubit.dart';

sealed class DisplayItemsState {}

final class DisplayItemsInitial extends DisplayItemsState {}

final class DisplayItemsLoading extends DisplayItemsState {}

final class DisplayItemsFailure extends DisplayItemsState {
  final String message;

  DisplayItemsFailure({required this.message});
}

final class DisplayItemsSucsess extends DisplayItemsState {
  final List<ItemsModel> items;

  DisplayItemsSucsess({required this.items});
}
