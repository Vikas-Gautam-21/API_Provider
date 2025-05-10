import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:simple_shop_app/api_service.dart';
import 'package:simple_shop_app/providers/post_provider.dart';
import 'package:simple_shop_app/screens/post_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ApiService()),
        ChangeNotifierProxyProvider<ApiService, PostProvider>(
          create: (context) => PostProvider(context.read<ApiService>()),
          update: (context, apiService, postProvider) => 
              postProvider ?? PostProvider(apiService),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter API with Provider',
        home: PostListScreen(),
      ),
    );
  }
}


