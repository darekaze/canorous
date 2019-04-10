import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController _searchBoxController = TextEditingController();
  var _keys = {};
  var listViewKey = UniqueKey();

  @override
  void dispose() {
    // bloc.dispose();
    super.dispose();
  }

  Widget _buildSearchBar(){
    // TODO: implement builder
    return Container();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
