import 'package:flutter/material.dart';

void main(){
  runApp(const TikTakApp());
}


class TikTakApp extends StatelessWidget {
  const TikTakApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TikTak",
      debugShowCheckedModeBanner: false,
      home: MyBody(),
    );
  }
}

class MyBody extends StatefulWidget {
  const MyBody({ Key? key }) : super(key: key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TikTak'),
        centerTitle: true,
      ),
    );
  }
}