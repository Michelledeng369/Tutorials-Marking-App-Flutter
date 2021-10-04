import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'student.dart';

class ChooseGradeHd extends StatefulWidget
{
  final String id;
  final String week;

  const ChooseGradeHd({Key key, this.id, this.week}) : super(key: key);

  @override
  _ChooseGradeHdState createState() => _ChooseGradeHdState();
}
class NumberList {
  String number;
  int index;
  NumberList({this.number, this.index});

}
class _ChooseGradeHdState extends State<ChooseGradeHd> {
  String curScore;
  final _formKey = GlobalKey<FormState>();
  String radioItemHolder = '';

  // Group Value for Radio Button.
  int id = 0;

  List<NumberList> nList = [
    NumberList( index: 1, number: "HD+"),
    NumberList( index: 2, number: "HD"),
    NumberList( index: 3, number: "DN"),
    NumberList( index: 4, number: "CR"),
    NumberList( index: 5, number: "PP"),
    NumberList( index: 6, number: "NN")
  ];

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

    if (score == 100.0) {
      curScore = "HD+";
    } else if (score == 80.0) {
      curScore = "HD";
    } else if (score == 70.0) {
      curScore = "DN";
    } else if (score == 60.0) {
      curScore = "CR";
    } else if (score == 50.0) {
      curScore = "PP";
    } else {
      curScore = "NN";
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Grade - ${widget.week}"),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Text("Student Index ${widget.id}",textAlign: TextAlign.center)), //check out this dart syntax, lets us do an if as part of an argument list
              Form(
                //key: _formKey,
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
                child: Text("Choose Grade:", style: TextStyle(color: Colors.grey[600], fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),

              //https://flutter-examples.com/get-selected-radio-button-group-value-in-flutter/
              Container(
                height: 350.0,
                child: Column(
                  children:
                  nList.map((data) => RadioListTile(
                    title: Text("${data.number}"),
                    groupValue: id,
                    value: data.index,
                    onChanged: (val) {
                      setState(() {
                        radioItemHolder = data.number ;
                        print("$radioItemHolder");
                        id = data.index;
                      });
                    },
                  )).toList(),
                ),
              ),
              Center(
                child: ElevatedButton.icon(onPressed: () {
                    var selectedgrade = radioItemHolder;
                    switch (selectedgrade) {
                      case "HD+":
                        score = 100.0;
                        break;
                      case "HD":
                        score = 80.0;
                        break;
                      case "DN":
                        score = 70.0;
                        break;
                      case "CR":
                        score = 60.0;
                        break;
                      case "PP":
                        score = 50.0;
                        break;
                      case "NN":
                        score = 0.0;
                        break;
                      default:
                        break;
                    }
                    if (selectedgrade != null) {
                      switch (widget.week) {
                        case "Week 1":
                          student.week1score = score;
                          break;
                        case "Week 2":
                          student.week2score = score;
                          break;
                        case "Week 3":
                          student.week3score = score;
                          break;
                        case "Week 4":
                          student.week4score = score;
                          break;
                        case "Week 5":
                          student.week5score = score;
                          break;
                        case "Week 6":
                          student.week6score = score;
                          break;
                        case "Week 7":
                          student.week7score = score;
                          break;
                        case "Week 8":
                          student.week8score = score;
                          break;
                        case "Week 9":
                          student.week9score = score;
                          break;
                        case "Week 10":
                          student.week10score = score;
                          break;
                        default:
                          break;
                      }
                      Provider.of<StudentModel>(context, listen: false).update(student.id, student);
                      Navigator.pop(context);
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
                      Navigator.pop(context);
                    }

                }, icon: Icon(Icons.save), label: Text("Save", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))),
              ),
            ]
        )
    );
  }
}

