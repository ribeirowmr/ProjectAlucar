import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Widget buildBodyBack() => Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 46, 10, 100)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      )
    );
    
    return Stack(
      children: <Widget> [
        buildBodyBack(),
         CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("ALUCAR'S",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black), ),
                centerTitle: true,
              ),
            ),

            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                    .collection('home').orderBy('pos').get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                } else {
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  staggeredTiles: snapshot.data?.docs.map(
                          (doc){
                            return StaggeredTile.count(doc.data()['x'], doc.data()['y']);
    }
    ).toList(),
                  children: snapshot.data?.docs.map(
                  (doc){
                   return FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: doc.data()['image'],
                      fit: BoxFit.cover,
                   );
                 }
                 ).toList(),
                  );
                }
                },
                  /*{
                  // ignore: avoid_print
                  print(snapshot.data?.docs.length);
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: Container()
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),*/

                    )
        ],
        )
      ],
    );
  }
}