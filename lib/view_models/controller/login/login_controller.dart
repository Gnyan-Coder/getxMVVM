import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/models/login/user_model.dart';
import 'package:getxmvvm/repositry/login_repositry/login_repositry.dart';
import 'package:getxmvvm/res/routes/routes_name.dart';
import 'package:getxmvvm/utils/utils.dart';
import 'package:getxmvvm/view_models/controller/user_preferences/user_preferences_view_model.dart';

class LoginViewController extends GetxController{
  final _api=LoginRepo();
  UserPreferences userPreferences=UserPreferences();

  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
  final emailFocusNode=FocusNode().obs;
  final passwordFocusNode=FocusNode().obs;
  RxBool loading=false.obs;

  void loginApi(){
    loading.value=true;
    Map data={
      'email':emailController.value.text,
      'password':passwordController.value.text,
    };
    _api.loginApi(data).then((value){
      loading.value=true;
      userPreferences.saveUser(UserModel.fromJson(value)).then((value){
          Get.toNamed(RoutesName.homeView);
      }).onError((error, stackTrace) {

      });
        Utils.toastMessage("successfully login");
    }).onError((error, stackTrace){
      loading.value=true;
      Utils.toastMessage(error.toString());
    });
  }
}