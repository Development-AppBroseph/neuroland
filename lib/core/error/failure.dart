import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String error;

  const Failure({required this.error});
  @override
  List<Object?> get props => [error];
}

class ServerFailure extends Failure {
  const ServerFailure({required String error}):super(error: error);
}

class CacheFailure extends Failure {
  const CacheFailure({required String error}):super(error: error);
}