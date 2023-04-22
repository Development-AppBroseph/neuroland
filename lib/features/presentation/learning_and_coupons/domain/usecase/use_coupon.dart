import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/repository/courses_video_repository.dart';

class UseCoupon extends UseCase<void, UseCouponParams> {
  final CoursesVideoRepository coursesVideoRepository;

  UseCoupon({required this.coursesVideoRepository});

  @override
  Future<Either<Failure, void>> call(UseCouponParams params) async {
    return await coursesVideoRepository.useCoupon(params.couponId);
  }
}

class UseCouponParams extends Equatable {
  final int couponId;

  const UseCouponParams({required this.couponId});
  @override
  List<Object?> get props => [couponId];
}
