// providers/post_provider.dart
import 'package:flutter/foundation.dart';
import 'package:simple_shop_app/api_service.dart';
import '../models/post.dart';

class PostProvider with ChangeNotifier {
  final ApiService _apiService;
  List<Post> _posts = [];
  bool _isLoading = false;
  String _error = '';
  int _page = 1;
  bool _hasMore = true;

  PostProvider(this._apiService);

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> loadMorePosts() async {
    if (!_hasMore || _isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.get('posts?page=$_page');
      final newPosts =
          (response as List).map((json) => Post.fromJson(json)).toList();

      if (newPosts.isEmpty) {
        _hasMore = false;
      } else {
        _posts.addAll(newPosts);
        _page++;
      }
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.get('posts');
      _posts = (response as List).map((json) => Post.fromJson(json)).toList();
      _error = '';
    } catch (e) {
      _error = e.toString();
      _posts = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createPost(Post post) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.post('posts', post.toJson());
      _posts.add(Post.fromJson(response));
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
