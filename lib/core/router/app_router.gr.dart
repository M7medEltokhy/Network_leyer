// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BaseSelectPage]
class BaseSelectRoute extends PageRouteInfo<BaseSelectRouteArgs> {
  BaseSelectRoute({
    Key? key,
    required BaseSelectArgs args,
    List<PageRouteInfo>? children,
  }) : super(
         BaseSelectRoute.name,
         args: BaseSelectRouteArgs(key: key, args: args),
         initialChildren: children,
       );

  static const String name = 'BaseSelectRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BaseSelectRouteArgs>();
      return BaseSelectPage(key: args.key, args: args.args);
    },
  );
}

class BaseSelectRouteArgs {
  const BaseSelectRouteArgs({this.key, required this.args});

  final Key? key;

  final BaseSelectArgs args;

  @override
  String toString() {
    return 'BaseSelectRouteArgs{key: $key, args: $args}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BaseSelectRouteArgs) return false;
    return key == other.key && args == other.args;
  }

  @override
  int get hashCode => key.hashCode ^ args.hashCode;
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [OtpScreen]
class OtpRoute extends PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    Key? key,
    required String phone,
    required String countryCode,
    List<PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(key: key, phone: phone, countryCode: countryCode),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return OtpScreen(
        key: args.key,
        phone: args.phone,
        countryCode: args.countryCode,
      );
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.phone,
    required this.countryCode,
  });

  final Key? key;

  final String phone;

  final String countryCode;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, phone: $phone, countryCode: $countryCode}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpRouteArgs) return false;
    return key == other.key &&
        phone == other.phone &&
        countryCode == other.countryCode;
  }

  @override
  int get hashCode => key.hashCode ^ phone.hashCode ^ countryCode.hashCode;
}

/// generated route for
/// [UploadImagesScreen]
class UploadImagesRoute extends PageRouteInfo<void> {
  const UploadImagesRoute({List<PageRouteInfo>? children})
    : super(UploadImagesRoute.name, initialChildren: children);

  static const String name = 'UploadImagesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UploadImagesScreen();
    },
  );
}
