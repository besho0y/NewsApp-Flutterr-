abstract class Newsstate {}

class NewsInitialState extends Newsstate {}

class NewsBottomNavState extends Newsstate {}

class NewsChangeBottomNavState extends Newsstate {}

class NewsGetBusinessDataSuccessState extends Newsstate {}

class NewsGetBusinessDataErrorState extends Newsstate {
  late String error;

  NewsGetBusinessDataErrorState(this.error);
}

class NewsLoadingState extends Newsstate {}

class NewsGetSportsDataSuccessState extends Newsstate {}

class NewsGetSportsDataErrorState extends Newsstate {
  late String error;

  NewsGetSportsDataErrorState(this.error);
}

class NewsGetScienceDataSuccessState extends Newsstate {}

class NewsGetScienceDataErrorState extends Newsstate {
  late String error;

  NewsGetScienceDataErrorState(this.error);
}
