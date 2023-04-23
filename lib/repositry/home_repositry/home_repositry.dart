import 'package:getxmvvm/data/network/network_api_services.dart';
import 'package:getxmvvm/models/home/user_list_model.dart';
import 'package:getxmvvm/res/appurl/app_url.dart';

class HomeRepo{
  final _apiService=NetworkApiServices();

  Future<UserListModel> userListApi()async{
    dynamic response=await _apiService.getApi(AppUrl.userList);
    return UserListModel.fromJson(response);
  }

}