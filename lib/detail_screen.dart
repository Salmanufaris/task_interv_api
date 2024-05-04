import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondSCreen extends StatefulWidget {
  final String domain;
  final String web;
  final String alpha;
  const SecondSCreen(
      {super.key,
      required this.domain,
      required this.alpha,
      required this.web});

  @override
  State<SecondSCreen> createState() => _SecondSCreenState();
}

class _SecondSCreenState extends State<SecondSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              log(123);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(left: 12),
                height: 100,
                width: 400,
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      Text(widget.alpha.toString()),
                      Text(widget.domain.toString()),
                      Text(widget.web.toString())
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchURL() async {
    log(123);
    final Uri url =
        Uri.parse("http://universities.hipolabs.com/search?name=middle");
    log(456);
    if (!await launchUrl(url)) {
      log(6789);
      throw Exception('Could not launch ');
    }
  }
}
