import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';
import 'upload_grid_item.dart';

class UploadGrid extends StatelessWidget {
  const UploadGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadCubit, UploadState>(
      builder: (context, state) {
        if (state.items.isEmpty) {
          return const Center(child: Text('No images yet'));
        }
        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            return UploadGridItem(item: state.items[index]);
          },
        );
      },
    );
  }
}