import 'package:flutter/material.dart';

class AboutModel{
  int id;
  String ? title;
  String description;
  AboutModel({required this.id,this.title,required this.description});
}
List<AboutModel> aboutList= [
  AboutModel(
      id: 1,
      title: "Tadafuq Information Technology and Elka",
      description: "Join Forces to Create a New Era"),
  AboutModel(id: 2,title: null,description: "Within the dynamic and ever-changing realm of the technology sector, organizations constantly strive to discover novel approaches in order to maintain their competitiveness and foster expansion."),
  AboutModel(id: 3,title: null,description: "In a crucial and noteworthy development, Tadafuq Information Technology (TIT) and Elka, two important entities within the technology sector, have recently engaged in a merger agreement, therefore combining their respective operations. The primary objective of this significant deal was to capitalize on the potential benefits of combining complementary elements, consolidating assets, and establishing a novel company positioned to have substantial influence in the dynamic field of technology."),
];