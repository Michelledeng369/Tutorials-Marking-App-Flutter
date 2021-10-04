import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorials_marking_application/choose_multiple.dart';
import 'student.dart';

class MultipleCheck extends StatefulWidget
{
  MultipleCheck({Key key, this.week}) : super(key: key);

  final String week;

  @override
  _MultipleCheckState createState() => _MultipleCheckState();
}


class _MultipleCheckState extends State<MultipleCheck>
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
        title: Text("Multiple - ${widget.week}"),
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
                    var score = 0.0;
                    var curScore = "";
                    switch (widget.week) {
                      case "Week 1":
                        score = student.week1score;
                        break;
                      case "Week 2":
                        score = student.week2score;
                        break;
                      case "Week 3":
                        score = student.week3score;
                        break;
                      case "Week 4":
                        score = student.week4score;
                        break;
                      case "Week 5":
                        score = student.week5score;
                        break;
                      case "Week 6":
                        score = student.week6score;
                        break;
                      case "Week 7":
                        score = student.week7score;
                        break;
                      case "Week 8":
                        score = student.week8score;
                        break;
                      case "Week 9":
                        score = student.week9score;
                        break;
                      case "Week 10":
                        score = student.week10score;
                        break;
                      default:
                        break;
                    }
                    curScore = score.toString();
                    return ListTile(
                        title: Text("ID: ${student.studentid.toString()}"),
                        subtitle: Text("Name: ${student.studentname}"),
                        trailing: Text("Grade: ${curScore.toString()}"),
                        leading: Image.asset("assets/images/default.png"
                      ),
                      // leading: student.image != null ? Image.network(
                      //     student.image) : null,

                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ChooseMultiple (id: student.id, week: widget.week,);
                              }));
                        }
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
