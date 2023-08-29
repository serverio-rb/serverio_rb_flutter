import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverio_rb_flutter/core/dio/dio.dart';
import 'package:serverio_rb_flutter/features/state/state.dart';

final stateRepositoryProvider = Provider<StateRepository>(
  (ref) => StateRepositoryImpl(
    ref.read(dioProvider),
  ),
);

abstract class StateRepository {
  Future<State> getState();
}

class StateRepositoryImpl extends StateRepository {
  final Dio dio;

  StateRepositoryImpl(this.dio);

  @override
  Future<State> getState() async {
    final res = await dio.get('/v1/state');
    if (res.statusCode == HttpStatus.ok) {
      final rawState = res.data as Map<String, dynamic>;

      return State(
        os: rawState['os'],
        arch: rawState['arch'],
        host: rawState['arch'],
        kernel: rawState['kernel'],
        uptime: rawState['uptime'],
      );
    }

    // TODO: handle
    throw Exception('');
  }
}
