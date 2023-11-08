class ProficienciesModel{
  List ?data;
  ProficienciesModel({this.data});
}
List<ProficienciesModel> proficienciesList = [
  ProficienciesModel(data:daylyList,),
  ProficienciesModel(data:influnceList,),
  ProficienciesModel(data:sourceList,),
];
class  DataList{
  String ?title;
  String ?description;
  DataList({
    this.title,
    this.description
});
}
List <DataList> daylyList=[
  DataList(
    title: 'Daily publications',
    description: 'Creation of daily posts to improve online presence'
  ),
  DataList(
      title: 'Mobilization',
      description: 'An army of ingeneers capable of making any post go viral and gain notoriety.'
  )
];
List <DataList> influnceList=[
  DataList(
      title: 'Influence Analysis',
      description: 'Daily state update on the image perception and new supporters contacted. Public opinion influence Launch of new publications, commentaries via our team to reach the largest possible audience'
  ),
  DataList(
      title: 'Methods of Profiling',
      description: 'The features of Target Profiling make it possible for end users to collect a broad variety of data in order to develop a detailed profile of the target.'
  )
];
List <DataList> sourceList=[
  DataList(
      title: 'Source localisation',
      description: 'The identification of the source of a particular piece of information or data. Identify social media profiles and online communities that pertain to the user’s specific fields of interest, including Facebook user accounts, pages, groups, events, as well as Twitter user accounts.'
  ),

];
