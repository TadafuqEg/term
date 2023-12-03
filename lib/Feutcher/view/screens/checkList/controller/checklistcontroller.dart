
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/checkList/model/citymodel.dart';
import 'package:term/Feutcher/view/screens/mainScreen/mainScreen.dart';

import '../model/conteymodel.dart';

class CheckListController extends GetxController {
  int currentStep =0;
  onStepTapped(index){
    currentStep = index;
    update();
  }
  onStepContinue(){
    if(currentStep!=9){
      currentStep++;
      update();
    }else if(currentStep ==9){
      // Get.offAll(()=> MainScreen());
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
  int selectedValue = 1;
  onChange(value){
    selectedValue = value;
    update();
  }

  bool iskeyword1 =false;
  onChangekeyword1(value){
    iskeyword1 = value;
    update();
  }
  bool iskeyword2 =false;
  onChangekeyword2(value){
    iskeyword2 = value;
    update();
  }
  bool iskeyword3 =false;
  onChangekeyword3(value){
    iskeyword3 = value;
    update();
  }
  bool iskeyword4 =false;
  onChangekeyword4(value){
    iskeyword4 = value;
    update();
  }

  bool isduration1 =false;
  onChanduration1(value){
    isduration1 = value;
    update();
  }
  bool isduration2 =false;
  onChanduration2(value){
    isduration2 = value;
    update();
  }
  bool isduration3 =false;
  onChanduration3(value){
    isduration3 = value;
    update();
  }
  bool isduration4 =false;
  onChanduration4(value){
    isduration4 = value;
    update();
  }
  bool isduration5 =false;
  onChanduration5(value){
    isduration5 = value;
    update();
  }
 bool isduration6 =false;
  onChanduration6(value){
    isduration6 = value;
    update();
  }
 bool isduration7 =false;
  onChanduration7(value){
    isduration7 = value;
    update();
  }

  bool isgelocation1 =false;
  onChangelocation1(value){
    isgelocation1 = value;
    update();
  }

  bool isgelocation2 =false;
  onChangelocation2(value){
    isgelocation2 = value;
    update();
  }
  bool isgelocation3 =false;
  onChangelocation3(value){
    isgelocation3 = value;
    update();
  }
  bool isSources1 =false;
  onChanSources1(value){
    isSources1 = value;
    update();
  }
  bool isSources2 =false;
  onChanSources2(value){
    isSources2 = value;
    update();
  }
  bool isSources3 =false;
  onChanSources3(value){
    isSources3 = value;
    update();
  }
  bool istypedata1 = false;
  onChanistypedata1(value){
    istypedata1 = value;
    update();
  }
  bool istypedata2 = false;
  onChanistypedata2(value){
    istypedata2 = value;
    update();
  }
  bool istypedata3 = false;
  onChanistypedata3(value){
    istypedata3 = value;
    update();
  }
  bool istypedata4 = false;
  onChanistypedata4(value){
    istypedata4 = value;
    update();
  }
  bool isAnalysis1 = false;
  onChanAnalysis1(value){
    isAnalysis1 = value;
    update();
  }
  bool isAnalysis2 = false;
  onChanAnalysis2(value){
    isAnalysis2 = value;
    update();
  }
  bool isAnalysis3 = false;
  onChanAnalysis3(value){
    isAnalysis3 = value;
    update();
  }

  bool isAnalysis4 = false;
  onChanAnalysis4(value){
    isAnalysis4= value;
    update();
  }
  bool isAnalysis5 = false;
  onChanAnalysis5(value){
    isAnalysis5= value;
    update();
  }
  bool isReports1 = false;
  onChanReports1(value){
    isReports1= value;
    update();
  }
  bool isReports2 = false;
  onChanReports2(value){
    isReports2= value;
    update();
  }
bool isReports3 = false;
  onChanReports3(value){
    isReports3= value;
    update();
  }
bool isReports4 = false;
  onChanReports4(value){
    isReports4= value;
    update();
  }
bool isReports5 = false;
  onChanReports5(value){
    isReports5= value;
    update();
  }

  bool isInterval1 = false;
  onChanInterval1(value){
    isInterval1= value;
    update();
  }
  bool isInterval2 = false;
  onChanInterval2(value){
    isInterval2= value;
    update();
  }
bool isInterval3 = false;
  onChanInterval3(value){
    isInterval3= value;
    update();
  }
bool isInterval4 = false;
  onChanInterval4(value){
    isInterval4= value;
    update();
  }
bool isInterval5 = false;
  onChanInterval5(value){
    isInterval5= value;
    update();
  }bool isSocial = false;
  onChanSocial(value){
    isSocial= value;
    update();
  }

///////////////////
int selectedYear = 2;
  onchangeyear(value){

      selectedYear = value;
    update();
  }
  String selectedLanguage = 'English';
  onchangeLanguagh(value){selectedLanguage = value;
  update();
  }
  List<String> spokenLanguages = [
    'English',
    'Spanish',
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

  ///////////

  String selectedCountryName = 'United States';
   Country selectedCountry =Country('United States', ['East Coast', 'West Coast', 'Midwest', 'South']) ;
  // List countriess =['United States','Canada','United Kingdom'];
  List<Country> countries = [
    Country('United States', ['East Coast', 'West Coast', 'Midwest', 'South']),
    Country('Canada', ['Ontario', 'Quebec', 'Alberta', 'British Columbia']),
    Country('United Kingdom', ['England', 'Scotland', 'Wales', 'Northern Ireland']),
    Country('United xx', ['England', 'Scotland', 'Wales', 'Northern Ireland']),
    // Add more countries and regions as needed
  ];



   String selectedRegion='East Coast';
  onChangeCountry( value)async{
    selectedCountryName = value;
    selectedCountry = countries.firstWhere(
          (country) => country.name == selectedCountryName,
    );
     print(selectedCountry.regions.first);
    selectedRegion = selectedCountry.regions.first;
    update();
  }
  onChangeregin(value){
    selectedRegion = value;
    update();
  }
  String countryname = 'Afghanistan';
  String countryid='';
  List  Countrynamelist = [];
  List  Countryidlist = [];


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


  onChangecountryname(value){
    countryname = value;
    print(Countrynamelist.indexOf(value));
    print(Countryidlist[Countrynamelist.indexOf(value)]);
    countryid = '${Countryidlist[Countrynamelist.indexOf(value)]}';
    GetCity();
    update();
  }
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
  onChangeCityvalue(value){
    cityname = value;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    GetCountry();
    super.onInit();
  }
  String selectedSocialMedia = 'Facebook';
  List<String> socialMediaOptions = ['Facebook', 'Twitter', 'Instagram', 'LinkedIn', 'Pinterest', 'YouTube', 'TikTok', 'WhatsApp', 'Reddit', 'Tumblr', 'Flickr', 'Quora', 'Medium', 'Vimeo', 'Periscope', 'WeChat', 'LINE', 'Telegram', 'VKontakte (VK)'];
  onchangeSocial(value){
    selectedSocialMedia = value;
  }
  TextEditingController specificTec = TextEditingController();
  TextEditingController brandTec = TextEditingController();
  TextEditingController brandCommentTec = TextEditingController();
  TextEditingController brandWebSpeakTec = TextEditingController();
  TextEditingController WebSpeakCommentTec = TextEditingController();
  TextEditingController sentliTec = TextEditingController();
  TextEditingController SemanliTec = TextEditingController();
  TextEditingController AuthorsTec = TextEditingController();
  TextEditingController CategorizTec = TextEditingController();
  TextEditingController CategoriztypesTec = TextEditingController();
}

class Country {
  String name;
  List<String> regions;

  Country(this.name, this.regions);
}
/*
String selectedCountrys = 'United States';
  List countriess =['United States','Canada','United Kingdom'];
  List<Country> countries = [
    Country('United States', ['East Coast', 'West Coast', 'Midwest', 'South']),
    Country('Canada', ['Ontario', 'Quebec', 'Alberta', 'British Columbia']),
    Country('United Kingdom', ['England', 'Scotland', 'Wales', 'Northern Ireland']),
    // Add more countries and regions as needed
  ];
  String selectedRegion='East Coast';
  onChangeCountry(value){
      selectedCountrys = value;
    update();
  }
  onChangeregin(value){
    selectedRegion = value;
    update();
  }




 */