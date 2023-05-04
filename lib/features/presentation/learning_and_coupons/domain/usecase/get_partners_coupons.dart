import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_food/core/error/failure.dart';
import 'package:grow_food/core/usecase/usecase.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/entiti/partner_coupons/partner_coupons_entiti.dart';
import 'package:grow_food/features/presentation/learning_and_coupons/domain/repository/courses_video_repository.dart';

class GetPartnersCoupons extends UseCase<PartnerCouponsEntiti, GetPartnersCouponsParams>{
  final CoursesVideoRepository coursesVideoRepository;
  GetPartnersCoupons({required this.coursesVideoRepository});

  @override
  Future<Either<Failure, PartnerCouponsEntiti>> call(GetPartnersCouponsParams params) async {
    return await coursesVideoRepository.getPartnerCoupons();
  }
  

}


class GetPartnersCouponsParams extends Equatable{
  @override
  List<Object?> get props => [];
}