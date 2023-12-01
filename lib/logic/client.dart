import 'dart:io';

import 'package:deep_pick/deep_pick.dart';
import 'package:dio/dio.dart';
import 'package:repull/models/release.dart';

class Client {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.github.com',
      headers: {
        HttpHeaders.userAgentHeader: 'repull/0.0.1 (clragon)',
      },
    ),
  );

  Future<SourceRelease> getLatestAssets(String repo) async {
    try {
      dynamic response = await dio.get('/repos/$repo/releases/latest');
      return SourceRelease.fromJson(response.data);
    } on DioException catch (e) {
      throw ClientException.fromDio(e);
    } on PickException catch (e) {
      throw ClientException(e.message);
    }
  }

  Future<String> downloadAsset(String url, String path) async {
    try {
      await dio.download(url, path);
      return path;
    } on DioException catch (e) {
      throw ClientException.fromDio(e);
    }
  }
}

class ClientException implements Exception {
  ClientException(this.message);

  factory ClientException.fromDio(DioException e) {
    return ClientException(
      e.message ??
          'A http error occured'
              '${e.response?.statusCode != null ? ' (${e.response!.statusCode})' : ''}',
    );
  }

  final String message;

  @override
  String toString() => 'ClientException: $message';
}
