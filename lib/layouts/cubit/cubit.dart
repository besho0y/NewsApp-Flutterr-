import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layouts/cubit/state.dart';
import 'package:newsapp/moduls/business/businessScreen.dart';
import 'package:newsapp/moduls/sceince/sceinceScreen.dart';
import 'package:newsapp/moduls/settings/settingsScreen.dart';
import 'package:newsapp/moduls/sports/sportsScreen.dart';
import 'package:newsapp/network/remote/diohelper.dart';
import 'package:newsapp/shared/constants.dart';

class NewsCubit extends Cubit<Newsstate> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    Businessscreen(),
    Sportscreen(),
    Sceincescreen(),
    Settingsscreen()
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  List business = [];

 void getBusinessData() {
    emit(NewsLoadingState());
    Diohelper.getdata(url: url, query: {
      "country": "us",
      "category": "business",
      "apikey": apikey
    }).then((value) {
      business = value.data["articles"];
      emit(NewsGetBusinessDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(NewsGetBusinessDataErrorState(error.toString()));
    });
  }

  List sports = [];

  void getsportsdata() {
    Diohelper.getdata(
            url: url,
            query: {"country": "us", "category": "sports", "apikey": apikey})
        .then((value) {
      sports = value.data["articles"];
      emit(NewsGetSportsDataSuccessState());
    }).catchError((error) {
      debugPrint(error);
      emit(NewsGetSportsDataErrorState(error.toString()));
    });
  }

  List science = [];

  void getsciencedata() {
    Diohelper.getdata(url: url, query: {
      "country": "us",
      "category": "science",
      "apikey": apikey
    }).then((value) {
      science = value.data["articles"];
      emit(NewsGetScienceDataSuccessState());
    }).catchError((error) {
      debugPrint(error);
      emit(NewsGetScienceDataErrorState(error.toString()));
    });
  }
}
