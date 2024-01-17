import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Network/local/cachHelper.dart';
import 'package:news_app/Network/remote/dio_helper.dart';
import 'package:news_app/layouts/cubit/statecubit.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/settings/settings.dart';
import 'package:news_app/modules/sports/sport.dart';
import '../../modules/science/science.dart';

class NewsCubit extends Cubit<Newsstates>{
  NewsCubit() :super (initial());
  static NewsCubit get(context) => BlocProvider.of(context);
   int currentIndex =0 ;
   List<BottomNavigationBarItem>bottomitems=
       [
         BottomNavigationBarItem(icon: Icon(Icons.business),label: 'business'),
         BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'sports'),
         BottomNavigationBarItem(icon: Icon(Icons.science),label: 'science'),


       ];
   List<Widget> screens=[businessScreen(),sportScreen(),scienceScreen()];

   void Change(index){
     currentIndex=index ;
     emit(bottom());
   }
   List <dynamic> business =[];


  void getBusiness(){
     emit(NewsLoadingState());
     DioHelper.getData(
         url: 'v2/top-headlines',
         query: {'country':'eg','category':'business','apiKey':'ebb4a234192c46809c727f69d15eba47'}
     ).then((value)
     {
       business=value.data['articles'];
       print(business[0]['title']);
       emit(NewsgetBusinessSuccesState());

     }).catchError((onError){
       print(onError.toString());
       emit(NewsgetBusinessErrorState(onError.toString()));

     });
   }

  List <dynamic> sports =[];
  void getsports(){
    emit(NewsLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {'country':'eg','category':'sports','apiKey':'ebb4a234192c46809c727f69d15eba47'}
    ).then((value)
    {
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit(NewsgetsportsSuccesState());

    }).catchError((onError){
      print(onError.toString());
      emit(NewsgetsportsErrorState(onError.toString()));

    });
  }

  List <dynamic> science =[];
  void getscience(){
    emit(NewsLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {'country':'eg','category':'science','apiKey':'ebb4a234192c46809c727f69d15eba47'}
    ).then((value)
    {
      science=value.data['articles'];
      print(science[0]['title']);
      emit(NewsgetscienceSuccesState());

    }).catchError((onError){
      print(onError.toString());
      emit(NewsgetscienceErrorState(onError.toString()));

    });
  }

  bool isdark =false ;
  ThemeMode hh=ThemeMode.light;
  void Changemode({ bool? fromShared}){
    if(fromShared!=null)
      isdark=fromShared ;
    else{
      isdark=!isdark;
    cachHelper.putBool(key: 'isdark', val: isdark);
    }

    if(isdark==true) {
      hh = ThemeMode.dark;
      emit(dark());
    }
    else { hh = ThemeMode.light; emit(light());}
  }

  List <dynamic> search =[];
  String s ="";
  void getsearch(String val){

    DioHelper.getData(
        url: 'v2/everything',
        query: {'q':'${val}','apiKey':'ebb4a234192c46809c727f69d15eba47'}
    ).then((value)
    {
      search=value.data['articles'];
      emit(NewsgetsearchSuccesState());
      print(search[0]['title']);


    }).catchError((onError){
      print(onError.toString());
      emit(NewsgetsearchErrorState(onError.toString()));

    });

  }
}