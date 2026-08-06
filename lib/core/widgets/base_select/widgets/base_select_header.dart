import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/base_select_cubit.dart';

class BaseSelectHeader<T> extends StatelessWidget {
  const BaseSelectHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BaseSelectCubit>();

    return Text(
      cubit.args.title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}