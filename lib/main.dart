import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverio_rb_flutter/features/state/state_view.dart';

void main() => runApp(
      const ProviderScope(
        child: ServerioRbApp(),
      ),
    );

class ServerioRbApp extends StatelessWidget {
  const ServerioRbApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: StateView(),
      ),
    );
  }
}
