import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tutorials_marking_application/attendance.dart';
import 'package:tutorials_marking_application/report.dart';
import 'classlist.dart';
import 'student.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //added this line
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future:_initialization,
      builder: (context,snapshot){
        //Check for errors
        if (snapshot.hasError) {
          return FullScreenText(text:"Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done)
        {
          //BEGIN: the old MyApp builder from last week
          return ChangeNotifierProvider(
              create: (context) => StudentModel(),
              child: MaterialApp(
                  title: 'Tutorial Marking App',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  home: MyHomePage(title: 'Tutorial Marking App')
              )
          );
          //END: the old MyApp builder from last week
        }
        return FullScreenText(text: "Loading");
      },
    );
  }
}

class MyHomePage extends StatefulWidget
{
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage>
{
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentModel>(
        builder:buildScaffold
    );
  }

  Scaffold buildScaffold(BuildContext context, StudentModel studentModel, _) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: ElevatedButton.icon(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(
                        builder:(context) => Classlist()
                    ))
                  }, icon: Icon(Icons.people), label: Text("Classlist", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 20))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton.icon(
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(
                      builder:(context) => Attendance()
                  ))
                }, icon: Icon(Icons.calendar_today_outlined), label: Text("Attendance", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 75, vertical: 20))
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton.icon(
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(
                      builder:(context) => Report()
                  ))
                }, icon: Icon(Icons.receipt_rounded), label: Text("Report", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20))
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//A little helper widget to avoid runtime errors -- we can't just display a Text() by itself if not inside a MaterialApp, so this workaround does the job
class FullScreenText extends StatelessWidget {
  final String text;

  const FullScreenText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection:TextDirection.ltr, child: Column(children: [ Expanded(child: Center(child: Text(text))) ]));
  }
}
