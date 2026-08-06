import 'package:equatable/equatable.dart';

class SelectableItem extends Equatable {
  const SelectableItem({
    required this.id,
    required this.label,
    this.data,
  });

  final String id;
  final String label;
  final Object? data;

  @override
  List<Object?> get props => [id];
}