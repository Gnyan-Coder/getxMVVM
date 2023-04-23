import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../res/Colors/color.dart';

class Utils{
  static void fieldFocusChange(BuildContext context,FocusNode current,FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor:AppColor.blackColor,
    );
  }
}