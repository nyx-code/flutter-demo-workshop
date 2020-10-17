import 'package:flutter/material.dart';
import 'package:flutter_demo_app/AddScreen.dart';
import 'package:flutter_demo_app/utils/data.dart';

List data = [];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyAppScreen(),
    );
  }
}

class MyAppScreen extends StatefulWidget {
  @override
  _MyAppScreenState createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Study Planner app"),
      ),
      body: SafeArea(
        child: data.length != 0
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          child: AlertDialog(
                            content: Text(data[index]["subject"]),
                          ));
                    },
                    onLongPress: () {
                      //TODO:  Delete subject
                      print(Text(data[index]["subject"]));
                      data.removeAt(index);
                      print(data);
                      setState(() {});
                    },
                    title: Text(data[index]["subject"]),
                    subtitle: Text(data[index]["topic"]),
                    trailing: Icon(Icons.delete),
                  );
                },
                itemCount: data.length,
              )
            : Container(child: Text("NO data available")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("hello");
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddScreen(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
