enum Endpoints {
  registration,
  usersMe,
  authentication,
}

const String baseUrl = 'http://158.160.44.207:8007';

extension EndpointsExtension on Endpoints {
  String get endpoint {
    switch (this) {
      case Endpoints.registration:
        return '/users_alfacrm/registration/';
      case Endpoints.usersMe:
        return '/api/users/me/';
      case Endpoints.authentication:
        return '/users_alfacrm/authentication/';
    }
  }
}
