import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/cubit/cubit.dart';
import 'package:news_app/modules/search/search.dart';

import 'cubit/statecubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,Newsstates>(
        listener: (context ,state ){},
        builder: (context ,state ){
          var cubit = NewsCubit.get(context) ;
          return Scaffold(
              appBar: AppBar(
                title: Text("News App"),
                actions: [
                  IconButton(
                      onPressed: (){

                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) =>  search()
                        ));
                      },
                      icon: Icon(Icons.search)
                  ),
                  IconButton(
                      onPressed: (){
                        cubit.Changemode();
                      }, icon: Icon(Icons.brightness_4_outlined)
                  )
                ],
              ),
              bottomNavigationBar:BottomNavigationBar(
                items: cubit.bottomitems,
                currentIndex: cubit.currentIndex,
                onTap: (index){cubit.Change(index);},
              ),
              body: cubit.screens[cubit.currentIndex],
          );
        },

      );

  }
}
