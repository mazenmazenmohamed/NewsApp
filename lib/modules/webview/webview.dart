import 'package:flutter/material.dart';
import 'package:news_app/layouts/cubit/statecubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview extends StatelessWidget {
late String url ;
webview(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
           initialUrl:url ,
      ),
    );
  }
}
