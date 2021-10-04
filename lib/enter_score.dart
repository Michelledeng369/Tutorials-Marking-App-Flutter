import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'student.dart';


class EnterScore extends StatefulWidget
{
  final String id;
  final String week;

  const EnterScore({Key key, this.id, this.week}) : super(key: key);

  @override
  _EnterScoreState createState() => _EnterScoreState();
}

class _EnterScoreState extends State<EnterScore> {

  final _formKey = GlobalKey<FormState>();
  final scoreController = TextEditingController();
  String curScore;

  @override

  Widget build(BuildContext context)
  {

    var student = Provider.of<StudentModel>(context, listen:false).get(widget.id);
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
    curScore = score.toString();

    return Scaffold(
        appBar: AppBar(
          title: Text("Score - ${widget.week}"),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Text("Student Index ${widget.id}",textAlign: TextAlign.center)), //check out this dart syntax, lets us do an if as part of an argument list
               Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("assets/images/default.png",
                        fit: BoxFit.fill,
                        width: 120,
                        height: 120,
                        scale: 0.5,),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Text("       ID: ${student.studentid.toString()}",style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Name: ${student.studentname}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Current Score: $curScore", style: TextStyle(color: Colors.grey[600],fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 8.0),
                          child: Text("Enter Score:", style: TextStyle(color: Colors.grey[600], fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( left: 8.0),
                          child: SizedBox(
                            width: 350,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(labelText: "Enter Score"),
                              controller: scoreController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter valid number';
                                }
                                return null;
                              },

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 20),
                          child: Center(
                            child: ElevatedButton.icon(onPressed: () {
                              if (_formKey.currentState.validate())
                              {
                                var enteredGrade = double.parse(scoreController.text);
                                if (scoreController != null) {

                                  switch (widget.week) {
                                    case "Week 1":
                                      student.week1score = enteredGrade;
                                      break;
                                    case "Week 2":
                                      student.week2score = enteredGrade;
                                      break;
                                    case "Week 3":
                                      student.week3score = enteredGrade;
                                      break;
                                    case "Week 4":
                                      student.week4score = enteredGrade;
                                      break;
                                    case "Week 5":
                                      student.week5score = enteredGrade;
                                      break;
                                    case "Week 6":
                                      student.week6score = enteredGrade;
                                      break;
                                    case "Week 7":
                                      student.week7score = enteredGrade;
                                      break;
                                    case "Week 8":
                                      student.week8score = enteredGrade;
                                      break;
                                    case "Week 9":
                                      student.week9score = enteredGrade;
                                      break;
                                    case "Week 10":
                                      student.week10score = enteredGrade;
                                      break;
                                    default:
                                      break;
                                  }

                                  Provider.of<StudentModel>(context, listen: false).update(student.id, student);
                                  Navigator.pop(context);
                                }
                              }
                            }, icon: Icon(Icons.save), label: Text("Save", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))),
                          ),
                        ),
                      ]
                  )
              )],
        ),
    );

  }
}






