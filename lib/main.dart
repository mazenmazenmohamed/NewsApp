import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/Network/local/cachHelper.dart';
import 'package:news_app/layouts/cubit/cubit.dart';
import 'package:news_app/layouts/cubit/statecubit.dart';
import 'Network/remote/dio_helper.dart';
import 'layouts/newslayout.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await cachHelper.init();
 var isdark=cachHelper.getBool(key: 'isdark');
  runApp(MyApp(isdark));
}

class MyApp extends StatelessWidget {
  var isdark;
  MyApp( this.isdark);
 // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=>NewsCubit()..getBusiness()..getscience()..getsports()..Changemode(
        fromShared:isdark
      ),
      child:BlocConsumer<NewsCubit,Newsstates>(
      listener: (context,index){},
      builder:  (context,index){
        var cubit = NewsCubit.get(context) ;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black
                ),
              ),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold

                  ),
                  iconTheme: IconThemeData(
                      color: Colors.black
                  ),
                  elevation: 0.0,
                  backwardsCompatibility:false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black,
                      statusBarBrightness: Brightness.light,
                      statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: Colors.white
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor:Colors.deepOrange,
                  elevation: 25.0
              )
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: HexColor('333739'),
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold

              ),
              iconTheme: IconThemeData(
                color:Colors.white,
              ),
              elevation: 0.0,
              backwardsCompatibility:false,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark
              ),
              backgroundColor: HexColor('333739'),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor:Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('333739'),
                elevation: 25.0
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white
              ),
            ),
          ),
          themeMode:cubit.hh,
          home:  NewsLayout(),
        );
      },
    ),);
  }
}


