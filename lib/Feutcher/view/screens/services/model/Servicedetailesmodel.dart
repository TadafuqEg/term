class ServiceDetailesModel {
  int id;
  String name;
  String title;
  String description;
  String imgsrc;

  ServiceDetailesModel(
      {required this.id,
      required this.title,
      required this.name,
      required this.description,
      required this.imgsrc});
}

List<ServiceDetailesModel> ServDetList = [
  ServiceDetailesModel(
      id: 1,
      name: 'Framework',
      title: 'Big Data Processing',
      description:
          'The utilization of a collection of methodologies or programming paradigms for the purpose of accessing extensive datasets in order to extract valuable insights that can aid in decision-making and assistance.',
      imgsrc: 'assets/images/frameworkback.webp'),
  ServiceDetailesModel(
      id: 2,
      name: 'Learn',
      title: 'Statistics',
      description:
          'The process of gathering and examining a substantial amount of numerical data, particularly with the aim of deducing proportions in a population based on those seen in a representative sample.',
      imgsrc: 'assets/images/learnback.webp'),
  ServiceDetailesModel(
      id: 3,
      name: 'Visualize',
      title: 'TRY TO DETERMINE Monitoring and Statistical Analysis',
      description:
          '1- The process of monitoring and analysis is a crucial aspect of academic research and data analysis. It involves the systematic observation and examination of data, information, or phenomena to gain sights.\n\n2- The service places emphasis on a diverse variety of characteristics including extensive data collecting, advanced monitoring capabilities, sentiment analysis, data organization, data prioritization, identification of emerging trends, and detection of critical situations.',
      imgsrc: 'assets/images/Visualizeback.webp'),
  ServiceDetailesModel(
      id: 4,
      name: 'Dive',
      title: 'Market Research and Audience Insights',
      description:
          'Market research is a process that involves the collection of data pertaining to whole markets. On the other hand, consumer insights research aims to evaluate this data in order to derive actionable findings that are specifically applicable to a particular brand. The utilization of data-driven conclusions eliminates uncertainty in corporate decision-making processes, enabling businesses to more effectively fulfill the demands of their consumers.',
      imgsrc: 'assets/images/diveback.webp'),
  ServiceDetailesModel(
      id: 5,
      name: 'DIVE MORE',
      title: 'Marketing Reporting and Data Analysis',
      description:
          'The process of collecting and evaluating marketing data is undertaken in order to guide subsequent marketing choices, strategies, and performance evaluations. Marketing reports provide valuable and practical data that enable individuals to derive significant insights and achieve overarching objectives within a firm.',
      imgsrc: 'assets/images/divemoreback.webp'),
  ServiceDetailesModel(
      id: 6,
      name: 'THINK',
      title: 'Strategic Tactical Support',
      description:
          '1- The provision of strategic support is a crucial component in achieving organizational objectives and maintaining a competitive advantage in today›s dynamic business environment.\n\n2- The primary objective of the service is to assist our customers in making informed choices and implementing necessary modifications that contribute to the attainment of commercial success and the realization of their objectives and objectives.',
      imgsrc: 'assets/images/thinkback.webp'),
  ServiceDetailesModel(
      id: 7,
      name: 'TINK MORE',
      title: 'New Market Activation Strategy',
      description:
          'Marketing activation is the execution of campaigns, events, and experiences that generate awareness of your brand. Donewell, marketing activation resonates with your audience. The activation process focuses on enhancing the path to purchase for customers, often through an interactive experience.',
      imgsrc: 'assets/images/thinkmoreback.webp'),
  ServiceDetailesModel(
      id: 8,
      name: 'ACT',
      title: 'SOCIAL INNOVATION',
      description:
          'The service facilitates large-scale online social activities. The platform facilitates the execution of extensive online social initiatives, therefore enabling the development and restoration of one›s ability to exert influence and enhance the quality of one›s reputation.',
      imgsrc: 'assets/images/actback.webp'),
  ServiceDetailesModel(
      id: 9,
      name: 'ACT MORE',
      title: 'Demand Generation',
      description:
          'The concept of demand generation refers to the strategic process of creating and stimulating interest, desire, and demand for a certain product or service\n\nDemand generation refers to the systematic approach of enhancing awareness and stimulating interest in a certain product or service. The objective is to broaden the scope of your target audience, establish expertise and credibility, and stimulate interest in your brand, ultimately leading to the acquisition of valuable and high-caliber leads.',
      imgsrc: 'assets/images/actmoreback.webp'),
  ServiceDetailesModel(
      id: 10,
      name: 'ACT MORE AND MORE',
      title: 'Lead Generation and Nurturing',
      description:
          'Lead generation helps you fill your funnel with quality prospects, while lead nurturing helps you convert them into loyal customers. Without lead generation, you won›t have enough leads to nurture, and without lead nurturing, you›ll lose leads to your competitors or to inaction.',
      imgsrc: 'assets/images/actmoreandmore.webp'),
];
