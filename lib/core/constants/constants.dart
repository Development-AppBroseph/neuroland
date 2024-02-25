enum Endpoints {
  registration(endpoint: '/api/registration/'),
  usersMe(endpoint: '/api/users/me/'),
  authentication(endpoint: '/api/auth/token/login/'),
  refreshToken(endpoint: '/api/auth/token/refresh/'),
  vidoCourses(endpoint: '/api/course-videos/'),
  profile(endpoint: '/api/users/me/'),
  inviteLink(endpoint: '/api/invite/'),
  addPoints(endpoint: '/api/videos/ viewed/'),
  useCoupon(endpoint: '/api/coupons/ redeem/'),
  partnerCoupons(endpoint: '/api/partner-coupons/');

  final String endpoint;
  const Endpoints({required this.endpoint});
}

const String baseUrl = 'http://84.201.157.51';

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
      case Endpoints.partnerCoupons:
        return '/api/partner-coupons/';
    }
  }
}

const String telegramBot = 'https://t.me/Neurolandro_bot';
