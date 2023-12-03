import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/checkList/model/citymodel.dart';
import 'package:term/Feutcher/view/screens/checkList/model/conteymodel.dart';
import 'package:term/Feutcher/view/screens/checkanotherlist/view/widgets/dialog.dart';
import 'package:term/Feutcher/view/screens/checkanotherlist/view/widgets/suDiolog.dart';

class XCheckListController extends GetxController{
  int currentStep =0;
  onStepTapped(index){
    currentStep = index;
    update();
  }
  bool IsSubmit =false;
  final FocusScopeNode focusScopeNode = FocusScopeNode();
  onStepContinue(context){
    if(currentStep!=9){
      currentStep++;
      update();
    }else if(currentStep ==9){
      // Get.offAll(()=> MainScreen());
      IsSubmit = true;
      FocusScope.of(context).requestFocus(focusScopeNode);
      update();
      // SupmitCode

    }
  }

  supmitCode()async{

  }

  onStepCancel(){
    if(currentStep!=0){
      currentStep--;
      update();
    }
  }
  onchange(){

    update();
  }
    int listlength = 10;
   List<bool> checkBoxValues = List.generate(20, (index) => false);
  toggleCheckbox(int index) {
    checkBoxValues[index] = !checkBoxValues[index];
    update();
  }
  Future GetSteper()async{
    try{
      Dio dio = Dio();
      var response = await dio.get(
        'https://static.term.ae/api/quotations',
        options: Options(
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode == 200) {
        // print(response.data);
      }
      else {
        print(response.statusMessage);
      }
      // update();
      return response.data;
    }catch(e){
      print(e);
    }

  }
  ///////////////// Years
  bool isyearSelect =false;
  onChageSelectYear(value){
    isyearSelect = value;
    update();
  }
  int selectedYear = 2;
  onchangeyear({value,id}){
    selectedYear = value;
    listOfObjects.add({
      "id":id,
      "value":value,
    });
    update();
  }
  /////////////////////////Years

  /////////////////////////Country
  String countryname = 'Afghanistan';
  List  Countrynamelist = [];
  List  Countryidlist = [];
  String countryid='';

  GetCountry() async{
    try{
      Dio dio = Dio();
      final response = await dio.get(
        'https://static.term.ae/api/countries',
        options: Options(
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode == 200) {
        // print(response.data);
        ConteryModel countrymodel = ConteryModel();
        countrymodel= ConteryModel.fromJson(response.data);

        print(countrymodel.data![0].name);
        // countryname = 'Afghanistan';
        Countrynamelist.clear();
        countrymodel.data!.forEach((element) {
          Countrynamelist.add(element.name);
          Countryidlist.add(element.id);
        });

      }
      else {
        print(response.statusMessage);
      }
      // return response.data;
    }catch(e){
      print(e);
    }
  }
  onChangecountryname({id,value}){
    countryname = value;
    print(Countrynamelist.indexOf(value));
    print(Countryidlist[Countrynamelist.indexOf(value)]);
    countryid = '${Countryidlist[Countrynamelist.indexOf(value)]}';
    GetCity();
    listOfObjects.add({
      "id":id,
      "value":value,
    });
    update();
  }
  /////////////////////////Country
  /////////////////////////City
  String cityname ='';
  List  citynamelist = [];
  GetCity() async{
    try{
      Dio dio = Dio();
      final response = await dio.get(
        'https://static.term.ae/api/cities/${countryid}',
        options: Options(
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);

        CityModel cityModel = CityModel();
        cityModel = CityModel.fromJson(response.data);
        citynamelist.clear();
        cityModel.data!.forEach((element) {
          citynamelist.add(element.name);
        });
        print(citynamelist[0]);
        cityname =citynamelist[0];

        // print(countrymodel.data![0].name);
        // // countryname = 'Afghanistan';
        // Countrynamelist.clear();
        // countrymodel.data!.forEach((element) {
        //   Countrynamelist.add(element.name);
        //   Countryidlist.add(element.id);
        // });

      }
      else {
        print(response.statusMessage);
      }
      // return response.data;
    }catch(e){
      print(e);
    }
  }
  onChangeCityvalue({value,id}){
    cityname = value;
    listOfObjects.add({
      "id":id,
      "value":value,
    });
    update();
  }
  /////////////////////////City
  /////////////////////////Scoial media
  String selectedSocialMedia = 'Facebook';
  List<String> socialMediaOptions = ['Facebook', 'Twitter', 'Instagram', 'LinkedIn', 'Pinterest', 'YouTube', 'TikTok', 'WhatsApp', 'Reddit', 'Tumblr', 'Flickr', 'Quora', 'Medium', 'Vimeo', 'Periscope', 'WeChat', 'LINE', 'Telegram', 'VKontakte (VK)'];
  onchangeSocial({value,id}){
    selectedSocialMedia = value;
    listOfObjects.add({
      "id":id,
      "value":value,
    });
    update();
  }
  /////////////////////////Scoial media
  /////////////////////////Langauge
  String selectedLanguage = 'Spanish';
  onchangeLanguagh({id,value}){
    selectedLanguage = value;
    listOfObjects.add({
      "id":id,
      "value":value,
    });
  update();
  }
  List<String> spokenLanguages = [
    'Spanish',
    'English',
    'Mandarin Chinese',
    'Hindi',
    'Arabic',
    'Bengali',
    'Portuguese',
    'Russian',
    'Urdu',
    'Indonesian',
    'German',
    'French',
    'Italian',
    'Turkish',
    'Japanese',
    'Korean',
    'Vietnamese',
    'Tamil',
    'Telugu',
    'Marathi',
  ];

  /////////////////////////Langauge
  /////////////////////////ListText
  List<TextEditingController> Typetecs = [];
  onEditingComplete({id,value}){
    // print('sss');
    listOfObjects.add({
      "id":id,
      "value":value,
    });
    update();
  }
  List<TextEditingController> Analytecs = [];
  List<TextEditingController> Reportecs = [];
  /////////////////////////ListText
  /////////////////////////ListContainernormal
  List<int> keywordindex = [];
  setkeywordindex(index){
  keywordindex[index]=1;
  update();
  }
  setkeywordindexnull(index){
  keywordindex[index]=0;
  update();
  }
  List<int> Durationindex = [];
  setDurationindex(index){
    Durationindex[index]=1;
  update();
  }
  setDurationindexnull(index){
    Durationindex[index]=0;
  update();
  }
  List<int> WorldWideindex = [];
  setWorldWideindex(index){
    WorldWideindex[index]=1;
  update();
  }
  setWorldWideindexnull(index){
    WorldWideindex[index]=0;
  update();
  }
  List<int> Sourcesindex = [];
  setSourcesindex(index){
    Sourcesindex[index]=1;
  update();
  }
  setSourcesxnull(index){
    Sourcesindex[index]=0;
  update();
  }
  List<int> Intervalindex = [];
  setIntervalindex(index){
    Intervalindex[index]=1;
  update();
  }
  setIntervalxnull(index){
    Intervalindex[index]=0;
  update();
  }
  List<int> Socialindex = [];
  setSocialindex(index){
    Socialindex[index]=1;
  update();
  }
  setSocialxnull(index){
    Socialindex[index]=0;
  update();
  }
  /////////////////////////ListContainernormal

  @override
  void dispose() {
    // TODO: implement dispose
    for (var controller in Typetecs) {
      controller.dispose();
    }
    for (var ancontroller in Analytecs) {
      ancontroller.dispose();
    }
    for (var repcontroller in Reportecs) {
      repcontroller.dispose();
    }
    super.dispose();
  }
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }



  TextEditingController nametec =TextEditingController();
  TextEditingController emailtec =TextEditingController();
  TextEditingController phonetec =TextEditingController();
  Map<String, dynamic> myData = {};
  List datalist=[];
  insertDatatoMap({id,value}){
    myData['id']=id;
    myData['value']=value;
    datalist.add(myData);
    print("${myData['value']}");
  }
  printdata(){
    print('List of Objects: $listOfObjects');
  }
  clearData(){
    listOfObjects.clear();
    update();
  }

  List<Map<String, dynamic>> listOfObjects = [];

  insertListDatato({id,value}){
    listOfObjects.add({
      "id":id,
      "value":value,
    });
  }
  removeitemListData({id}){
    listOfObjects.removeWhere((element) => element['id']==id);
    print('List of Objects: $listOfObjects');
  }
  BtnSubmit(
      context
      )async{



    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var data = {
      "name": "${nametec.text}",
      "email": "${emailtec.text}",
      "phone": "${phonetec.text}",
      "quotation_list":listOfObjects
    };
    try{
      Dio dio =Dio();
      final response = await dio.post('https://static.term.ae/api/quotation/store',
      options: Options(
        headers: headers,
        validateStatus: (status) => true,
      ),
        data: data
      );
      if(response.statusCode ==200){
        print(response.data);
        showDialog(context: context, builder: (context) {
          return SUMyDialog();
        });
      }else{
        print(response.data);
      }

    }catch(e){
      print(e);
    }

  }

}