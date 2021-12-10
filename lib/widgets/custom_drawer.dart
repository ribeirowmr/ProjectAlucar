import 'package:flutter/material.dart';
import 'package:project_alucar/screens/login_screen.dart';
import 'package:project_alucar/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget{
  final PageController pageController;
  CustomDrawer(this.pageController);
  @override
  Widget build(BuildContext context){

    Widget buildDrawerBack() => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 115, 89, 148),
                  Color.fromARGB(255, 181, 74, 80)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        )
    );
    return Drawer(
      child: Stack(
        children: <Widget> [
          buildDrawerBack(),
          ListView(
            padding: const EdgeInsets.only(left:32.0, top:16.0),
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 200.0,
                child: Stack(
                    children: <Widget>[
                        const Positioned(
                          top: 8.0,
                          left: 0.0,
                          child: Text("Locação\n Alucar's",
                          style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                          ),
                        ),

                         /*Text("Pesquise, Compare e Alugue",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),*/
                        Positioned(
                          left: 0.0,
                          bottom: 55.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  <Widget>[
                              Text("Pesquise, Compare e Alugue",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                              ),
                              )
                            ],
                          )
                        ),
                      Positioned(
                          left: 0.0,
                          top: 135.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  <Widget>[
                              Text("Olá,",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    //height: 2.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  "Entre ou cadastre-se >",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 4, 125, 141),
                                      height: 1.5,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>LoginScreen())
                                  );
                                },
                              )
                            ],
                          ),
                      )
                      ],
                    ),
                ),
              Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.list, "Para você", pageController, 1),
              DrawerTile(Icons.location_on, "Unidades", pageController, 2),
              DrawerTile(Icons.playlist_add_check, "Minha Reserva", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}