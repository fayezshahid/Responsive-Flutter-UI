import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Text List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollableTextList(),
    );
  }
}

class ScrollableTextList extends StatelessWidget {
  final List<String> texts = [
    'Text 1',
    'Text 2',
    'Text 3',
    'Text 4',
    'Text 5',
    'Text 6',
    'Text 7',
    'Text 8',
    'Text 9',
    'Text 10',
    'Text 11',
    'Text 12',
    'Text 13',
    'Text 14',
    'Text 15',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable Text List'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxHeight < 300) { // Adjust threshold as needed
            return Row(
              children: [
                Expanded(
                  child: buildListView(texts.sublist(0, texts.length ~/ 2)),
                ),
                Expanded(
                  child: buildListView(texts.sublist(texts.length ~/ 2)),
                ),
              ],
            );
          } else {
            return buildListView(texts);
          }
        },
      ),
    );
  }

  Widget buildListView(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}