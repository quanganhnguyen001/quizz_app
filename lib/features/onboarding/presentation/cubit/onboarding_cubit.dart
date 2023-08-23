import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends HydratedCubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(currentIndex: 0));
  final controller = PageController();

  changePage(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  @override
  OnboardingState? fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(OnboardingState state) {
    throw UnimplementedError();
  }
}
