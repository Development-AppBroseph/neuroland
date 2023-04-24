import 'package:equatable/equatable.dart';

enum SignInStates {
  signInEmptyState,
  signInLoadingState,
  signInLoadedState,
  signInErrorState,
}

class SignInState  {
  final SignInStates signInStates;

  const SignInState({
    this.signInStates = SignInStates.signInEmptyState,
  });
}

// class SignInEmptyState extends SignInState {
//   @override
//   List<Object?> get props => [];
// }

// class SignInLoadingState extends SignInState {
//   @override
//   List<Object?> get props => [];
// }

// class SignInLoadedState extends SignInState {
//   @override
//   List<Object?> get props => [];
// }

// class SignInErrorState extends SignInState {
//   final String message;

//   SignInErrorState({required this.message});
//   @override
//   List<Object?> get props => [];
// }
