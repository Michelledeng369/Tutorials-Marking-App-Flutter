import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'student.dart';

class Check extends StatefulWidget
{
  Check({Key key, this.week, this.id}) : super(key: key);
  final String id;
  final String week;
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check>
{
  bool checkboxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentModel>(
        builder:buildScaffold
    );
  }

  Scaffold buildScaffold(BuildContext context, StudentModel studentModel, _) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox - ${widget.week}"),
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

                    if (score == 100.0) {
                      checkboxSelected = true;
                    } else {
                      checkboxSelected = false;
                    }
                    return CheckboxListTile(
                      title: Text("ID: ${student.studentid.toString()}"),
                      subtitle: Text("Name: ${student.studentname}"),
                      secondary: Image.asset("assets/images/default.png"
                      ),
                      value: checkboxSelected,

                      onChanged: (value) {
                        print("${student.studentid.toString()}, $value");
                        setState(() {
                          checkboxSelected = value;
                          //isChecked = !isChecked;
                        });

                        var updateScore = "";
                        if (checkboxSelected == true) {


                            switch (widget.week) {
                              case "Week 1":
                                student.week1score = 100.0;
                                break;
                              case "Week 2":
                                student.week2score = 100.0;
                                break;
                              case "Week 3":
                                student.week3score = 100.0;
                                break;
                              case "Week 4":
                                student.week4score = 100.0;
                                break;
                              case "Week 5":
                                student.week5score = 100.0;
                                break;
                              case "Week 6":
                                student.week6score = 100.0;
                                break;
                              case "Week 7":
                                student.week7score = 100.0;
                                break;
                              case "Week 8":
                                student.week8score = 100.0;
                                break;
                              case "Week 9":
                                student.week9score = 100.0;
                                break;
                              case "Week 10":
                                student.week10score = 100.0;
                                break;
                              default:
                                break;
                            }
                          Provider.of<StudentModel>(context, listen: false).update(student.id, student);


                        } else {

                            switch (widget.week) {
                              case "Week 1":
                                student.week1score = 0.0;
                                break;
                              case "Week 2":
                                student.week2score = 0.0;
                                break;
                              case "Week 3":
                                student.week3score = 0.0;
                                break;
                              case "Week 4":
                                student.week4score = 0.0;
                                break;
                              case "Week 5":
                                student.week5score = 0.0;
                                break;
                              case "Week 6":
                                student.week6score = 0.0;
                                break;
                              case "Week 7":
                                student.week7score = 0.0;
                                break;
                              case "Week 8":
                                student.week8score = 0.0;
                                break;
                              case "Week 9":
                                student.week9score = 0.0;
                                break;
                              case "Week 10":
                                student.week10score = 0.0;
                                break;
                              default:
                                break;
                            }
                            Provider.of<StudentModel>(context, listen: false).update(student.id, student);
                        }
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
