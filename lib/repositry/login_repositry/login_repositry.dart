import 'package:getxmvvm/data/network/network_api_services.dart';
import 'package:getxmvvm/res/appurl/app_url.dart';

class LoginRepo{
  final _apiService=NetworkApiServices();

  Future<dynamic> loginApi(var data)async{
    dynamic response=_apiService.postApi(data,AppUrl.login);
  }

}