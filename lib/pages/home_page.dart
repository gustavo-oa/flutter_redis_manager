import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redismanager/components/connections_widget.dart';
import 'package:redismanager/models/connection_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.9;
    double width = MediaQuery.of(context).size.width;
    ConnectionList connections = Provider.of<ConnectionList>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Connections"),
        ),
        body: Container(
          height: height,
          width: width,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Connections ${connections.totalConnections}'),
                  Container(
                    height: height * 0.9,
                    width: width * 0.3,
                    color: Colors.grey[300],
                    child: ConnectionsWidget(),
                  ),
                ],
              ),
              Container(
                // height: width * 0.9,
                // width: height * 0.7,
                child: Column(
                  children: [
                    Container(
                      width: width * 0.7,
                      height: height * 0.7,
                      child: Text('content'),
                    ),
                    Divider(
                      height: 5,
                    ),
                    Container(
                      color: Colors.black,
                      width: width * 0.7,
                      height: height * 0.1,
                      child: const TextField(
                        autocorrect: false,
                        selectionHeightStyle: BoxHeightStyle.max,
                        style: TextStyle(
                          color: Colors.green,
                        ),
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          focusColor: Colors.green,
                          fillColor: Colors.green,
                          hoverColor: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
