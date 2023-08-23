import 'package:equatable/equatable.dart';

class DefaultParams extends Equatable {
  final bool enableLoadingDialog;
  const DefaultParams({
    this.enableLoadingDialog = true,
  });
  @override
  List<Object?> get props => [enableLoadingDialog];
}
