import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_leyer/core/widgets/base_select.dart';

import '../../../../core/utils/enums/enums.dart';
import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';

class UploadHeader extends StatelessWidget {
  const UploadHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<UploadCubit, UploadState>(
        builder: (context, state) {
          final total = state.items.length;
          final uploaded = state.items
              .where((i) => i.status == UploadItemStatus.success)
              .length;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                total == 0
                    ? 'No images selected'
                    : '$uploaded of $total uploaded',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.photo_library_outlined),
                    onPressed: () =>
                        context.read<UploadCubit>().pickMultipleFromGallery(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt_outlined),
                    onPressed: () =>
                        context.read<UploadCubit>().pickSingleFromCamera(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.list_alt),
                    onPressed: () {
                      final items = context
                          .read<UploadCubit>()
                          .state
                          .items
                          .map((e) => e.file.path)
                          .toList();

                      BaseSelect.show<String>(
                        context: context,
                        title: 'Selected Images',
                        items: items,
                        isMultiSelect: true,
                        itemLabel: (item) => item.split('/').last,
                        onChanged: (value) {
                          debugPrint(value.toString());
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
