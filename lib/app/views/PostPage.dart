import 'package:canorous/api/model/Post.dart';
import 'package:canorous/app/bloc/post/bloc.dart';
import 'package:canorous/app/bloc/post_submit/bloc.dart';
import 'package:canorous/app/components/BottomLoader.dart';
import 'package:canorous/app/providers/AppProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  static const PATH = '/submit';

  final String videoId;
  final String videoTitle;

  PostPage({
    this.videoId,
    this.videoTitle,
    Key key,
  }) : super(key: key);

  static String generatePath(String videoId, String videoTitle) {
    Map<String, dynamic> parma = {
      'videoId': videoId,
      'videoTitle': videoTitle,
    };
    Uri uri = Uri(path: PATH, queryParameters: parma);
    return uri.toString();
  }

  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _usernameController = TextEditingController();
  final _contentController = TextEditingController();

  PostSubmitBloc get _postSubmitBloc =>
      AppProvider.getBloc(context).postSubmitBloc;
  PostBloc get _postReceiveBloc =>
      AppProvider.getBloc(context).postBloc;

  @override
  void dispose() {
    _usernameController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final Post post = Post(
      username: _usernameController.text,
      content: _contentController.text,
      videoId: widget.videoId,
      videoTitle: widget.videoTitle,
    );
    _postSubmitBloc.dispatch(SubmitPost(post));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _postSubmitBloc,
      builder: (BuildContext context, PostSubmitState state) {
        if (state is PostSubmitSuccess) {
          AppProvider.getRouter(context).pop(context);
          _postSubmitBloc.dispatch(ResetSubmitForm());
          _postReceiveBloc.dispatch(RefreshPosts());
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Share Music'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.send),
                onPressed: state is! PostSubmitLoading ? _onSubmit : null,
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(12.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Name', hintText: 'Anomynous'),
                    controller: _usernameController,
                    autocorrect: false,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Say Something...',
                    ),
                    maxLines: 8,
                    controller: _contentController,
                  ),
                  // Music title and picture
                  Container(
                    padding: EdgeInsets.only(top: 16.0),
                    child: state is PostSubmitLoading
                        ? BottomLoader()
                        : null,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
