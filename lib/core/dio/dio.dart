import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl:
          'http://${const String.fromEnvironment('SERVERIO_HOST')}:${const String.fromEnvironment('SERVERIO_PORT')}',
    ),
  ),
);
