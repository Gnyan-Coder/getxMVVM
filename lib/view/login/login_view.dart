import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/utils/utils.dart';
import 'package:getxmvvm/view_models/controller/login/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewController loginViewController=Get.put(LoginViewController());

  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
           Obx((){
             return Column(
               children: [
                 Form(
                   key: _formkey,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       TextFormField(
                         controller: loginViewController.emailController.value,
                         focusNode: loginViewController.emailFocusNode.value,
                         decoration: InputDecoration(
                             hintText: "email"
                         ),
                         onFieldSubmitted: (value){
                           Utils.fieldFocusChange(context, loginViewController.emailFocusNode.value, loginViewController.passwordFocusNode.value);
                         },
                       ),
                       TextFormField(
                         controller: loginViewController.passwordController.value,
                         focusNode:loginViewController.passwordFocusNode.value,
                         decoration: InputDecoration(
                             hintText: "password"
                         ),
                       ),
                       ElevatedButton(
                           onPressed: (){
                             loginViewController.loginApi();
                           },
                           child: Text("submit")
                       )
                     ],
                   ),
                 ),
               ],
             );
           })
          ],
        ),
      ),
    );
  }
}
