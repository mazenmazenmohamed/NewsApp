import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/webview/webview.dart';

import '../../layouts/cubit/cubit.dart';
import '../../layouts/cubit/statecubit.dart';

class businessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, index) {},
      builder: (context, index) {
        var cubit = NewsCubit.get(context) ;
        return ListView.builder(
         padding: const EdgeInsets.all(20.0),
         itemCount: cubit.business.length,
         itemBuilder: (BuildContext context, int index) {
           return Column(
             children: [
               SizedBox(
                 height: 30.0,
               ),
               InkWell(
                 onTap: (){
           Navigator.push(
               context,
               MaterialPageRoute(
               builder: (BuildContext context) =>  webview(cubit.business[index]['url']
           )
                   )
           );

         },
                 child: Row(
                     children: [
                       Container(
                         width: 120,
                         height: 120,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.0),
                           image: DecorationImage(
                             image: NetworkImage(
                                 '${cubit.business[index]['urlToImage']}'
                             ),
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                       SizedBox(
                         width: 20.0,
                       ),
                       Expanded(
                         child: Container(
                           height: 120,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Expanded(
                                 child: Text(
                                   '${cubit.business[index]['title']}',
                                   maxLines: 3,
                                   overflow: TextOverflow.ellipsis,
                                   style: Theme.of(context).textTheme.bodyText1,
                                 ),
                               ),
                               Text(
                                 '${cubit.business[index]['publishedAt']}',
                                 style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 14.0,
                                     color: Colors.grey),
                               ),
                             ],
                           ),
                         ),
                       )
                     ]),
               ),
               SizedBox(
                 height: 30.0,
               ),
             ],
           );
         },
         physics: BouncingScrollPhysics(),
          );
      },
    );
  }
}
