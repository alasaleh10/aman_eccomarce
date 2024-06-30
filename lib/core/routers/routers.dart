import 'package:aman_store2/features/favorite/prsentation/views/faviorte_view.dart';
import 'package:aman_store2/features/items_detils/prsentation/views/display_items_view.dart';
import 'package:aman_store2/features/items_detils/prsentation/views/item_detils_view.dart';
import 'package:aman_store2/features/saved_address/prsentation/views/add_address_view.dart';
import 'package:aman_store2/features/saved_address/prsentation/views/saved_address_view.dart';
import 'package:flutter/material.dart';

import '../../features/orders/prsentation/views/rating_order_trying_view.dart';

import '../../features/my_account/prsentation/views/edit_my_data_view.dart';
import '../../features/orders/prsentation/views/follow_order_view.dart';

import '../../features/splash_screen/views/splash_screen_view.dart';
import 'app_routers.dart';
import 'page_animation.dart';
import '../../features/add_location/prsentation/views/add_location_view.dart';
import '../../features/auth/prsentation/views/cheek_email_view.dart';
import '../../features/auth/prsentation/views/confirem_email_view.dart';
import '../../features/auth/prsentation/views/login_view.dart';
import '../../features/auth/prsentation/views/rest_password_view.dart';
import '../../features/auth/prsentation/views/signup_view.dart';
import '../../features/home/prsentation/views/home_all_categorisess.dart';
import '../../features/home_screen/views/home_screen.dart';
import '../../features/on_bording/views/on_bording_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/prsentation/views/home_new_aman_view.dart';
import '../helper/cached_helper.dart';

abstract class Routers {
  static final routs = GoRouter(routes: [
    GoRoute(
      path: AppRouters.splashView,
      pageBuilder: (context, state) =>
          pageAnimation(page: const SplashScreenView()),
    ),
    GoRoute(
      redirect: (context, state) {
        if (CacheHelper.getData(key: 'token') != null) {
          return '/${AppRouters.homeScreenView}';
        }
        return null;
      },
      name: AppRouters.onBordingView,
      path: '/${AppRouters.onBordingView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const OnBordingView());
      },
    ),
    GoRoute(
      name: AppRouters.loginView,
      path: '/${AppRouters.loginView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const LoginView());
      },
    ),
    GoRoute(
      name: AppRouters.signupView,
      path: '/${AppRouters.signupView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const SignUpView());
      },
    ),
    GoRoute(
      name: AppRouters.homeScreenView,
      path: '/${AppRouters.homeScreenView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const HomeScreenView());
      },
    ),
    GoRoute(
      name: AppRouters.confirmEmailView,
      path: '/${AppRouters.confirmEmailView}',
      pageBuilder: (context, state) {
        return pageAnimation(
            page: ConfirmEmailView(
          data: state.extra as List,
        ));
      },
    ),
    GoRoute(
      name: AppRouters.cheekEmailView,
      path: '/${AppRouters.cheekEmailView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const CheekEmailView());
      },
    ),
    GoRoute(
      name: AppRouters.restPasswordView,
      path: '/${AppRouters.restPasswordView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const RestPasswordView());
      },
    ),
    GoRoute(
      name: AppRouters.addLocationView,
      path: '/${AppRouters.addLocationView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const AddLocationView());
      },
    ),
    GoRoute(
      name: AppRouters.homeAmanView,
      path: '/${AppRouters.homeAmanView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const HomeNewAmanView());
      },
    ),
    GoRoute(
      name: AppRouters.homeAllCategorisesView,
      path: '/${AppRouters.homeAllCategorisesView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const HomeAllCategorisess());
      },
    ),
    GoRoute(
      name: AppRouters.editMyDataView,
      path: '/${AppRouters.editMyDataView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const EditMyDataView());
      },
    ),
    GoRoute(
      name: AppRouters.followOrderView,
      path: '/${AppRouters.followOrderView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const FollowOrderView());
      },
    ),
    GoRoute(
      name: AppRouters.ratingOrderTryingView,
      path: '/${AppRouters.ratingOrderTryingView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const RatingOrderTryingView());
      },
    ),
    GoRoute(
      name: AppRouters.savedAddressView,
      path: '/${AppRouters.savedAddressView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const SavedAddressView());
      },
    ),
    GoRoute(
      name: AppRouters.itemDetilsView,
      path: '/${AppRouters.itemDetilsView}',
      pageBuilder: (context, state) {
        return pageAnimation(
            page: ItemDetilsView(
          itemId: state.extra as int,
        ));
      },
    ),
    GoRoute(
      name: AppRouters.faviortView,
      path: '/${AppRouters.faviortView}',
      pageBuilder: (context, state) {
        return pageAnimation(page: const FaviortView());
      },
    ),
    GoRoute(
      name: AppRouters.displayItemsView,
      path: '/${AppRouters.displayItemsView}',
      pageBuilder: (context, state) {
        return pageAnimation(
            page: DisplayItemsView(
          data: state.extra as List,
        ));
      },
    ),
    GoRoute(
      name: AppRouters.addAddressView,
      path: '/${AppRouters.addAddressView}',
      pageBuilder: (context, state) {
        return pageAnimation(
            page: AddAddressView(

          context2: state.extra as BuildContext,
        ));
      },
    ),
  ]);
}
