import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/base_select_cubit.dart';

class BaseSelectActions<T> extends StatelessWidget {
  const BaseSelectActions({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BaseSelectCubit>();

    return Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: cubit.clear,
              child: const Text("Clear"),
            ),
            const Spacer(),
            TextButton(
              onPressed: cubit.selectAll,
              child: const Text("Select All"),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {
              context.router.pop(cubit.state.selectedItems);
            },
            child: const Text("Done"),
          ),
        ),
      ],
    );
  }
}