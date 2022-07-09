import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sample_dio_service.g.dart';

class SampleDioService {
  final dio = Dio();

  Stream<List<String>> getItems() async* {
    yield await get<List<String>>(
      'https://62c833610f32635590d3e18c.mockapi.io/test',
      onResponse: (Response<dynamic> data) {
        final l = data.data as Iterable;
        return l
            .map((e) => StringData.fromJson(e))
            .map((e) => e.string)
            .toList();
      },
    );
  }

  Future<T> get<T>(String url,
      {required T Function(Response<dynamic> data) onResponse}) async {
    try {
      final response = await dio.get(url);

      return onResponse(response);
    } on DioError catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

@JsonSerializable()
class StringData {
  final String string;

  const StringData(this.string);

  factory StringData.fromJson(Map<String, dynamic> json) =>
      _$StringDataFromJson(json);

  Map<String, dynamic> toJson() => _$StringDataToJson(this);
}

class UltorexError extends Error {}
