enum Endpoints {
  registration,
  usersMe,
  authentication,
  refreshToken,
  vidoCourses,
  profile,
  inviteLink,
  addPoints,
  useCoupon,
}

const String baseUrl = 'http://158.160.44.207:8007';

extension EndpointsExtension on Endpoints {
  String get endpoint {
    switch (this) {
      case Endpoints.registration:
        return '/api/registration/';
      case Endpoints.usersMe:
        return '/api/users/me/';
      case Endpoints.authentication:
        return '/api/auth/token/login/';
      case Endpoints.refreshToken:
        return '/api/auth/token/refresh/';
      case Endpoints.vidoCourses:
        return '/api/course-videos/';
      case Endpoints.profile:
        return '/api/users/me/';
      case Endpoints.inviteLink:
        return '/api/invite/';
      case Endpoints.addPoints:
        return '/api/videos/ viewed/';
      case Endpoints.useCoupon:
        return '/api/coupons/ redeem/';  
    }
  }
}

const String telegramBot = 'https://t.me/Neurolandro_bot';