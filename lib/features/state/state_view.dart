import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverio_rb_flutter/features/state/state.dart' as st;
import 'package:serverio_rb_flutter/features/state/state_repository.dart';

class StateView extends ConsumerWidget {
  const StateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateRepository = ref.read(stateRepositoryProvider);

    return FutureBuilder<st.State>(
      future: stateRepository.getState(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final state = snapshot.data!;

          return ListView.builder(
            itemCount: 5,
            itemBuilder: (_, index) {
              var title = '';
              var subtitle = '';

              switch (index) {
                case 0:
                  title = 'OS';
                  subtitle = state.os;
                  break;
                case 1:
                  title = 'Arch';
                  subtitle = state.arch;
                  break;
                case 2:
                  title = 'Host';
                  subtitle = state.host;
                  break;
                case 3:
                  title = 'Kernel';
                  subtitle = state.kernel;
                  break;
                default:
                  title = 'Uptime';
                  subtitle = state.uptime;
                  break;
              }

              return ListTile(
                title: Text(title),
                subtitle: Text(subtitle),
              );
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
