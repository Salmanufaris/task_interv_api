import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:interview_test/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  var universalList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: universalList.isEmpty
          ? SizedBox()
          : ListView.builder(
              itemCount: universalList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondSCreen(
                                alpha: universalList[index]["alpha_two_code"]
                                    .toString(),
                                domain:
                                    universalList[index]["domains"].toString(),
                                web: universalList[index]["web_pages"]
                                    .toString(),
                              )));
                    },
                    child: Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          Text(
                            universalList[index]["name"],
                          ),
                          Text(universalList[index]["country"])
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void getData() async {
    http.Response response = await http
        .get(Uri.parse("http://universities.hipolabs.com/search?name=middle"));
    if (response.statusCode == 200) {
      log("ssss");
      String data;
      data = response.body;
      setState(() {
        universalList = jsonDecode(data);
        log(universalList.toString());
      });
    } else {
      print("else");
    }
  }
}
