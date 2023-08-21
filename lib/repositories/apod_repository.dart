import 'package:dio/dio.dart';
import 'package:stellar_scapes/models/apod_model.dart';

class ApodRepository {
  late Dio dio;
  final url =
      'https://api.nasa.gov/planetary/apod?api_key=NSTsqgDnkbXEbiF2CB4OryneJJ5UFQ5zxG6hMB5L&count=10';

  ApodRepository([Dio? client]) {
    dio = client ?? Dio();
  }

  Future<List<ApodModel>> fetchApods() async {
    final response = await dio.get(url);
    final list = response.data as List;
    return list.map((json) => ApodModel.fromJson(json)).toList();
  }
}
