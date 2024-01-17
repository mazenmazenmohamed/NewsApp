import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layouts/cubit/cubit.dart';
import '../../layouts/cubit/statecubit.dart';

class scienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, Newsstates>(
      listener: (context, index) {},
      builder: (context, index) {
        var cubit = NewsCubit.get(context) ;
        return ListView.builder(
          padding: const EdgeInsets.all(20.0),
          itemCount: cubit.science.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Row(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                '${cubit.science[index]['urlToImage']}'
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
                                  '${cubit.science[index]['title']}',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Text(
                                '${cubit.science[index]['publishedAt']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ]),
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
