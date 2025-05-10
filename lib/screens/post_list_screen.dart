// screens/post_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostProvider>().fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = context.watch<PostProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: _buildBody(postProvider),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => AddPostScreen()),
      //   ),
      //   child: Icon(Icons.add),
      // ),
    );
  }

  Widget _buildBody(PostProvider postProvider) {
    if (postProvider.isLoading && postProvider.posts.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    if (postProvider.error.isNotEmpty) {
      return Center(child: Text(postProvider.error));
    }

    return ListView.builder(
      itemCount: postProvider.posts.length,
      itemBuilder: (context, index) {
        final post = postProvider.posts[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text(post.body),
        );
      },
    );
  }
}