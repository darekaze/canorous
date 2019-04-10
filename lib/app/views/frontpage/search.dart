import 'package:canorous/api/AppAPI.dart';
import 'package:canorous/api/model/SearchResult.dart';
import 'package:canorous/app/bloc/search/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  final AppAPI appAPI;

  const SearchScreen({
    Key key,
    @required this.appAPI,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = SearchBloc(
      appAPI: widget.appAPI,
    );
  }

  @override
  void dispose() {
    _searchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _SearchBar(searchBloc: _searchBloc),
      ),
      body: Column(
        children: <Widget>[
          _SearchBody(searchBloc: _searchBloc),
        ],
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  final SearchBloc searchBloc;

  _SearchBar({Key key, this.searchBloc}) : super(key: key);

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final _textController = TextEditingController();

  SearchBloc get searchBloc => widget.searchBloc;

  void _onClearTapped() {
    _textController.text = '';
    searchBloc.dispatch(TextChanged(text: ''));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      autocorrect: false,
      onChanged: (text) {
        searchBloc.dispatch(
          TextChanged(text: text),
        );
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: GestureDetector(
          child: Icon(Icons.clear),
          onTap: _onClearTapped,
        ),
        border: InputBorder.none,
        hintText: 'Search music',
      ),
    );
  }
}

class _SearchBody extends StatelessWidget {
  final SearchBloc searchBloc;

  const _SearchBody({Key key, this.searchBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: searchBloc,
      builder: (BuildContext context, SearchState state) {
        if (state is SearchStateEmpty) {
          return Text('Please enter a term to begin');
        }
        if (state is SearchStateLoading) {
          return CircularProgressIndicator(); // Can be change to cooler one
        }
        if (state is SearchStateError) {
          return Text(state.error);
        }
        if (state is SearchStateSuccess) {
          return state.items.isEmpty
            ? Text('No Results')
            : Expanded(child: _SearchResults(items: state.items));
        }
      },
    );
  }
}

class _SearchResults extends StatelessWidget {
  final List<SearchResultItem> items;

  const _SearchResults({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _SearchResultItem(item: items[index]);
      },
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final SearchResultItem item;

  const _SearchResultItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
    );
  }
}
