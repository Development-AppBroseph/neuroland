import 'package:equatable/equatable.dart';

enum ScreenState {
  rootScreenInitialState,
  rootScreenHaveTokenState,
  rootScreenNotHaveTokenState,
}

class RootScreenState extends Equatable {
  final ScreenState screenState;
  const RootScreenState(
      {this.screenState = ScreenState.rootScreenInitialState});
  @override
  List<Object?> get props => [screenState];

  // factory RootScreenState.fromJson(Map<String, dynamic> json) =>
  //     RootScreenState(screenState: json['screenState']);

  // Map<String, dynamic> toJson() => {
  //       'screenState': screenState,
  //     };
}

// class RootScreenInitialState extends RootScreenState {
//   @override
//   List<Object?> get props => [];
// }

// class RootScreenHaveTokenState extends RootScreenState {
//   @override
//   List<Object?> get props => [];
// }

// class RootScreenNotHaveTokenState extends RootScreenState {
//   @override
//   List<Object?> get props => [];
// }
