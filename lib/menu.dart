import 'dart:convert';

import 'package:ebook_app/my_tabs.dart';
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
            backgroundColor: Appcolors.sliverBackground,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: TabBar(
                  indicatorPadding: const EdgeInsets.all(0),
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.only(right: 0),
                  controller: _tabController,
                  isScrollable: false,
                  indicator: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 7,
                            offset: Offset(0, 0))
                      ]),
                  tabs: [
                    appTabs(color: Appcolors.menu1Color, text: "New"),
                    appTabs(color: Appcolors.menu2Color, text: "Popular"),
                    appTabs(color: Appcolors.menu3Color, text: "Trending")
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
