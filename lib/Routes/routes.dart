import 'package:carsave/Utils/Authentication/auth_gate.dart';
import 'package:carsave/Utils/Theme/theme.dart';
import 'package:carsave/View/Home/home_page.dart';
import 'package:carsave/View/Licenses/licenses.dart';
import 'package:carsave/View/Login/login.dart';
import 'package:carsave/View/My_Account/my_account.dart';
import 'package:carsave/View/Notifications/notifications.dart';
import 'package:carsave/View/Saving_Page/saving_page.dart';
import 'package:carsave/View/Set_Target_Amount/set_target_amount.dart';
import 'package:carsave/View/Signup/signup.dart';
import 'package:carsave/View/Terms_and_Services/terms_and_services.dart';
import 'package:carsave/View/User_Profile/user_profile.dart';
import 'package:get/get.dart';

class RoutesPath {
static String initialization = '/initialization';
static String login = '/loginPage';
static String signup = '/signupPage';
static String home = '/homePage';
static String userProfile = '/userProfile';
static String setTargetAmount = '/setTargetAmount';
static String notificationPage = '/notificationPage';
static String licensesPage = '/licensesPage';
static String termPage = '/termPage';
static String theme = '/theme';
}

final pages = [
  //initialization - AuthGate
  GetPage(
    name: RoutesPath.initialization,
    page: () => const AuthGate(),
  ),
  //All Pages
  GetPage(
    name: RoutesPath.login,
    page: () => LoginPage(),
    transition: Transition.upToDown,
  ),
  GetPage(
    name: RoutesPath.signup,
    page: () => const SignupPage(),
    transition: Transition.downToUp,
  ),
  GetPage(
    name: RoutesPath.home,
    page: () => HomePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: RoutesPath.userProfile,
    page: () => UserProfile(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: RoutesPath.setTargetAmount,
    page: () => SetTargetAmount(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: RoutesPath.notificationPage,
    page: () => NotificationPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: RoutesPath.licensesPage,
    page: () => LicensesPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: RoutesPath.termPage,
    page: () => TermsAndServicesPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: RoutesPath.theme,
    page: () => ThemeChangePage(),
    transition: Transition.rightToLeft,
  ),
];