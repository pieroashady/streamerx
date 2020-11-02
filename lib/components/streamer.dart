import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Streamer extends StatefulWidget {
  Streamer({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  _StreamerState createState() => _StreamerState();
}

class _StreamerState extends State<Streamer> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  List quizResults = [];
  bool loading = false;

  final List<Map> schoolLists = [
    {
      "name": "Edgewick Scchol",
      "location": "572 Statan NY, 12483",
      "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Xaviers International",
      "location": "234 Road Kathmandu, Nepal",
      "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
    },
    {
      "name": "Kinder Garden",
      "location": "572 Statan NY, 12483",
      "type": "Play Group School",
      "logoText":
          "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
    },
    {
      "name": "WilingTon Cambridge",
      "location": "Kasai Pantan NY, 12483",
      "type": "Lower Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
    {
      "name": "Fredik Panlon",
      "location": "572 Statan NY, 12483",
      "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Whitehouse International",
      "location": "234 Road Kathmandu, Nepal",
      "type": "Higher Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/31/13/14/animal-2023924_960_720.png"
    },
    {
      "name": "Haward Play",
      "location": "572 Statan NY, 12483",
      "type": "Play Group School",
      "logoText":
          "https://cdn.pixabay.com/photo/2016/06/09/18/36/logo-1446293_960_720.png"
    },
    {
      "name": "Campare Handeson",
      "location": "Kasai Pantan NY, 12483",
      "type": "Lower Secondary School",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/01/13/01/22/rocket-1976107_960_720.png"
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future getData() async {
    setState(() {
      loading = true;
    });

    Dio dio = Dio();
    dio.options.headers['authorization'] =
        'Basic ' + base64Encode(utf8.encode('admin:admin'));

    dio.post('https://192.168.1.194:8443/api/streams').then((value) {
      print(value.data);
      value.data.forEach((key, value) {
        print(key);
      });

      setState(() {
        loading = false;
      });
    }).catchError((onError) {
      print(onError);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 120),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : quizResults.isEmpty
                        ? Center(
                            child: Text('No Available Room'),
                          )
                        : (ListView.builder(
                            itemCount: quizResults.length,
                            itemBuilder: (BuildContext context, int index) {
                              return buildList(context, index);
                            })),
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Streamer List",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      width: double.infinity,
      height: 110,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Container(
          //   width: 50,
          //   height: 50,
          //   margin: EdgeInsets.only(right: 15),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50),
          //     border: Border.all(width: 3, color: secondary),
          //     image: DecorationImage(
          //         image: CachedNetworkImageProvider(
          //             quizResults[index]['categoryId']['image']['url']),
          //         fit: BoxFit.fill),
          //   ),
          // ),
          // Expanded(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Text(
          //         quizResults[index]['categoryId']['category'],
          //         style: TextStyle(
          //             color: primary,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 18),
          //       ),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Row(
          //         children: <Widget>[
          //           Icon(
          //             Icons.star,
          //             color: secondary,
          //             size: 20,
          //           ),
          //           SizedBox(
          //             width: 5,
          //           ),
          //           Text(quizResults[index]['score'].toStringAsFixed(0),
          //               style: TextStyle(
          //                   color: primary, fontSize: 13, letterSpacing: .3)),
          //         ],
          //       ),
          //       SizedBox(
          //         height: 6,
          //       ),
          //       Row(
          //         children: <Widget>[
          //           Icon(
          //             quizResults[index]['passed'] ? Icons.check : Icons.close,
          //             color: secondary,
          //             size: 20,
          //           ),
          //           SizedBox(
          //             width: 5,
          //           ),
          //           Text(quizResults[index]['passed'] ? 'LULUS' : 'GAGAL',
          //               style: TextStyle(
          //                   color: primary, fontSize: 13, letterSpacing: .3)),
          //         ],
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
