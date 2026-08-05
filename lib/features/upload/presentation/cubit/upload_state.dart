import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/upload_item.dart';

part 'upload_state.freezed.dart';

@freezed
abstract class UploadState with _$UploadState {
  const factory UploadState({
    @Default([]) List<UploadItem> items,
  }) = _UploadState;
}