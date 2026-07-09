import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';
import '../../entity/user_entity.dart';

abstract class LoginUseCase {
  Future<Either<Failure, UserEntity>> execute(String email, String password);
}