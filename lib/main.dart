import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redis/redis.dart';
import 'package:redismanager/components/connections_widget.dart';
import 'package:redismanager/models/connection_list.dart';
import 'package:redismanager/pages/home_page.dart';
import 'package:redismanager/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ConnectionList(),
        )
      ],
      child: MaterialApp(
        title: 'Redis Manager',
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME: (ctx) => HomePage(),
        },
      ),
    );
  }
}
