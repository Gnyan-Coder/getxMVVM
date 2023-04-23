import 'package:get/get.dart';
import 'package:getxmvvm/data/response/status.dart';
import 'package:getxmvvm/models/home/user_list_model.dart';
import 'package:getxmvvm/repositry/home_repositry/home_repositry.dart';

class HomeController extends GetxController{
  final _api=HomeRepo();

  final rxRequestStatus=Status.loading.obs;
  final userList=UserListModel().obs;
  void setRxRequestStatus(Status _value)=>rxRequestStatus.value=_value;
  void setUserList(UserListModel _value)=>userList.value=_value;
  void userListApi(){
    _api.userListApi().then((value){
      setRxRequestStatus(Status.completed);
      setUserList(value);
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.error);
    });

  }
}