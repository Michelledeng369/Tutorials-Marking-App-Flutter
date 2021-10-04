import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'student.dart';

class ChooseMultiple extends StatefulWidget
{
  final String id;
  final String week;

  const ChooseMultiple({Key key, this.id, this.week}) : super(key: key);

  @override
  _ChooseMultipleState createState() => _ChooseMultipleState();
}

class _ChooseMultipleState extends State<ChooseMultiple> {

  final _formKey = GlobalKey<FormState>();
  bool checkbox1 = false;
  bool checkbox2 = false;
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
          title: Text("Multiple - ${widget.week}"),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Text("Student Index ${widget.id}",textAlign: TextAlign.center)), //check out this dart syntax, lets us do an if as part of an argument list
              Form(
                key: _formKey,
                child: Row(
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
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Current Score: $curScore", style: TextStyle(color: Colors.grey[600],fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 8.0),
                child: Text("Choose Checkpoints:", style: TextStyle(color: Colors.grey[600], fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              CheckboxListTile(
                  title: Text("Task 1"),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkbox1,
                  onChanged: (value) {
                    setState(() {
                      checkbox1 = value;
                      //isChecked = !isChecked;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Task 2"),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkbox2,
                  onChanged: (value) {
                    setState(() {
                      checkbox2 = value;
                      //isChecked = !isChecked;
                    });
                  }),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 20),
                child: Center(
                  child: ElevatedButton.icon(onPressed: () {
                    if (_formKey.currentState.validate())
                    {
                      var updateScore = "";
                      if (checkbox1 == true && checkbox2 == true) {

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
                        Navigator.pop(context);
                      }else if (checkbox1 == true || checkbox2 == true) {

                        switch (widget.week) {
                          case "Week 1":
                            student.week1score = 50.0;
                            break;
                          case "Week 2":
                            student.week2score = 50.0;
                            break;
                          case "Week 3":
                            student.week3score = 50.0;
                            break;
                          case "Week 4":
                            student.week4score = 50.0;
                            break;
                          case "Week 5":
                            student.week5score = 50.0;
                            break;
                          case "Week 6":
                            student.week6score = 50.0;
                            break;
                          case "Week 7":
                            student.week7score = 50.0;
                            break;
                          case "Week 8":
                            student.week8score = 50.0;
                            break;
                          case "Week 9":
                            student.week9score = 50.0;
                            break;
                          case "Week 10":
                            student.week10score = 50.0;
                            break;
                          default:
                            break;
                        }

                        Provider.of<StudentModel>(context, listen: false).update(student.id, student);
                        Navigator.pop(context);
                      }else {

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
                        Navigator.pop(context);
                      }
                    }
                  }, icon: Icon(Icons.save), label: Text("Save", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))),
                ),
              ),
            ]
        )
    );
  }
}

