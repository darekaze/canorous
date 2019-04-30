import 'package:canorous/api/model/Post.dart';
import 'package:canorous/app/bloc/post/bloc.dart';
import 'package:canorous/app/providers/AppProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MomentScreen extends StatefulWidget {
  final PostBloc postBloc;

  MomentScreen({
    Key key,
    @required this.postBloc,
  }) : super(key: key);

  _MomentScreenState createState() => _MomentScreenState();
}

class _MomentScreenState extends State<MomentScreen> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  PostBloc get _receiveBloc => widget.postBloc;

  @override
  void initState() {
    super.initState();;
    _scrollController.addListener(_onScroll);
    _receiveBloc.dispatch(FetchPosts());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _receiveBloc.dispatch(FetchPosts());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _receiveBloc,
      builder: (BuildContext context, PostState state) {
        if (state is PostUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PostError) {
          return Center(
            child: Text('Failed to fetch posts'),
          );
        } else if (state is PostLoaded) {
          // TODO: futher change based on search.dart
          if (state.posts.isEmpty) {
            return Center(
              child: Text('no posts'),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.posts.length
                  ? BottomLoader()
                  : PostWidget(post: state.posts[index]);
            },
            itemCount: state.hasReachedMax
                ? state.posts.length
                : state.posts.length + 1,
            controller: _scrollController,
          );
        }
      },
    );
  }
}

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Change the ui
    return ListTile(
      leading: Text(
        '${post.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(post.username),
      isThreeLine: true,
      subtitle: Text(post.content),
      dense: true,
      onTap: () async {
        // ENHANCE: make logic in player bloc
        AppProvider.getPlayer(context).playFromYT(post.videoId);
      },
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
