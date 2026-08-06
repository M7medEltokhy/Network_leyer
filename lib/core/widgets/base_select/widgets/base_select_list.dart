import 'package:flutter/material.dart';

import '../models/selectable_item.dart';
import 'base_select_item.dart';

class BaseSelectList extends StatelessWidget {
  const BaseSelectList({super.key, required this.items});

  final List<SelectableItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text("No Results"));
    }

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, index) => BaseSelectItem(item: items[index]),
    );
  }
}