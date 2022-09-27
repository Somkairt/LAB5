import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/transection.dart';
import 'package:flutter_application_1/provider/transection_Provider.dart';
import 'package:flutter_application_1/screens/from_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return transectionProvider();
        })
      ],
      child: MaterialApp(
        title: 'Liew',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: const MyHomePage(title: 'แอพการเงิน'),
      ),
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
  @override
  Widget build(BuildContext context) {
    var add;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.access_alarm),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return fromscreen();
                }));
              },
            )
          ],
        ),
        body: Consumer(builder: (context, transectionProvider Provider, child) {
          return ListView.builder(
              itemCount: Provider.transections.length,
              itemBuilder: (context, int index) {
                transection data = Provider.transections[index];
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                  child: ListTile(
                    tileColor: Colors.brown,
                    leading: CircleAvatar(
                      child: FittedBox(
                        child: Text(data.amount.toString()),
                      ),
                    ),
                    title: Text(data.title),
                    subtitle: Text(data.date.toString()),
                  ),
                );
              });
        }));
  }
}
