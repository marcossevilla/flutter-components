import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _items = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addItems();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _addItems();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final image = _items[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300?random=$image'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
        itemCount: _items.length,
        controller: _scrollController,
      ),
      onRefresh: getPage,
    );
  }

  void _addItems() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _items.add(_lastItem);
    }
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    final _duration = new Duration(seconds: 2);
    new Timer(_duration, httpResponse);
  }

  void httpResponse() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
    _addItems();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> getPage() async {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _items.clear();
      _lastItem++;
      _addItems();
    });
    return Future.delayed(duration);
  }
}
