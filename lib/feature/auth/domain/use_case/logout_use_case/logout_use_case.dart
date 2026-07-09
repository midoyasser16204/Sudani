import 'package:dartz/dartz.dart';
import '../../../../../core/error/failure.dart';

abstract class LogoutUseCase {
  Future<Either<Failure, void>> execute();
}
