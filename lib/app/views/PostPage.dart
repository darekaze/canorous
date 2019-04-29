import 'package:canorous/app/bloc/post_submit/bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: AppProvider.getBloc(context).postSubmitBloc,
      builder: (BuildContext context, PostSubmitState state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Share Music'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // dispatch
                },
              )
            ],
          ),
          body: Container(),
        );
      },
    );
  }
}
