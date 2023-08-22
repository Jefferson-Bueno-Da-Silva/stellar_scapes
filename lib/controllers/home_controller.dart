import 'package:flutter/cupertino.dart';
import 'package:stellar_scapes/repositories/apod_repository.dart';

import '../models/apod_model.dart';

class HomeController {
  List<ApodModel> apods = [];
  final ApodRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.loading);

  HomeController([ApodRepository? repository])
      : _repository = repository ?? ApodRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      apods = await _repository.fetchApods();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

  Future pagination() async {
    try {
      final appendApods = await _repository.fetchApods();
      apods.addAll(appendApods);
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { loading, success, error }
