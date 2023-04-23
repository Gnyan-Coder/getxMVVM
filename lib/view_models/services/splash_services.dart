import 'dart:async';

import 'package:get/get.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/view_models/controller/user_preferences/user_preferences_view_model.dart';

class SplashServices{
  UserPreferences userPreferences=UserPreferences();
  void isLogin(){
      userPreferences.getUser().then((value){
        if(value.token.toString()=='null'){
          Timer(const Duration(seconds: 3),()=>Get.toNamed(RoutesName.loginView));
        }else{
          Timer(const Duration(seconds: 3),()=>Get.toNamed(RoutesName.homeView));
        }
      });
  }


}