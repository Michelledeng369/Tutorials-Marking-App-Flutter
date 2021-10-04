import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'student.dart';

class Report extends StatefulWidget
{
  Report({Key key, this.id}) : super(key: key);

  final String id;

  @override
  _ReportState createState() => _ReportState();
}


class _ReportState extends State<Report>
{
  String weekChoose;
  List listWeek = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7", "Week 8", "Week 9", "Week 10"];
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context)
  {
    return Consumer<StudentModel>(
        builder:buildScaffold
    );
  }

  Scaffold buildScaffold(BuildContext context, StudentModel studentModel, _) {
    var students = studentModel.items;

    var scores = 0.0;
    double average;
    for (var student in students) {
      switch (weekChoose) {
        case "Week 1":
          scores = scores + student.week1score;
          break;
        case "Week 2":
          scores = scores + student.week2score;
          break;
        case "Week 3":
          scores = scores + student.week3score;
          break;
        case "Week 4":
          scores = scores + student.week4score;
          break;
        case "Week 5":
          scores = scores + student.week5score;
          break;
        case "Week 6":
          scores = scores + student.week6score;
          break;
        case "Week 7":
          scores = scores + student.week7score;
          break;
        case "Week 8":
          scores = scores + student.week8score;
          break;
        case "Week 9":
          scores = scores + student.week9score;
          break;
        case "Week 10":
          scores = scores + student.week10score;
          break;
        default:
          break;
      }
    }
     average = scores/ studentModel.items.length;

    return Scaffold(
    appBar: AppBar(
      title: Text("Report"),
    ),
    body:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Row(
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Choose Week: ", style: TextStyle(color: Colors.grey[600], fontSize: 18.0, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              //https://www.youtube.com/watch?v=XuxpCYyrKoE
              child: DropdownButton(
                hint: Text("   --- Select Week ---   "),
                value: weekChoose,
                onChanged: (newWeek) {
                  setState(() {
                    weekChoose = newWeek;
                  });
                },
                items: listWeek.map((valueItem){
                  return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem)
                  );
                }).toList(),
              ),
            )],
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Average Grade: $average",style: TextStyle(color: Colors.grey[800],fontSize: 18.0, fontStyle: FontStyle.italic)),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Summary ", style: TextStyle(color: Colors.grey[600],fontSize: 18.0, fontWeight: FontWeight.bold)),
        ),

        Container(
            padding: EdgeInsets.only(left: 60.0, right: 60.0),
            child: Table(
                border: TableBorder.all(color: Colors.green),
                children: [
                  TableRow(decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                      children: [
                        Center(child: Padding(padding: const EdgeInsets.all(8.0),
                          child: Text('Student Name', style: TextStyle(color: Colors.white,fontSize: 17.0, fontWeight: FontWeight.bold)),
                        )),
                        Center(child: Padding(padding: const EdgeInsets.all(8.0),
                          child: Text('Score', style: TextStyle(color: Colors.white,fontSize: 17.0, fontWeight: FontWeight.bold)),
                        )),
                      ]),
                ])
        ),
        Container(
          child: Flexible(
            child: ListView.builder(
                itemBuilder: (_, index) {
                  var students = studentModel.items[index];
                  var score = 0.0;
                  switch (weekChoose) {
                    case "Week 1":
                      score = students.week1score;
                      break;
                    case "Week 2":
                      score = students.week2score;
                      break;
                    case "Week 3":
                      score = students.week3score;
                      break;
                    case "Week 4":
                      score = students.week4score;
                      break;
                    case "Week 5":
                      score = students.week5score;
                      break;
                    case "Week 6":
                      score = students.week6score;
                      break;
                    case "Week 7":
                      score = students.week7score;
                      break;
                    case "Week 8":
                      score = students.week8score;
                      break;
                    case "Week 9":
                      score = students.week9score;
                      break;
                    case "Week 10":
                      score = students.week10score;
                      break;
                    default:
                      break;
                  }
                  return Container(

                      padding: EdgeInsets.only(left: 60.0, right: 60.0),
                      child: Table(
                        border: TableBorder.all(color: Colors.green),
                        children: [
                      TableRow(
                      children: [
                        Center(child: Padding(padding: const EdgeInsets.all(8.0),
                          child: Text('${students.studentname}', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                        )),
                        Center(child: Padding(padding: const EdgeInsets.all(8.0),
                          child: Text('$score', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
                        )),
                      ]),
                  ])
                  );

                },
                itemCount: studentModel.items.length
            ),

          ),

        ),
      ],
    ),

  );

  }

}
