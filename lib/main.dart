import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: "  STUDENT GROUP ",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> groups = [];
  final controller = TextEditingController();

  Widget build(context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.green,
      title: Text("STUDENT GROUP"),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: onPressed,

      child: Text('  new  '),
    ),
    body: groups.isEmpty

        ? Center(child: Text('empty'))
        : ListView(
      children: [
        ...groups.map(
              (group) => Card(
              elevation: 3,
              child: ListTile(
                title: Text(group),
                trailing: Icon(Icons.details),
              )),
        )
      ],
    ),
  );

  void onPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(" add  group"),
        content: Container(
          width: 250,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(40)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white10,
              suffixIcon: Icon(Icons.group),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Group name ......",


            ),
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            child: Text("add"),
            color: Colors.green,
            onPressed: () {
              setState(() => groups.add(controller.text));
              controller.clear();
              Navigator.of(context).maybePop();
            },
          ),
          RaisedButton(
            child: Text("exit"),
            color: Colors.green,
            onPressed: () {
              controller.clear();
              Navigator.of(context).maybePop();
            },
          )
        ],
      ),
    );
  }
}
//