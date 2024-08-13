import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ebook_app/app_colors.dart' as Appcolors;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List popularBooks;
  ReadData() async {
    await DefaultAssetBundle /*Asset bundles are how Flutter apps access resources that are built into the app. */
            .of(context)
        .loadString /*This method loads the contents of the file located at "json/popularBooks" as a string*/ (
            "json/popularBooks.json")
        .then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appcolors.background,
      child: SafeArea(
          child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageIcon(
                    AssetImage("assets/img/menu.png"),
                    size: 24,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.notifications)
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  child: const Text(
                    "Popular Books",
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 180,
              child: Stack(
                children: [
                  Positioned(
                      left: -20,
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 180,
                        child: PageView.builder(
                            controller: PageController(
                                // initialPage: 2,
                                viewportFraction: 0.8),
                            itemCount:
                                popularBooks == null ? 0 : popularBooks.length,
                            itemBuilder: (_, i) {
                              return Container(
                                height: 180,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(popularBooks[i]["img"]),
                                        fit: BoxFit.fill)),
                              );
                            }),
                      ))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
