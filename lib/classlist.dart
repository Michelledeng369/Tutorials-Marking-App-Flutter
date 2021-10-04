import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorials_marking_application/student_details.dart';
import 'add_student.dart';
import 'main.dart';
import 'student.dart';

class Classlist extends StatefulWidget
{
  Classlist({Key key, this.studentid}) : super(key: key);

  final String studentid;

  @override
  _ClasslistState createState() => _ClasslistState();
}


class _ClasslistState extends State<Classlist>
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
        automaticallyImplyLeading: false,
          leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  tooltip: 'Back',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MyApp();
                        }));
                    },
                );
              }),
          title: Text("Classlist")
      ),


      //added this
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return AddStudent();
          });
        },
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //YOUR UI HERE
            if(studentModel.loading) CircularProgressIndicator() else Expanded(
              child: ListView.builder(
                  itemBuilder: (_, index) {
                    var student = studentModel.items[index];
                    return Dismissible(
                      child: ListTile(
                        title: Text("ID: ${student.studentid.toString()}"),
                        subtitle: Text("Name: ${student.studentname}"),
                          leading: Image.asset("assets/images/default.png"
                          ),
                        // leading: student.image != null ? Image.network(
                        //     student.image) : null,

                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return StudentDetails(id: student.id);
                              }));
                        },
                      ),

                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete),
                      ),

                      key:ValueKey<int>(index),
                        //https://api.flutter.dev/flutter/material/AlertDialog-class.html
                        confirmDismiss: (direction) {
                          return showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Warning'),
                                  content:  Text('Do you want to DELETE ?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(false),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const Text('OK'),
                                    ),
                                  ],
                              )
                          );
                          },
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          studentModel.delete(studentModel.items[index].id);
                        });
                      },

                    );
                  },
                  itemCount: studentModel.items.length
              ),
            )
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
