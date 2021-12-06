import 'package:flutter/material.dart';
import 'package:project_alucar/tabs/home_tab.dart';
import 'package:project_alucar/tabs/products_tab.dart';
import 'package:project_alucar/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Carros"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(pageController),
          body: ProductsTab(),
        ),
        Container(color: Colors.yellow,),
        Container(color: Colors.green,)

      ],
    );
  }
}