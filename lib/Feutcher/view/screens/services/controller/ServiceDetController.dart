import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:term/Feutcher/view/screens/services/model/Servicedetailesmodel.dart';

class ServiceDetController extends GetxController{
  var one = Get.arguments;
  List<ServiceDetailesModel> selectdata= [];
  GetData()async{
    selectdata = ServDetList.where((element) => element.id==one['id']).toList();
    // selectdata = ServDetList;
    // var data = ServDetList[0].name;

    print(selectdata[0].name);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print(one['id']);
    GetData();
    super.onInit();
  }
}