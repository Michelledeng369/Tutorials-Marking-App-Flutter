import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorials_marking_application/score.dart';
import 'check.dart';
import 'grade_abc.dart';
import 'grade_hd.dart';
import 'multiple_check.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'student.dart';

class Attendance extends StatefulWidget
{
  final String week;

  const Attendance({Key key, this.week}) : super(key: key);

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {

  String weekChoose;
  List listWeek = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7", "Week 8", "Week 9", "Week 10"];
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
        appBar: AppBar(
          title: Text("Attendance"),
        ),
        body:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Row(
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Choose Week: ",style: TextStyle(color: Colors.grey[600],fontSize: 20.0, fontWeight: FontWeight.bold)),
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
                child: Text("Choose Marking Scheme: ",style: TextStyle(color: Colors.grey[600],fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top:3),
                child: ElevatedButton(
                    onPressed: () => {
                      if (weekChoose == null) {
                        //https://stackoverflow.com/questions/45948168/how-to-create-toast-in-flutter
                        Fluttertoast.showToast(
                            msg: 'Please select week number!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 7
                        )
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Check(week: weekChoose)
                        ))
                      }}, child: Text("Checkbox", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10))
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top:3),
                child: ElevatedButton(
                    onPressed: () => {
                      if (weekChoose == null) {
                        //https://stackoverflow.com/questions/45948168/how-to-create-toast-in-flutter
                        Fluttertoast.showToast(
                            msg: 'Please select week number!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 7
                        )
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MultipleCheck(week: weekChoose)
                        ))
                      }}, child: Text("Multiple Checkpoints", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10))
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top:3),
                child: ElevatedButton(
                    onPressed: () => {
                      if (weekChoose == null) {
                        //https://stackoverflow.com/questions/45948168/how-to-create-toast-in-flutter
                        Fluttertoast.showToast(
                            msg: 'Please select week number!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 7
                        )
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Score(week: weekChoose)
                        ))
                      }}, child: Text("Score out of 100", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10))
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top:3),
                child: ElevatedButton(
                    child: Text("Grade (HD+/HD/DN/CR/PP/NN)", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    onPressed: () => {
                      if (weekChoose == null) {
                        //https://stackoverflow.com/questions/45948168/how-to-create-toast-in-flutter
                        Fluttertoast.showToast(
                            msg: 'Please select week number!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 7
                        )
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => GradeHd(week: weekChoose)
                        ))
                      }},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10))
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top:3),
                child: ElevatedButton(
                    onPressed: () => {
                      if (weekChoose == null) {
                        //https://stackoverflow.com/questions/45948168/how-to-create-toast-in-flutter
                        Fluttertoast.showToast(
                            msg: 'Please select week number!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 7
                        )
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => GradeAbc(week: weekChoose)
                        ))
                      }}, child: Text("Grade (A/B/C/D/F)", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10))
                ),
              ),
            ],
          ),


    );
  }
}

