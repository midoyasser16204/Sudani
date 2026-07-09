sealed class Failure {
  final String message;
  const Failure(this.message);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class GoogleSignInFailure extends Failure {
  const GoogleSignInFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class LocationFailure extends Failure {
  const LocationFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
