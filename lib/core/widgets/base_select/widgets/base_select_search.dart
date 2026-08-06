import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/base_select_cubit.dart';

class BaseSelectSearch<T> extends StatelessWidget {
  const BaseSelectSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BaseSelectCubit>();

    return TextField(
      onChanged: cubit.search,
      decoration: InputDecoration(
        hintText: cubit.args.searchHint,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}