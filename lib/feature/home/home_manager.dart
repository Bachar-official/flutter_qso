import 'package:flutter_qso/feature/home/home_state_holder.dart';

class HomeManager {
  final HomeStateHolder holder;

  HomeManager({required this.holder});

  void setPageNumber(int pageNumber) {
    holder.setPageNumber(pageNumber);
  }
}