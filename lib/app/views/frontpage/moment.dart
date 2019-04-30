import 'package:cached_network_image/cached_network_image.dart';
import 'package:canorous/api/model/Post.dart';
import 'package:canorous/app/bloc/bloc/bloc.dart';
import 'package:canorous/app/bloc/post/bloc.dart';
import 'package:canorous/app/components/BottomLoader.dart';
import 'package:canorous/app/providers/AppProvider.dart';
import 'package:canorous/data/model/Track.dart';
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
    super.initState();
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
          if (state.posts.isEmpty) {
            return Center(
              child: Text('No posts'),
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
    // ENHANCE: UI improvement
    return ListTile(
      leading: SizedBox(
        width: 90.0,
        height: 90.0,
        child: CachedNetworkImage(
          imageUrl: 'https://i.ytimg.com/vi/${post.videoId}/mqdefault.jpg',
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fadeInDuration: Duration(seconds: 1),
        ),
      ),
      title: Text(
        post.videoTitle,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(post.content),
      onTap: () async {
        AppProvider.getBloc(context).trackBloc.dispatch(CreateRecord(Track(
              title: post.videoTitle,
              videoId: post.videoId,
              duration: post.duration ?? 120,
            )));

        AppProvider.getPlayer(context)
            .playFromYT(post.videoId, post.videoTitle);
      },
    );
  }
}
