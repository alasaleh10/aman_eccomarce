import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_bording_state.dart';

class OnBordingCubit extends Cubit<OnBordingState> {
  OnBordingCubit() : super(OnBordingInitial());
  int index = 0;
  PageController pageController = PageController();

  void changePage() {
    index++;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 900), curve: Curves.bounceOut);

    emit(OnBordingInitial());
  }

  void onchangePage(int index) {
    this.index = index;
    emit(OnBordingInitial());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
