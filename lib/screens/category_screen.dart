import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_alucar/datas/product_data.dart';
import 'package:project_alucar/tiles/category_tile.dart';
import 'package:project_alucar/tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const CategoryScreen(this.snapshot, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.data()['title']),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(icon:Icon(Icons.grid_on),),
                Tab(icon: Icon(Icons.list),)
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
              .collection("cars").doc(snapshot.id)
              .collection("items").get(),
            builder: (context, snapshot){
              if(!snapshot.hasData)
                return Center(child: CircularProgressIndicator(),);
              else
                return TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GridView.builder(
                        padding: EdgeInsets.all(4.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          childAspectRatio: 0.70,
                        ),
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index){
                          return ProductTile("grid", ProductData.fromDocument(snapshot.data!.docs[index]));
                        }
                      ),
                      ListView.builder(
                          padding: EdgeInsets.all(4.0),
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index){
                            return ProductTile("list", ProductData.fromDocument(snapshot.data!.docs[index]));
                          }
                      )
                    ]
                );
              }
             )
          ),
    );
  }
}