import 'package:flutter/material.dart';
import 'package:popcorn/core/service/service_allocator.dart';

import 'movies/presentaion/screens/movies_screen.dart';

void main() {
  ServiceAllocator().init();
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}


