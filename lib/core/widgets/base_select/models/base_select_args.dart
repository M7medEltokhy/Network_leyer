import 'package:flutter/material.dart';

import 'selectable_item.dart';

class BaseSelectArgs {
  const BaseSelectArgs({
    required this.title,
    required this.items,
    this.isMultiSelect = false,
    this.initialValue,
    this.initialValues,
    this.showSearch = true,
    this.searchHint = 'Search...',
    this.emptyText = 'No results found',
    this.itemBuilder,
  });

  final String title;
  final List<SelectableItem> items;

  final bool isMultiSelect;

  final SelectableItem? initialValue;
  final List<SelectableItem>? initialValues;

  final bool showSearch;
  final String searchHint;
  final String emptyText;

  final Widget Function(BuildContext context, SelectableItem item, bool selected)?
      itemBuilder;
}