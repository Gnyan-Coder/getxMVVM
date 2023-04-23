import 'package:get/get.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/view/home.dart';
import 'package:getxmvvm/view/login/login_view.dart';
import 'package:getxmvvm/view/splash_screen.dart';


class AppRoutes{
  static appRoutes()=>[
    GetPage(name: RoutesName.splashScreen, page: ()=>const Splash(),transition: Transition.leftToRight,
        transitionDuration: const Duration(microseconds: 100)),
    GetPage(name: RoutesName.loginView, page: ()=>const LoginView(),transition: Transition.leftToRight,
        transitionDuration: const Duration(microseconds: 100)),
    GetPage(name: RoutesName.homeView, page: ()=>const Home(),transition: Transition.leftToRight,
        transitionDuration: const Duration(microseconds: 100))
  ];
}