import 'package:equatable/equatable.dart';

import '../models/selectable_item.dart';

class BaseSelectState extends Equatable {
  const BaseSelectState({
    required this.allItems,
    required this.filteredItems,
    required this.selectedItems,
    this.selectedItem,
    this.query = '',
  });

  final List<SelectableItem> allItems;
  final List<SelectableItem> filteredItems;

  final List<SelectableItem> selectedItems;
  final SelectableItem? selectedItem;

  final String query;

  BaseSelectState copyWith({
    List<SelectableItem>? allItems,
    List<SelectableItem>? filteredItems,
    List<SelectableItem>? selectedItems,
    SelectableItem? selectedItem,
    bool clearSelectedItem = false,
    String? query,
  }) {
    return BaseSelectState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      selectedItems: selectedItems ?? this.selectedItems,
      selectedItem: clearSelectedItem ? null : selectedItem ?? this.selectedItem,
      query: query ?? this.query,
    );
  }

  @override
  List<Object?> get props => [allItems, filteredItems, selectedItems, selectedItem, query];
}