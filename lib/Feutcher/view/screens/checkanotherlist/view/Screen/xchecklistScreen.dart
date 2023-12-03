import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:term/Feutcher/view/screens/checkList/view/widgets/edtTextCreate.dart';
import 'package:term/Feutcher/view/screens/checkanotherlist/controller/xcheckListControlle.dart';
import 'package:term/Feutcher/view/screens/checkanotherlist/model/xcheckmodel/xcheckmodel.dart';
import 'package:term/Feutcher/view/screens/checkanotherlist/view/widgets/btn.dart';
import 'package:term/Feutcher/view/screens/checkanotherlist/view/widgets/dialog.dart';
import 'package:term/helper/colors/colors.dart';

import 'package:term/helper/contstant/scalesize.dart';

import '../../model/xcheckmodel/xcheckmodel.dart';

class XCheckListScreen extends StatelessWidget {
  const XCheckListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final mqData = MediaQuery.of(context);
    return GetBuilder<XCheckListController>(
      init: XCheckListController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
            centerTitle: false,
            title: Text(
              'Search',
              style: TextStyle(color: Colors.white),
              textScaleFactor: ScaleSize.textScaleFactor(context),
            ),
            actions: [
              Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Image.asset(
                    'assets/images/logoWO.webp',
                    width: width * 0.2,
                  )),

            ],
          ),
          body: ListView(
            children: [
              FutureBuilder(
                future: controller.GetSteper(),
                builder: (context,snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                          backgroundColor: Color(0xffD6D6D6),
                        ));
                  }
                  else if(snapshot.hasError){
                    return Column(
                      children: [
                      Text('oops ...' , textScaleFactor:
                      ScaleSize.textScaleFactor(context),
                      style: TextStyle(color: kSecandrycolor,fontSize: 35),
                      )  ,
                        Text('PAGE NOT FOUND' , textScaleFactor:
                      ScaleSize.textScaleFactor(context),
                      style: TextStyle(color: kSecandrycolor,fontSize: 35),
                      ),
                      ],
                    );
                  }else {
                    QuotationsModel quotationsModel = QuotationsModel();
                    quotationsModel = QuotationsModel.fromJson(snapshot.data);
                    return MediaQuery(
                      data: mqData.copyWith(
                          textScaleFactor: ScaleSize.textScaleFactor(context)),
                      child: Stepper(
                        type: StepperType.vertical,
                        currentStep: controller.currentStep,
                        onStepTapped: (index) {
                          controller.onStepTapped(index);
                        },
                        onStepContinue: () {
                          controller.onStepContinue(context);
                        },
                        onStepCancel: () {
                          controller.onStepCancel();
                        },
                        steps: quotationsModel.data!.map((stepData) {
                          return Step(
                              title: Text('${stepData.name}')
                              , content: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: stepData.list!.length,
                              itemBuilder: (context, index) {
                                // print(stepData.list![index].type);
                                if (stepData.list![index].type!.name ==
                                    'NORMAL') {
                                  if (stepData.list![index].quotationTitleId ==
                                      '3') {
                                    controller.Durationindex.add(0);
                                    return InkWell(
                                      onTap: () {
                                        // print('${stepData.list![index].id}');
                                        controller.Durationindex[index] == 0
                                            ? controller.setDurationindex(index)
                                            : controller.setDurationindexnull(
                                            index);
                                        controller.Durationindex[index] == 1
                                            ? controller.insertListDatato(
                                            id: stepData.list![index].id,
                                            value: '')
                                            : controller.removeitemListData(
                                          id: stepData.list![index].id,);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            color: controller
                                                .Durationindex[index] == 1
                                                ? Colors.orange
                                                : Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                                20)
                                        ),
                                        child: Text(
                                          '${stepData.list![index].title}',
                                          textScaleFactor:
                                          ScaleSize.textScaleFactor(
                                              context),),
                                      ),
                                    );
                                  } else
                                  if (stepData.list![index].quotationTitleId ==
                                      '2') {
                                    controller.keywordindex.add(0);
                                    return InkWell(
                                      onTap: () {
                                        // print('${stepData.list![index].id}');
                                        // controller.insertListDatato(id: stepData.list![index].id,value:'');
                                        controller.keywordindex[index] == 0
                                            ? controller.setkeywordindex(index)
                                            : controller.setkeywordindexnull(
                                            index);
                                        controller.keywordindex[index] == 1
                                            ? controller.insertListDatato(
                                            id: stepData.list![index].id,
                                            value: '')
                                            : controller.removeitemListData(
                                          id: stepData.list![index].id,);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            color: controller
                                                .keywordindex[index] == 1
                                                ? Colors.orange
                                                : Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                                20)
                                        ),
                                        child: Text(
                                          '${stepData.list![index].title}',
                                          textScaleFactor:
                                          ScaleSize.textScaleFactor(
                                              context),),
                                      ),
                                    );
                                  } else
                                  if (stepData.list![index].quotationTitleId ==
                                      '4') {
                                    controller.WorldWideindex.add(0);
                                    return InkWell(
                                      onTap: () {
                                        // print('${stepData.list![index].id}');
                                        // controller.insertListDatato(id: stepData.list![index].id,value:'');
                                        controller.WorldWideindex[index] == 0
                                            ? controller.setWorldWideindex(
                                            index)
                                            : controller.setWorldWideindexnull(
                                            index);
                                        controller.WorldWideindex[index] == 1
                                            ? controller.insertListDatato(
                                            id: stepData.list![index].id,
                                            value: '')
                                            : controller.removeitemListData(
                                            id: stepData.list![index].id);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            color: controller
                                                .WorldWideindex[index] == 1
                                                ? Colors.orange
                                                : Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                                20)
                                        ),
                                        child: Text(
                                          '${stepData.list![index].title}',
                                          textScaleFactor:
                                          ScaleSize.textScaleFactor(
                                              context),),
                                      ),
                                    );
                                  }
                                  else
                                  if (stepData.list![index].quotationTitleId ==
                                      '5') {
                                    controller.Sourcesindex.add(0);
                                    return InkWell(
                                      onTap: () {
                                        // print('${stepData.list![index].id}');
                                        // controller.insertListDatato(id: stepData.list![index].id,value:'');
                                        controller.Sourcesindex[index] == 0
                                            ? controller.setSourcesindex(index)
                                            : controller.setSourcesxnull(index);
                                        controller.Sourcesindex[index] == 1
                                            ? controller.insertListDatato(
                                            id: stepData.list![index].id,
                                            value: '')
                                            : controller.removeitemListData(
                                          id: stepData.list![index].id,);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            color: controller
                                                .Sourcesindex[index] == 1
                                                ? Colors.orange
                                                : Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                                20)
                                        ),
                                        child: Text(
                                          '${stepData.list![index].title}',
                                          textScaleFactor:
                                          ScaleSize.textScaleFactor(
                                              context),),
                                      ),
                                    );
                                  } else
                                  if (stepData.list![index].quotationTitleId ==
                                      '10') {
                                    controller.Intervalindex.add(0);
                                    return InkWell(
                                      onTap: () {
                                        print('${stepData.list![index].id}');
                                        // controller.insertListDatato(id: stepData.list![index].id,value:'');
                                        controller.Intervalindex[index] == 0
                                            ? controller.setIntervalindex(index)
                                            : controller.setIntervalxnull(
                                            index);
                                        controller.Intervalindex[index] == 1
                                            ? controller.insertListDatato(
                                            id: stepData.list![index].id,
                                            value: '')
                                            : controller.removeitemListData(
                                            id: stepData.list![index].id);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            color: controller
                                                .Intervalindex[index] == 1
                                                ? Colors.orange
                                                : Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                                20)
                                        ),
                                        child: Text(
                                          '${stepData.list![index].title}',
                                          textScaleFactor:
                                          ScaleSize.textScaleFactor(
                                              context),),
                                      ),
                                    );
                                  }
                                  else
                                  if (stepData.list![index].quotationTitleId ==
                                      '11') {
                                    controller.Socialindex.add(0);
                                    return InkWell(
                                      onTap: () {
                                        print('${stepData.list![index].id}');
                                        // controller.insertListDatato(id: stepData.list![index].id,value:'');
                                        controller.Socialindex[index] == 0
                                            ? controller.setSocialindex(index)
                                            : controller.setSocialxnull(index);
                                        controller.Socialindex[index] == 1
                                            ? controller.insertListDatato(
                                            id: stepData.list![index].id,
                                            value: '')
                                            : controller.removeitemListData(
                                          id: stepData.list![index].id,);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            color: controller
                                                .Socialindex[index] == 1
                                                ? Colors.orange
                                                : Colors.grey.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                                20)
                                        ),
                                        child: Text(
                                          '${stepData.list![index].title}',
                                          textScaleFactor:
                                          ScaleSize.textScaleFactor(
                                              context),),
                                      ),
                                    );
                                  }

                                  ///

                                }
                                else if (stepData.list![index].type!.name
                                    .toLowerCase() == 'region') {
                                  return Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                          child: Text(
                                            '${stepData.list![index].title}',
                                            textScaleFactor:
                                            ScaleSize.textScaleFactor(
                                                context),),
                                        ),
                                        controller.countryid == '' ? Text(
                                          'Please select a country first',
                                          textScaleFactor:
                                          ScaleSize.textScaleFactor(
                                              context),
                                        ) : FutureBuilder(future: controller.GetCity(), builder: (context,snapshot){
                                          if(snapshot.connectionState== ConnectionState.waiting){
                                            return LinearProgressIndicator();
                                          }else{
                                          return  DropdownButton(
                                              isExpanded: true,
                                              value: controller.cityname,
                                              onChanged: (value) {
                                                controller.onChangeCityvalue(value:value , id: stepData.list![index].id);
                                              },
                                              items: controller.citynamelist.map(
                                                      (language) {
                                                    return DropdownMenuItem(
                                                      value: language,
                                                      child: Text(
                                                        language,
                                                        textScaleFactor:
                                                        ScaleSize.textScaleFactor(
                                                            context),
                                                      ),
                                                    );
                                                  }).toList(),
                                            );
                                          }
                                        })
                                      ],
                                    ),
                                  );
                                }
                                else if (stepData.list![index].type!.name ==
                                    'YEARS') {
                                  return Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(value: controller.isyearSelect, onChanged: (value){controller.onChageSelectYear(value);}),
                                            Container(
                                              child: Text(
                                                '${stepData.list![index].title}',
                                                textScaleFactor:
                                                ScaleSize.textScaleFactor(
                                                    context),),
                                            ),
                                          ],
                                        ),
                                        controller.isyearSelect?DropdownButton<int>(
                                          isExpanded: true,
                                          value: controller.selectedYear,
                                          onChanged: (value) {
                                            controller.onchangeyear(value: value, id: stepData.list![index].id);
                                          },
                                          items: List.generate(9, (index) {
                                            return DropdownMenuItem<int>(
                                              value: index + 2,
                                              // Start from year 2
                                              child: Text(
                                                '${index + 2} Year',
                                                textScaleFactor:
                                                ScaleSize.textScaleFactor(
                                                    context),
                                              ),
                                            );
                                          }),
                                        ):Container(),
                                      ],
                                    ),
                                  );
                                } else if (stepData.list![index].type!.name ==
                                    'COUNTRY') {
                                  return Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                          child: Text(
                                            '${stepData.list![index].title}',
                                            textScaleFactor:
                                            ScaleSize.textScaleFactor(
                                                context),),
                                        ),
                                        FutureBuilder(future: controller.GetCountry(),
                                            builder: (context, snapshot) {
                                              if(snapshot.connectionState==ConnectionState.waiting){
                                                return LinearProgressIndicator(color: kSecandrycolor,);
                                              }
                                              else{
                                              return DropdownButton(
                                              icon: Icon(Icons.keyboard_arrow_down_outlined,color:kSecandrycolor,size: 30,),
                                              isExpanded: true,
                                              value: controller.countryname,
                                              onChanged: (value) {
                                              controller.onChangecountryname(value:value,id:stepData.list![index].id);
                                              },
                                              items: controller.Countrynamelist.map(
                                              (language) {
                                              return DropdownMenuItem(
                                              value: language,
                                              child: Text(
                                              language,
                                              textScaleFactor:
                                              ScaleSize.textScaleFactor(
                                              context),
                                              ),
                                              );
                                              }).toList(),
                                              );
                                              }
                                            }),
                                      ],
                                    ),
                                  );
                                } else if (stepData.list![index].type!.name
                                    .toLowerCase() == 'dropdown_menu') {
                                  if (stepData.list![index].title ==
                                      'Social Media') {
                                    return Container(
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Container(
                                            child: Text('${stepData.list![index]
                                                .title}', textScaleFactor:
                                            ScaleSize.textScaleFactor(
                                                context),),
                                          ),
                                          DropdownButton<String>(
                                            isExpanded: true,
                                            value: controller
                                                .selectedSocialMedia,
                                            onChanged: (String? value) {
                                              controller.onchangeSocial(value: value, id:stepData.list![index].id);
                                            },
                                            items: controller.socialMediaOptions
                                                .map<DropdownMenuItem<String>>((
                                                String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value, textScaleFactor:
                                                ScaleSize.textScaleFactor(
                                                    context),),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Container(
                                            child: Text('${stepData.list![index]
                                                .title}', textScaleFactor:
                                            ScaleSize.textScaleFactor(
                                                context),),
                                          ),

                                          DropdownButton<String>(
                                            isExpanded: true,
                                            value: controller.selectedLanguage,
                                            onChanged: (value) {
                                              controller.onchangeLanguagh(id:stepData.list![index].id,
                                                  value:value);
                                            },
                                            items: controller.spokenLanguages
                                                .map((String language) {
                                              return DropdownMenuItem<String>(
                                                value: language,
                                                child: Text(
                                                  language,
                                                  textScaleFactor:
                                                  ScaleSize.textScaleFactor(
                                                      context),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                } else if (stepData.list![index].type!.name
                                    .toLowerCase() == 'text') {
                                  if (stepData.list![index].quotationTitleId ==
                                      '7') {
                                    controller.Typetecs.add(
                                        TextEditingController());
                                    return Container(
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            child: InkWell(
                                              onTap: () {
                                                print(controller.Typetecs[index]
                                                    .text);
                                              },
                                              child: Text('${stepData
                                                  .list![index].title}',
                                                textScaleFactor:
                                                ScaleSize.textScaleFactor(
                                                    context),),
                                            ),
                                          ),
                                          EdtTxtChecklist(
                                            hintText: 'description',
                                            tec: controller.Typetecs[index],
                                            onsupmiting: (value){
                                              print(value);
                                              controller.onEditingComplete(id:stepData.list![index].id,value:controller.Typetecs[index].text.toString());
                                            },
                                          )

                                        ],
                                      ),
                                    );
                                  } else
                                  if (stepData.list![index].quotationTitleId ==
                                      '8') {
                                    controller.Analytecs.add(
                                        TextEditingController());
                                    return Container(
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            child: InkWell(
                                              onTap: () {
                                                print(
                                                    controller.Analytecs[index]
                                                        .text);
                                              },
                                              child: Text(
                                                '${stepData.list![index]
                                                    .title}', textScaleFactor:
                                              ScaleSize.textScaleFactor(
                                                  context),),
                                            ),
                                          ),
                                          EdtTxtChecklist(
                                            hintText: 'description',
                                            tec: controller.Analytecs[index],
                                            onsupmiting: (value){
                                              print(value);
                                              controller.onEditingComplete(id:stepData.list![index].id,value:controller.Analytecs[index].text.toString());
                                              },
                                          )

                                        ],
                                      ),
                                    );
                                  }
                                  else
                                  if (stepData.list![index].quotationTitleId ==
                                      '9') {
                                    controller.Reportecs.add(
                                        TextEditingController());
                                    return Container(
                                      margin: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            child: InkWell(
                                              onTap: () {
                                                print(
                                                    controller.Reportecs[index]
                                                        .text);
                                              },
                                              child: Text(
                                                '${stepData.list![index]
                                                    .title}', textScaleFactor:
                                              ScaleSize.textScaleFactor(
                                                  context),),
                                            ),
                                          ),
                                          EdtTxtChecklist(
                                            hintText: 'description',
                                            tec: controller.Reportecs[index],
                                            onsupmiting: (value){

                                              controller.onEditingComplete(id:stepData.list![index].id,value:controller.Reportecs[index].text.toString());

                                            },
                                          )

                                        ],
                                      ),
                                    );
                                  }
                                } else {
                                  return Text(stepData.list![index].type!.name);
                                }
                              }));
                        }).toList(),
                        physics: NeverScrollableScrollPhysics(),
                      ),
                    );
                  }
                }
              ),
             controller.IsSubmit? FocusScope(
               node: controller.focusScopeNode,
               child: Container(
                 color:Colors.white,
                 child: Column(
                   children: [
                     Container(
                         margin: EdgeInsets.all(10),
                         child: EdtTxtChecklist(hintText: 'Name',tec: controller.nametec,)),
                     Container(
                         margin: EdgeInsets.all(10),
                         child: EdtTxtChecklist(hintText: 'Email',tec: controller.emailtec,)),
                     Container(
                         margin: EdgeInsets.all(10),
                         child: EdtTxtChecklist(hintText: 'phone',tec: controller.phonetec,)),
                     BTNSupmit(txt: 'Submit', onPressed:(){
                       showDialog(context: context, builder: (context){
                         return MyDialog(
                           onpressed: (){
                             controller.BtnSubmit(context);
                           },
                         );
                       });

                     }),
                   ],
                 ),
               ),
             ):Container(),


            ],
          ),
        );
      }
    );
  }
}

/*
Row(
                            children: [
                              Checkbox(value:controller.checkBoxValues[index] , onChanged: (value){
                                controller.toggleCheckbox(index);
                              }),
                              Text(
                                '${stepData.list![index].title}',
                                textScaleFactor:
                                ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          )
 */