import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ebook_app/app_colors.dart' as Appcolors;

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  late ScrollController
      _scrollController; //having underscore under a varaible mean its private variable
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController(); //it takes nothing
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool isScroll) {
        return [
          SliverAppBar(
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: TabBar(
                  indicatorPadding: const EdgeInsets.all(0),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.only(right: 10),
                  controller: _tabController,
                  isScrollable: true,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 7,
                            offset: Offset(0, 0))
                      ]),
                  tabs: [
                    Container(
                      width: 120,
                      height: 50,
                      child: Text(
                        "one",
                        style: TextStyle(color: Colors.white),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Appcolors.menu1Color,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 7,
                                offset: Offset(0, 0))
                          ]),
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      child: Text(
                        "two",
                        style: TextStyle(color: Colors.white),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Appcolors.menu2Color,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 7,
                                offset: Offset(0, 0))
                          ]),
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      child: Text(
                        "three",
                        style: TextStyle(color: Colors.white),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Appcolors.menu3Color,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 7,
                                offset: Offset(0, 0))
                          ]),
                    )
                  ],
                ),
              ),
            ),
          )
        ];
      },
      body: TabBarView(controller: _tabController, children: [
        Material(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
            ),
            title: Text("one"),
          ),
        ),
        Material(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
            ),
            title: Text("two"),
          ),
        ),
        Material(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
            ),
            title: Text("three"),
          ),
        )
      ]),
    ));
  }
}
