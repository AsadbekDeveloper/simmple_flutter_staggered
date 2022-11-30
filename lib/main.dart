import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/rendering/sliver_staggered_grid.dart';
import 'package:staggered_grid_view_flutter/staggered_grid_view_flutter.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Icon(
              Icons.bookmark_outline_outlined,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Headline text',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sub text',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: 20,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  itemBuilder: ((context, index) => Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Text(
                            index.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                  staggeredTileBuilder: ((index) {
                    switch (index % 5) {
                      case 0:
                        return StaggeredTile.count(2, 2);
                      case 1:
                        return StaggeredTile.count(2, 1);
                      case 2:
                        return StaggeredTile.count(1, 1);
                      case 3:
                        return StaggeredTile.count(1, 1);
                      case 4:
                        return StaggeredTile.count(4, 2);
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
