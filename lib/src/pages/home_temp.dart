import 'package:flutter/material.dart';

///
/// This was the dummy beta page.
/// Just to test some of Flutter's features.
///

class HomePageTemp extends StatelessWidget {
  final options = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: ListView(
        children: _shortList(),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();

    for (String op in options) {
      final tempWidget = new ListTile(
        title: Text(op),
      );

      // use of cascade operator
      list..add(tempWidget)..add(Divider());
    }
    return list;
  }

  List<Widget> _shortList() {
    return options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.bubble_chart),
            title: Text(item + '!'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
