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

    expect(controller.state, HomeState.loading);
    await controller.start();
    expect(controller.state, HomeState.success);
    expect(controller.apods.isNotEmpty, true);
  });

  test('should be set error state', () async {
    final controller = HomeController(repository);
    when(repository.fetchApods()).thenThrow(Exception('internet error'));

    expect(controller.state, HomeState.loading);
    await controller.start();
    expect(controller.state, HomeState.error);
  });
}
