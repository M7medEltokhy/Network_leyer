import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/base_select_cubit.dart';
import '../cubit/base_select_state.dart';
import '../models/selectable_item.dart';

class BaseSelectItem extends StatelessWidget {
  const BaseSelectItem({super.key, required this.item});

  final SelectableItem item;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BaseSelectCubit>();

    return BlocSelector<BaseSelectCubit, BaseSelectState, bool>(
      selector: (state) {
        if (state.selectedItem == item) return true;
        return state.selectedItems.contains(item);
      },
      builder: (_, selected) {
        return ListTile(
          title: cubit.args.itemBuilder?.call(context, item, selected) ??
              Text(item.label),
          trailing: cubit.args.isMultiSelect
              ? Checkbox(
                  value: selected,
                  onChanged: (_) => cubit.onItemTap(item),
                )
              : selected
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : null,
          onTap: () {
            cubit.onItemTap(item);
            if (!cubit.args.isMultiSelect) {
              context.router.pop([item]);
            }
          },
        );
      },
    );
  }
}