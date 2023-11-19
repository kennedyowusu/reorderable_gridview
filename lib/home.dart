import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:reorderable_gridview/data.dart';
import 'package:reorderable_gridview/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: ReorderableGridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        children: dataModel.map((DataModel item) {
          return Container(
            key: ValueKey(item.id),
            child: Card(
              elevation: 2.0,
              child: Image.network(
                item.image,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
        onReorder: (int oldIndex, int newIndex) {
          setState(
            () {
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              final DataModel item = dataModel.removeAt(oldIndex);
              dataModel.insert(newIndex, item);
            },
          );
        },
      ),
    );
  }
}
