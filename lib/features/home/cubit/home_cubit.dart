// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(currentIndex: 0));

  changeBottomNavBar(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
