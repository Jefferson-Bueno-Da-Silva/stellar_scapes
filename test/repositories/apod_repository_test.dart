import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stellar_scapes/repositories/apod_repository.dart';

import 'apod_repository_test.mocks.dart';

@GenerateMocks([Dio])
main() {
  MockDio mockDio = MockDio();
  late ApodRepository apodRepository;
  const url =
      'https://api.nasa.gov/planetary/apod?api_key=NSTsqgDnkbXEbiF2CB4OryneJJ5UFQ5zxG6hMB5L&count=10';

  setUp(() {
    apodRepository = ApodRepository(mockDio);
  });

  test('Should be return a mocked apod list', () async {
    when(mockDio.get(url)).thenAnswer((inv) => Future.value(Response(
        statusCode: 200,
        data: jsonDecode(jsonData),
        requestOptions: RequestOptions(path: url))));

    final list = await apodRepository.fetchApods();
    expect(list[0].title, "10 Days of Venus and Jupiter");
  });
}

String jsonData = '''
[
	{
		"copyright": "Soumyadeep Mukherjee",
		"date": "2023-03-04",
		"explanation": "Venus and Jupiter may have caught your attention lately.  The impending close conjunction of the two brightest planets visible in clear evening skies has been hard to miss. With Jupiter at the top, starting on February 21 and ending on March 2, their close approach is chronicled daily, left to right, in these panels from Dhanbad, India. Near the western horizon, the evening sky colors and exposures used for each panel depend on the local conditions near sunset. On February 22, Jupiter and Venus were joined by the young crescent Moon. The celestial pair appeared to be only the width of a full moon apart by March 2. Of course on that date the two planets were physically separated by over 600 million kilometers in their orbits around the Sun. In the coming days Jupiter will slowly settle into the glare at sunset, but Venus will continue to move farther from the Sun in the western sky to excel in its current role as the brilliant evening star.   Jupiter & Venus Conjunction Gallery: Notable Submissions to APOD",
		"hdurl": "https://apod.nasa.gov/apod/image/2303/PSX_20230302_200358.jpg",
		"media_type": "image",
		"service_version": "v1",
		"title": "10 Days of Venus and Jupiter",
		"url": "https://apod.nasa.gov/apod/image/2303/PSX_20230302_200358_1024.jpg"
	}
]
''';
