import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/base_select_args.dart';
import '../models/selectable_item.dart';
import 'base_select_state.dart';

class BaseSelectCubit extends Cubit<BaseSelectState> {
  BaseSelectCubit(this.args)
      : super(
          BaseSelectState(
            allItems: args.items,
            filteredItems: args.items,
            selectedItems: [...?args.initialValues],
            selectedItem: args.initialValue,
          ),
        );

  final BaseSelectArgs args;

  void search(String value) {
    final query = value.trim().toLowerCase();

    final filtered = query.isEmpty
        ? state.allItems
        : state.allItems
            .where((e) => e.label.toLowerCase().contains(query))
            .toList();

    emit(state.copyWith(query: query, filteredItems: filtered));
  }

  void onItemTap(SelectableItem item) {
    if (args.isMultiSelect) {
      final selected = [...state.selectedItems];

      if (selected.contains(item)) {
        selected.remove(item);
      } else {
        selected.add(item);
      }

      emit(state.copyWith(selectedItems: selected));
      return;
    }

    emit(state.copyWith(selectedItem: item));
  }

  void clear() {
    emit(state.copyWith(selectedItems: [], clearSelectedItem: true));
  }

  void selectAll() {
    emit(state.copyWith(selectedItems: [...state.allItems]));
  }
}