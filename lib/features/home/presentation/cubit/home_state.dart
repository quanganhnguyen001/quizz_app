part of 'home_cubit.dart';

class HomeState {
  final int currentIndex;

  const HomeState({
    required this.currentIndex,
  });

  HomeState copyWith({
    int? currentIndex,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
