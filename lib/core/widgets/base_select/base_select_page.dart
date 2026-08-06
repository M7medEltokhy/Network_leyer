import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_select.dart';
import 'cubit/base_select_cubit.dart';
import 'models/base_select_args.dart';

@RoutePage()
class BaseSelectPage extends StatelessWidget {
  const BaseSelectPage({super.key, required this.args});

  final BaseSelectArgs args;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BaseSelectCubit(args),
      child: const BaseSelect(),
    );
  }
}