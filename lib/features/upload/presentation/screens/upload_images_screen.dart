import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injector.dart';
import '../cubit/upload_cubit.dart';
import '../cubit/upload_state.dart';
import '../widgets/upload_header.dart';
import '../widgets/upload_grid.dart';

class UploadImagesScreen extends StatelessWidget {
  const UploadImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UploadCubit>(),
      child: const _UploadView(),
    );
  }
}

class _UploadView extends StatelessWidget {
  const _UploadView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Images'),
        actions: [
          BlocBuilder<UploadCubit, UploadState>(
            buildWhen: (p, c) => p.items.length != c.items.length,
            builder: (context, state) {
              if (state.items.isEmpty) return const SizedBox.shrink();
              return IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () => context.read<UploadCubit>().clearAll(),
              );
            },
          ),
        ],
      ),
      body: const Column(
        children: [
          UploadHeader(),
          Expanded(child: UploadGrid()),
        ],
      ),
    );
  }
}