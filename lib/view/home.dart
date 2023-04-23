import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/data/response/status.dart';

import '../view_models/controller/home/homeController.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController=Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.loading:
            return Center(child: CircularProgressIndicator());
          case Status.error:
            return Center(child: Text("Error"),);
          case Status.completed:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context,index){
                  var data=homeController.userList.value.data!;
                return ListTile(
                      title: Text(data[index].firstName.toString()),
                  subtitle: Text(data[index].lastName.toString()),
                );

            });
        }
        return SizedBox();
      }),
    );
  }
}
