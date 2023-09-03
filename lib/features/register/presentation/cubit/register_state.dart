part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final bool isShowPassword;
  const RegisterState({required this.isShowPassword});

  @override
  List<Object> get props => [];

  RegisterState copyWith({bool? isShowPassword}) {
    return RegisterState(isShowPassword: isShowPassword ?? this.isShowPassword);
  }
}
