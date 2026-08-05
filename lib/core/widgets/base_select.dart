import 'package:flutter/material.dart';

typedef ItemLabelBuilder<T> = String Function(T item);

class BaseSelect<T> extends StatefulWidget {
  const BaseSelect({
    super.key,
    required this.title,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.isMultiSelect = false,
    this.initialValue,
    this.initialValues,
    this.showSearch = true,
    this.searchHint = 'Search...',
    this.emptyText = 'No results found',
    this.itemBuilder,
    this.doneText = "Done",
    this.clearText = "Clear",
    this.selectAllText = "Select All",
  });

  final String title;
  final List<T> items;
  final ItemLabelBuilder<T> itemLabel;
  final bool isMultiSelect;
  final bool showSearch;
  final T? initialValue;
  final List<T>? initialValues;
  final String searchHint;
  final String emptyText;
  final ValueChanged<dynamic> onChanged;
  final Widget Function(BuildContext context, T item, bool selected)?
  itemBuilder;
  final String doneText;
  final String clearText;
  final String selectAllText;
  
  static Future<void> show<T>({
    required BuildContext context,
    required String title,
    required List<T> items,
    required ItemLabelBuilder<T> itemLabel,
    required ValueChanged<dynamic> onChanged,
    bool isMultiSelect = false,
    T? initialValue,
    List<T>? initialValues,
    bool showSearch = true,
    String searchHint = 'Search...',
    String emptyText = 'No results found',
    Widget Function(BuildContext context, T item, bool selected)? itemBuilder,
    String doneText = 'Done',
    String clearText = 'Clear',
    String selectAllText = 'Select All',
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: .8,
          maxChildSize: .95,
          minChildSize: .5,
          builder: (_, controller) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: BaseSelect<T>(
                title: title,
                items: items,
                itemLabel: itemLabel,
                onChanged: onChanged,
                isMultiSelect: isMultiSelect,
                initialValue: initialValue,
                initialValues: initialValues,
                showSearch: showSearch,
                searchHint: searchHint,
                emptyText: emptyText,
                itemBuilder: itemBuilder,
                doneText: doneText,
                clearText: clearText,
                selectAllText: selectAllText,
              ),
            );
          },
        );
      },
    );
  }

  @override
  State<BaseSelect<T>> createState() => _BaseSelectState<T>();
}

class _BaseSelectState<T> extends State<BaseSelect<T>> {
  late List<T> _filteredItems;
  final TextEditingController _searchController = TextEditingController();
  T? _selectedItem;
  late List<T> _selectedItems;

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(widget.items);
    _selectedItem = widget.initialValue;
    _selectedItems = [...?widget.initialValues];
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    final query = _searchController.text.trim().toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredItems = List.from(widget.items);
      } else {
        _filteredItems = widget.items.where((item) {
          return widget.itemLabel(item).toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  bool _isSelected(T item) {
    if (widget.isMultiSelect) {
      return _selectedItems.contains(item);
    }
    return _selectedItem == item;
  }

  void _onTap(T item) {
    if (widget.isMultiSelect) {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
      setState(() {});
      return;
    }
    _selectedItem = item;
    widget.onChanged(item);
    Navigator.pop(context);
  }

  void _submit() {
    widget.onChanged(_selectedItems);
    Navigator.pop(context);
  }

  void _clear() {
    _selectedItems.clear();
    _selectedItem = null;
    setState(() {});
  }

  void _selectAll() {
    _selectedItems = List.from(widget.items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (widget.showSearch)
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: widget.searchHint,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            if (widget.showSearch) const SizedBox(height: 16),
            Expanded(
              child: _filteredItems.isEmpty
                  ? Center(child: Text(widget.emptyText))
                  : ListView.separated(
                      itemCount: _filteredItems.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (_, index) {
                        final item = _filteredItems[index];
                        final selected = _isSelected(item);
                        return InkWell(
                          onTap: () => _onTap(item),
                          child:
                              widget.itemBuilder?.call(
                                context,
                                item,
                                selected,
                              ) ??
                              ListTile(
                                title: Text(widget.itemLabel(item)),
                                trailing: widget.isMultiSelect
                                    ? Checkbox(
                                        value: selected,
                                        onChanged: (_) => _onTap(item),
                                      )
                                    : selected
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : null,
                              ),
                        );
                      },
                    ),
            ),

            if (widget.isMultiSelect) ...[
              const Divider(),
              Row(
                children: [
                  TextButton(onPressed: _clear, child: Text(widget.clearText)),
                  const Spacer(),
                  TextButton(
                    onPressed: _selectAll,
                    child: Text(widget.selectAllText),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _submit,
                  child: Text(widget.doneText),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
