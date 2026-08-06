import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_leyer/core/router/app_router.dart';
import 'package:network_leyer/core/widgets/base_select/models/base_select_args.dart';
import 'package:network_leyer/core/widgets/base_select/models/selectable_item.dart';
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
                    onPressed: () async {
                      final paths = context
                          .read<UploadCubit>()
                          .state
                          .items
                          .map((e) => e.file.path)
                          .toList();

                      final result = await context.router
                          .push<List<SelectableItem>>(
                            BaseSelectRoute(
                              args: BaseSelectArgs(
                                title: 'Selected Images',
                                isMultiSelect: true,
                                items: paths
                                    .map(
                                      (p) => SelectableItem(
                                        id: p,
                                        label: p.split('/').last,
                                        data: p,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          );

                      if (result != null) {
                        final selectedPaths = result
                            .map((e) => e.data as String)
                            .toList();
                        debugPrint(selectedPaths.toString());
                      }
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
