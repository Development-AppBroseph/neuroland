enum Endpoints {
  users,
  usersMe,
}

const String baseUrl = 'http://158.160.44.207:8007';

extension EndpointsExtension on Endpoints {
  String get endpoint {
    switch (this) {
      case Endpoints.users:
        return '/api/users/';
      case Endpoints.usersMe:
        return '/api/users/me/';
    }
  }
}
