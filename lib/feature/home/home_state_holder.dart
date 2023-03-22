import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_state.dart';

class HomeStateHolder extends StateNotifier<HomeState> {
  HomeStateHolder() : super(const HomeState.initial());

  HomeState get homeState => state;

  void setPageNumber(int pageNumber) {
    state = state.copyWith(pageNumber: pageNumber);
  }
}