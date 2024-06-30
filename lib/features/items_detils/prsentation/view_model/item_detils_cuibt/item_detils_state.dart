part of 'item_detils_cubit.dart';

sealed class ItemDetilsState {}

final class ItemDetilsInitial extends ItemDetilsState {}

final class ItemDetilsLoading extends ItemDetilsState {}

final class ItemDetilsFailure extends ItemDetilsState {
  final String message;

  ItemDetilsFailure({required this.message});
}
final class ItemDetilsFailure2 extends ItemDetilsState {
  final String message;

  ItemDetilsFailure2({required this.message});
}
final class ItemDetilsSucsess2 extends ItemDetilsState {}

final class ItemDetilsSucsess extends ItemDetilsState {
  final ItemsModel itemsModel;

  ItemDetilsSucsess({required this.itemsModel});
}
