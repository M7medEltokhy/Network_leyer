import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/base_select_cubit.dart';
import 'cubit/base_select_state.dart';
import 'widgets/base_select_actions.dart';
import 'widgets/base_select_header.dart';
import 'widgets/base_select_list.dart';
import 'widgets/base_select_search.dart';

class BaseSelect<T> extends StatelessWidget {
  const BaseSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BaseSelectCubit>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.of(context).size.height * .85,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const BaseSelectHeader(),

                  if (cubit.args.showSearch) ...[
                    const SizedBox(height: 16),
                    const BaseSelectSearch(),
                  ],

                  const SizedBox(height: 16),

                  Expanded(
                    child: BlocBuilder<
                        BaseSelectCubit,
                        BaseSelectState>(
                      buildWhen: (previous, current) =>
                          previous.filteredItems != current.filteredItems,
                      builder: (_, state) {
                        return BaseSelectList(
                          items: state.filteredItems,
                        );
                      },
                    ),
                  ),

                  if (cubit.args.isMultiSelect) ...[
                    const Divider(),
                    const SizedBox(height: 8),
                    BaseSelectActions<T>(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}