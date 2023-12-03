import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:term/Feutcher/view/screens/checkList/controller/checklistcontroller.dart';
import 'package:term/Feutcher/view/screens/checkList/model/conteymodel.dart';
import 'package:term/Feutcher/view/screens/checkList/view/widgets/edtTextCreate.dart';
import 'package:term/helper/contstant/scalesize.dart';

class CheckListScreen extends StatelessWidget {
  const CheckListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final mqData = MediaQuery.of(context);

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
              ))
        ],
      ),
      body: GetBuilder<CheckListController>(
          init: CheckListController(),
          builder: (controller) {
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
                  controller.onStepContinue();
                },
                onStepCancel: () {
                  controller.onStepCancel();
                },
                steps: [
                  Step(
                      isActive: controller.currentStep >= 0,
                      title: Text(
                        'Keywords',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                      content: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.iskeyword1,
                                  onChanged: (value) {
                                    controller.onChangekeyword1(value);
                                  }),
                              Text(
                                'Keyword Engineering /restructioning',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.iskeyword2,
                                  onChanged: (value) {
                                    controller.onChangekeyword2(value);
                                  }),
                              Text(
                                '1-5',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.iskeyword3,
                                  onChanged: (value) {
                                    controller.onChangekeyword3(value);
                                  }),
                              Text(
                                '6-10',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.iskeyword4,
                                  onChanged: (value) {
                                    controller.onChangekeyword4(value);
                                  }),
                              Text(
                                '10+',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Step(
                      isActive: controller.currentStep >= 1,
                      title: Text(
                        'Duration',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                      content: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isduration1,
                                  onChanged: (value) {
                                    controller.onChanduration1(value);
                                  }),
                              Text(
                                '1 day',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isduration2,
                                  onChanged: (value) {
                                    controller.onChanduration2(value);
                                  }),
                              Text(
                                '1 week',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isduration3,
                                  onChanged: (value) {
                                    controller.onChanduration3(value);
                                  }),
                              Text(
                                '1 month',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isduration4,
                                  onChanged: (value) {
                                    controller.onChanduration4(value);
                                  }),
                              Text(
                                '3 months',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isduration5,
                                  onChanged: (value) {
                                    controller.onChanduration5(value);
                                  }),
                              Text(
                                '6 months',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isduration6,
                                  onChanged: (value) {
                                    controller.onChanduration6(value);
                                  }),
                              Text(
                                '1 year',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isduration7,
                                      onChanged: (value) {
                                        controller.onChanduration7(value);
                                      }),
                                  Text(
                                    'more',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isduration7
                                  ? DropdownButton<int>(
                                      value: controller.selectedYear,
                                      onChanged: (value) {
                                        controller.onchangeyear(value);
                                      },
                                      items: List.generate(9, (index) {
                                        return DropdownMenuItem<int>(
                                          value: index + 2, // Start from year 2
                                          child: Text(
                                            '${index + 2} Year',
                                            textScaleFactor:
                                                ScaleSize.textScaleFactor(
                                                    context),
                                          ),
                                        );
                                      }),
                                    )
                                  : Container()
                            ],
                          ),
                        ],
                      )),
                  Step(
                      isActive: controller.currentStep >= 2,
                      title: Text(
                        'Geolocation',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                      content: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isgelocation1,
                                      onChanged: (value) {
                                        controller.onChangelocation1(value);
                                      }),
                                  Text(
                                    'Country',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isgelocation1
                                  ? DropdownButton(
                                      value: controller.countryname,
                                      onChanged: (value) {
                                        controller.onChangecountryname(value);
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
                                    )
                                  : Container(),
                              /*
                              DropdownButton<String>(
                                      value: controller.selectedCountryName,
                                      onChanged: (newValue) {
                                        controller.onChangeCountry(newValue!);
                                      },
                                      items: controller.countries
                                          .map((Country country) {
                                        return DropdownMenuItem<String>(
                                          value: country.name,
                                          child: Text(
                                            country.name,
                                            textScaleFactor:
                                                ScaleSize.textScaleFactor(
                                                    context),
                                          ),
                                        );
                                      }).toList(),
                                    )
                                 */
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isgelocation2,
                                      onChanged: (value) {
                                        controller.onChangelocation2(value);
                                      }),
                                  Text(
                                    'Region',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isgelocation2
                                  ? controller.countryid == ''?Text(
                                'Please select a country first',
                                textScaleFactor:
                                ScaleSize.textScaleFactor(
                                    context),
                              ): DropdownButton(
                                value: controller.cityname,
                                onChanged: (value) {
                                  controller.onChangeCityvalue(value);
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
                              ):Container()

                              /*
                              controller.selectedCountry == null
                                      ? Text(
                                          'Please select a country first',
                                          textScaleFactor:
                                              ScaleSize.textScaleFactor(
                                                  context),
                                        )
                                      :
                              Column(
                                          children: [
                                            DropdownButton<String>(
                                              value: controller.selectedRegion,
                                              onChanged: (newValue) {
                                                controller
                                                    .onChangeregin(newValue);
                                              },
                                              items: controller
                                                  .selectedCountry.regions
                                                  .map((String region) {
                                                return DropdownMenuItem<String>(
                                                  value: region,
                                                  child: Text(
                                                    region,
                                                    textScaleFactor: ScaleSize
                                                        .textScaleFactor(
                                                            context),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                            SizedBox(height: 20.0),
                                          ],
                                        )
                                  : Container()
                              */
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isgelocation3,
                                  onChanged: (value) {
                                    controller.onChangelocation3(value);
                                  }),
                              Text(
                                'WorldWide',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Step(
                      isActive: controller.currentStep >= 3,
                      title: Text(
                        'Sources',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                      content: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isSources1,
                                      onChanged: (value) {
                                        controller.onChanSources1(value);
                                      }),
                                  Text(
                                    'Social Media',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isSources1?DropdownButton<String>(
                    isExpanded: true,
                    value: controller.selectedSocialMedia,
                    onChanged: (String? value) {
                      controller.onchangeSocial(value);
                    },
                    items: controller.socialMediaOptions.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,textScaleFactor:
                        ScaleSize.textScaleFactor(context),),
                      );
                    }).toList(),
                  ):Container()
                    ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isSources2,
                                  onChanged: (value) {
                                    controller.onChanSources2(value);
                                  }),
                              Text(
                                'WEB',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isSources3,
                                      onChanged: (value) {
                                        controller.onChanSources3(value);
                                      }),
                                  Text(
                                    'Specific Sources',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isSources3?EdtTxtChecklist(
                                hintText: 'URL',
                                tec: controller.specificTec
                              ):Container()
                            ],
                          ),
                        ],
                      )),
                  Step(
                      isActive: controller.currentStep >= 4,
                      title: Text(
                        'Languages',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                      content: Column(
                        children: [
                          DropdownButton<String>(
                            isExpanded: true,
                            value: controller.selectedLanguage,
                            onChanged: (value) {
                              controller.onchangeLanguagh(value);
                            },
                            items: controller.spokenLanguages
                                .map((String language) {
                              return DropdownMenuItem<String>(
                                value: language,
                                child: Text(
                                  language,
                                  textScaleFactor:
                                      ScaleSize.textScaleFactor(context),
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      )),
                  Step(
                      isActive: controller.currentStep >= 5,
                      title: Text(
                        'Type of Data:',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                      content: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.istypedata1,
                                      onChanged: (value) {
                                        controller.onChanistypedata1(value);
                                      }),
                                  Text(
                                    'Brand speaking',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.istypedata1?EdtTxtChecklist(
                                hintText: 'description',
                                tec: controller.brandTec,
                              ):Container()
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.istypedata2,
                                      onChanged: (value) {
                                        controller.onChanistypedata2(value);
                                      }),
                                  Text(
                                    'Brand speaking + Comment',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.istypedata2?EdtTxtChecklist(
                                hintText: 'description',
                                tec: controller.brandCommentTec,
                              ):Container()
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.istypedata3,
                                      onChanged: (value) {
                                        controller.onChanistypedata3(value);
                                      }),
                                  Text(
                                    'Brand & Web speaking',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.istypedata3?EdtTxtChecklist(
                                hintText: 'description',
                                tec: controller.brandCommentTec,
                              ):Container()
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.istypedata4,
                                      onChanged: (value) {
                                        controller.onChanistypedata4(value);
                                      }),
                                  Text(
                                    'Web speaking + Comments',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.istypedata4?EdtTxtChecklist(
                                hintText: 'description',
                                tec: controller.WebSpeakCommentTec,
                              ):Container()
                            ],

                          ),
                        ],
                      )),
                  Step(
                      isActive: controller.currentStep >= 6,
                      title: Text(
                        'Analysis',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                      content: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isAnalysis1,
                                      onChanged: (value) {
                                        controller.onChanAnalysis1(value);
                                      }),
                                  Text(
                                    'Sentiment Analysis',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isAnalysis1? EdtTxtChecklist(hintText: 'description',tec: controller.sentliTec,):Container()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isAnalysis2,
                                      onChanged: (value) {
                                        controller.onChanAnalysis2(value);
                                      }),
                                  Text(
                                    'Semantic Analysis',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isAnalysis2? EdtTxtChecklist(
                                hintText: 'description',
                                tec: controller.SemanliTec,
                              ):Container()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isAnalysis3,
                                      onChanged: (value) {
                                        controller.onChanAnalysis3(value);
                                      }),
                                  Text(
                                    'Authors / Influence Analysis',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isAnalysis3? EdtTxtChecklist(
                                hintText: 'description',
                                tec: controller.AuthorsTec,
                              ):Container()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isAnalysis4,
                                      onChanged: (value) {
                                        controller.onChanAnalysis4(value);
                                      }),
                                  Text(
                                    'Categorization by themes',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isAnalysis4?EdtTxtChecklist(
                                hintText: 'description',
                                tec: controller.CategorizTec,
                              ):Container()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isAnalysis5,
                                      onChanged: (value) {
                                        controller.onChanAnalysis5(value);
                                      }),
                                  Text(
                                    'Categorization by types ',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isAnalysis5 ?EdtTxtChecklist(
                                hintText: 'description',
                                tec: controller.CategoriztypesTec,
                              ):Container()
                            ],
                          ),
                        ],
                      )),
                  Step(
                      isActive: controller.currentStep >= 7,
                      title: Text(
                        'Reports',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                      content: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isReports1,
                                      onChanged: (value) {
                                        controller.onChanReports1(value);
                                      }),
                                  Text(
                                    'Real time alerts',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isReports1? EdtTxtChecklist(
                                hintText: 'description',
                              ):Container()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isReports2,
                                      onChanged: (value) {
                                        controller.onChanReports2(value);
                                      }),
                                  Text(
                                    'Automatic Report',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isReports2? EdtTxtChecklist(
                                hintText: 'description',
                              ):Container()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isReports3,
                                      onChanged: (value) {
                                        controller.onChanReports3(value);
                                      }),
                                  Text(
                                    'Personalised Report',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isReports3? EdtTxtChecklist(
                                hintText: 'description',
                              ):Container()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isReports4,
                                      onChanged: (value) {
                                        controller.onChanReports4(value);
                                      }),
                                  Text(
                                    'Personalised Comparative report ',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isReports4? EdtTxtChecklist(
                                hintText: 'description',
                              ):Container()
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: controller.isReports5,
                                      onChanged: (value) {
                                        controller.onChanReports5(value);
                                      }),
                                  Text(
                                    'Consulting review',
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                              controller.isReports5? EdtTxtChecklist(
                                hintText: 'description',
                              ):Container()
                            ],
                          ),
                        ],
                      )),
                  Step(
                      isActive: controller.currentStep >= 8,
                      title: Text(
                        'Interval/ frequency:',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                      content: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isInterval1,
                                  onChanged: (value) {
                                    controller.onChanInterval1(value);
                                  }),
                              Text(
                                'one shot report.',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isInterval2,
                                  onChanged: (value) {
                                    controller.onChanInterval2(value);
                                  }),
                              Text(
                                'weekly reports',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isInterval3,
                                  onChanged: (value) {
                                    controller.onChanInterval3(value);
                                  }),
                              Text(
                                'Every two weeks',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isInterval4,
                                  onChanged: (value) {
                                    controller.onChanInterval4(value);
                                  }),
                              Text(
                                'Monthly',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: controller.isInterval5,
                                  onChanged: (value) {
                                    controller.onChanInterval5(value);
                                  }),
                              Text(
                                'Quarterly',
                                textScaleFactor:
                                    ScaleSize.textScaleFactor(context),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Step(
                      isActive: controller.currentStep >= 9,
                      title: Text(
                        'Social Engineering:',
                        textScaleFactor: ScaleSize.textScaleFactor(context),
                      ),
                      content: Column(
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: controller.isSocial,
                                          onChanged: (value) {
                                            controller.onChanSocial(value);
                                          }),
                                      Text(
                                        'on demand',
                                        textScaleFactor:
                                            ScaleSize.textScaleFactor(context),
                                      ),
                                    ],
                                  ),
                                  controller.isSocial?IconButton(onPressed: (){
                                    Get.toNamed('/contactus');
                                  }, icon: Icon(Icons.quick_contacts_dialer)):Container()
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            );
          }),
    );
  }
}
