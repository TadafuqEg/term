class ServiceModel{
  int ? id;
  String? title;
  List ?btn;
  ServiceModel({
    this.title,
    this.id,
    this.btn
});
}
 List<ServiceModel> serviceList =[
   ServiceModel(
     id: 1,
     title: 'Framework\nfor Action',
     btn: btnFrameWorkList
   ),
   ServiceModel(
     id: 2,
     title: 'Delving Deeper\ninto Action',
     btn: btnDelvingList
   ),ServiceModel(
     id: 3  ,
     title: 'Taking Action\nand Amplifying\nResults',
     btn: btnActList
   )
 ];

class Btn{
  int ?id;
  String ? btnTxt;
  String ? btnRoute;
  Btn({
   this.btnTxt,
   this.btnRoute,
    this.id
});
}
List<Btn> btnFrameWorkList=[
 Btn(
   id: 1,
   btnTxt: 'Framework',
   btnRoute: '/framwork'
 ),
  Btn(
    id: 2,
   btnTxt: 'Learn',
   btnRoute: '/learn'
 ),
  Btn(
    id: 3,
   btnTxt: 'Visuale',
   btnRoute: '/visuale'
 ),
];
List<Btn> btnDelvingList=[
 Btn(
   id: 4,
   btnTxt: 'Dive',
   btnRoute: '/dive'
 ),
  Btn(
    id: 5,
   btnTxt: 'Dive More',
   btnRoute: '/divemore'
 ),
  Btn(
    id: 6,
   btnTxt: 'Think',
   btnRoute: '/think'
 ),
  Btn(
    id: 7,
   btnTxt: 'Think More',
   btnRoute: '/thinkmore'
 ),
];
List<Btn> btnActList=[
  Btn(
    id: 8,
      btnTxt: 'Act',
      btnRoute: '/act'
  ),
  Btn(
    id: 9,
      btnTxt: 'Act More',
      btnRoute: '/actmore'
  ),
  Btn(
    id: 10,
      btnTxt: 'Act More and more',
      btnRoute: '/visuale'
  ),
];
