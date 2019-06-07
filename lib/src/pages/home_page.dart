import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        // print('builder');
        // print(snapshot.data);
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((op) {
      final widgetTemp = ListTile(
        title: Text(op['text']),
        leading: getIcon(op['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          // Basic navigation
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);

          // Real deal navigation
          Navigator.pushNamed(context, op['route']);
        },
      );

      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
