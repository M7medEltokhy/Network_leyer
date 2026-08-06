import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_leyer/core/widgets/base_select/base_select_page.dart';
import 'package:network_leyer/core/widgets/base_select/models/base_select_args.dart';
import 'package:network_leyer/features/auth/presentation/screens/login_screen.dart';
import 'package:network_leyer/features/auth/presentation/screens/otp_screen.dart';
import 'package:network_leyer/features/upload/presentation/screens/upload_images_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: OtpRoute.page),
    AutoRoute(page: UploadImagesRoute.page),

    CustomRoute(
      page: BaseSelectRoute.page,
      opaque: false,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),
  ];
}