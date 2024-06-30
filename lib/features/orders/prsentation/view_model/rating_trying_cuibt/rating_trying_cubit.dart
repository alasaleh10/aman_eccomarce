import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_trying_state.dart';

class RatingTryingCubit extends Cubit<RatingTryingState> {
  RatingTryingCubit() : super(RatingTryingInitial());
  bool animat = true;
  int index = 2;
  int index2 = 0;

  List<IconData> icons = [
    Icons.sentiment_very_dissatisfied_outlined,
    Icons.sentiment_very_dissatisfied,
    Icons.sentiment_satisfied_alt,
    Icons.mood,
  ];
  void chnageRatingFeadback({required int index2}) {
    this.index2 = index2;
    emit(RatingTryingInitial());
  }

  void changeRate({required int index}) {
    this.index = index;
    changeAnimat();

    emit(RatingTryingInitial());
  }

  changeAnimat() {
    animat = false;
    emit(RatingTryingInitial());

    Future.delayed(const Duration(milliseconds: 1000), () {
      animat = true;
      emit(RatingTryingInitial());
    });
  }
}
