import 'package:get/get.dart';
import 'package:getxmvvm/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{
  Future<bool> saveUser(UserModel loginResponseModel)async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString('token',loginResponseModel.token.toString());
    return true;
  }

  Future<UserModel> getUser()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    String? token=sp.getString('token');
    return UserModel(
      token: token
    );
  }
  Future<bool> removeUser()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}