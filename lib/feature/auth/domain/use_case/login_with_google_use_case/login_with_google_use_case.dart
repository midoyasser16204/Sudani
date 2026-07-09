import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../entity/user_entity.dart';

abstract class LoginWithGoogleUseCase {
  Future<Either<Failure, UserEntity>> execute();
}
