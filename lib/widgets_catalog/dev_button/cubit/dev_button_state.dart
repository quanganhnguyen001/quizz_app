// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dev_button_cubit.dart';

class DevButtonState extends Equatable {
  final Offset offset;
  const DevButtonState({
    required this.offset,
  });

  @override
  List<Object> get props => [offset];

  DevButtonState copyWith({
    Offset? offset,
  }) {
    return DevButtonState(
      offset: offset ?? this.offset,
    );
  }
}
