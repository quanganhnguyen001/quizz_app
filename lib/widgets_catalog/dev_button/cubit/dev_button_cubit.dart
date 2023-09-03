import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'dev_button_state.dart';

class DevButtonCubit extends HydratedCubit<DevButtonState> {
  DevButtonCubit() : super(const DevButtonState(offset: Offset.zero));

  @override
  DevButtonState? fromJson(Map<String, dynamic> json) {
    final double dx = json['dx'] ?? 0;

    final double dy = json['dy'] ?? 0;

    return DevButtonState(offset: Offset(dx, dy));
  }

  @override
  Map<String, dynamic>? toJson(DevButtonState state) {
    final Map<String, dynamic> stateJson = {
      'dx': state.offset.dx,
      'dy': state.offset.dy,
    };
    return stateJson;
  }

  void moveButton(Offset delta) {
    final newOffset = state.offset + delta;
    emit(state.copyWith(offset: newOffset));
  }
}
