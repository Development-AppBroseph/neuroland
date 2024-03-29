import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpEmptyState extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpLoadingState extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpLoadedState extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpErrorState extends SignUpState {
  final String message;

  SignUpErrorState({required this.message});
  @override
  List<Object?> get props => [];
}
