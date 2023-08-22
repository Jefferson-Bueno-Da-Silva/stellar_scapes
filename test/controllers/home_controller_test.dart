import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stellar_scapes/controllers/home_controller.dart';
import 'package:stellar_scapes/models/apod_model.dart';
import 'package:stellar_scapes/repositories/apod_repository.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([ApodRepository])
main() {
  final repository = MockApodRepository();

  test('should be set apod list', () async {
    final controller = HomeController(repository);
    when(repository.fetchApods()).thenAnswer((_) async => [
          ApodModel(
              title: 'test apod',
              explanation: 'test apod explanation',
              hdurl: 'http://example.com.br')
        ]);

    expect(controller.state.value, HomeState.loading);
    await controller.start();
    expect(controller.state.value, HomeState.success);
    expect(controller.apods.isNotEmpty, true);
  });

  test('should be set error state', () async {
    final controller = HomeController(repository);
    when(repository.fetchApods()).thenThrow(Exception('internet error'));

    expect(controller.state.value, HomeState.loading);
    await controller.start();
    expect(controller.state.value, HomeState.error);
  });

  test('should append more 1 item to apods', () async {
    final controller = HomeController(repository);
    when(repository.fetchApods()).thenAnswer((_) async => [
          ApodModel(
              title: 'test apod',
              explanation: 'test apod explanation',
              hdurl: 'http://example.com.br')
        ]);

    await controller.start();
    expect(controller.apods.length, 1);
    await controller.pagination();
    expect(controller.apods.length, 2);
  });
}
