import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'student.dart';
import 'package:share/share.dart';

class StudentDetails extends StatefulWidget
{
  final String id;

  const StudentDetails({Key key, this.id}) : super(key: key);

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    var student = Provider.of<StudentModel>(context, listen:false).get(widget.id);

    var adding = student == null;
    if (!adding) {
      idController.text = student.studentid.toString();
      nameController.text = student.studentname;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Student"),
        ),

        resizeToAvoidBottomInset: false,
        body:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (adding == false) Center(child: Text("Student Index ${widget.id}")), //check out this dart syntax, lets us do an if as part of an argument list
              Form(
                key: _formKey,
                child: Column(
                    children: <Widget>[
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
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: "ID"),
                            controller: idController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter valid number';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextFormField(
                            decoration: InputDecoration(labelText: "Name"),
                            controller: nameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter valid name';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                   ],
                ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Summary list of grades: ", style: TextStyle(color: Colors.grey[600],fontSize: 18.0, fontWeight: FontWeight.bold)),
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
                                    child: Text('Week #', style: TextStyle(color: Colors.white,fontSize: 17.0, fontWeight: FontWeight.bold)),
                                  )),
                                  Center(child: Padding(padding: const EdgeInsets.all(8.0),
                                    child: Text('Score', style: TextStyle(color: Colors.white,fontSize: 17.0, fontWeight: FontWeight.bold)),
                                  )),
                                ]),
                            TableRow(children: [
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Week 1'),
                              )),
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${student.week1score}'),
                              ))
                            ]),
                            TableRow(children: [
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Week 2'),
                              )),
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${student.week2score}'),
                              ))
                            ]),
                            TableRow(children: [
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Week 3'),
                              )),
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${student.week3score}'),
                              ))
                            ]),
                            TableRow(children: [
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Week 4'),
                              )),
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${student.week4score}'),
                              ))
                            ]),
                            TableRow(children: [
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Week 5'),
                              )),
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${student.week5score}'),
                              ))
                            ]),
                            TableRow(children: [
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Week 6'),
                              )),
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${student.week6score}'),
                              ))
                            ]),
                            TableRow(children: [
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Week 7'),
                              )),
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${student.week7score}'),
                              ))
                            ]),
                            TableRow(children: [
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Week 8'),
                              )),
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${student.week8score}'),
                              ))
                            ]),
                            TableRow(children: [
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Week 9'),
                              )),
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${student.week9score}'),
                              ))
                            ]),
                            TableRow(children: [
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('Week 10'),
                              )),
                              Center(child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('${student.week10score}'),
                              ))
                            ]),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton.icon(onPressed: () {
                            if (_formKey.currentState.validate())
                            {
                              //update the student object
                              student.studentid = int.parse(idController.text);
                              student.studentname = nameController.text; //good code would validate these

                              //TODO: update the model
                              Provider.of<StudentModel>(context, listen: false).update(widget.id, student);

                              //return to previous screen
                              Navigator.pop(context);
                            }
                          }, icon: Icon(Icons.save), label: Text("Save", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))),
                        ),
                      ),

                      //https://codesundar.com/flutter-share-example/
                      Center(
                        child: ElevatedButton.icon(
                            onPressed: () {
                              Share.share("ID: ${idController.text},  Name: ${nameController.text}, Week 1: ${student.week1score}, Week 2: ${student.week2score}, Week 3: ${student.week3score}, Week 4: ${student.week4score}, Week 5: ${student.week5score}, Week 6: ${student.week6score}, Week 7: ${student.week7score}, Week 8: ${student.week8score}, Week 9: ${student.week9score}, Week 10: ${student.week10score}");
                            }, icon: Icon(Icons.share), label: Text("Share", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))),
                      ),


                    ]

                ),
              ),




            ]
        )


    );
  }
}

