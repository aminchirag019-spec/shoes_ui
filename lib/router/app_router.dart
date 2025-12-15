import 'package:go_router/go_router.dart';
import 'package:task_1/screens/sliderScreen/sliders_creen.dart';
import 'package:task_1/screens/loginScreen/login_screen.dart';
import 'package:task_1/screens/signupScreen/signup_screen.dart';
import 'package:task_1/screens/forgotPassScreen/forgot_password_screen.dart';
import 'package:task_1/screens/homeScreen/home_screen.dart';
import 'package:task_1/screens/detailsScreen/details_screen.dart';
import 'package:task_1/screens/favoriteScreen/favourite_screen.dart';
import 'package:task_1/screens/myCartScreen/mycart_screen.dart';
import 'package:task_1/screens/checkoutScreen/checkout_screen.dart';
import 'package:task_1/screens/checkoutScreen/payment_checkout_screen.dart';
import 'package:task_1/screens/notificationScreen/notification_screen.dart';
import 'package:task_1/screens/bestSellerScreen/best_seller_screen.dart';
import 'package:task_1/screens/accountSettingScreen/account_setting_screen.dart';
import 'package:task_1/screens/profileScreen/profile_screen.dart';
import 'package:task_1/screens/searchScreen/search_screen.dart';
import '../screens/widgets/zoom_drawer.dart';

final GoRouter approuter = GoRouter(
  initialLocation: '/SliderScreen',
  routes: [
    GoRoute(
      path: '/SliderScreen',
      builder: (context, state) => Sliderscreen(),
    ),
    GoRoute(
      path: '/LoginScreen',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/SignupScreen',
      builder: (context, state) => Signupscreen(),
    ),
    GoRoute(
      path: '/ForgotPassScreen',
      builder: (context, state) => ForgotPasswordScreen(),
    ),

    ShellRoute(
      builder: (context, state, child) {
        return ZoomShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/HomeScreen',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/FavouriteScreen',
          builder: (context, state) => const FavouriteScreen(),
        ),
        GoRoute(
          path: '/NotificationScreen',
          builder: (context, state) =>  NotificationScreen(),
        ),
        GoRoute(
          path: '/ProfileScreen',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    GoRoute(
          path: '/DetailsScreen',
          builder: (context, state) => DetailsScreen(),
        ),
        GoRoute(
          path: '/MycartScreen',
          builder: (context, state) => MycartScreen(),
        ),
        GoRoute(
          path: '/CheckoutScreen',
          builder: (context, state) => CheckoutScreen(),
        ),
        GoRoute(
          path: '/PaymentCheckoutScreen',
          builder: (context, state) => PaymentCheckoutScreen(),
        ),
        GoRoute(
          path: '/BestSellerScreen',
          builder: (context, state) => BestSellerScreen(),
        ),
        GoRoute(
          path: '/AccountSettingScreen',
          builder: (context, state) => AccountSettingScreen(),
        ),
        GoRoute(
          path: '/SearchScreen',
          builder: (context, state) => SearchScreen(),
        ),
      ],
    );

