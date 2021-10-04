
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Student {
  String id;
  int studentid;
  String studentname;
  String image;
  double week1score;
  double week2score;
  double week3score;
  double week4score;
  double week5score;
  double week6score;
  double week7score;
  double week8score;
  double week9score;
  double week10score;

  Student({this.studentid, this.studentname, this.image, this.week1score, this.week2score, this.week3score, this.week4score, this.week5score, this.week6score, this.week7score, this.week8score, this.week9score, this.week10score});

  Student.fromJson(Map<String, dynamic> json)
      : studentid = json['studentid'],
        studentname = json['studentname'],
        image = json['image'],
        week1score = json['week1score'],
        week2score = json['week2score'],
        week3score = json['week3score'],
        week4score = json['week4score'],
        week5score = json['week5score'],
        week6score = json['week6score'],
        week7score = json['week7score'],
        week8score = json['week8score'],
        week9score = json['week9score'],
        week10score = json['week10score'];

  Map<String, dynamic> toJson() =>
      {'studentid': studentid,
        'studentname': studentname,
        'image': image,
        'week1score': week1score,
        'week2score': week2score,
        'week3score': week3score,
        'week4score': week4score,
        'week5score': week5score,
        'week6score': week6score,
        'week7score': week7score,
        'week8score': week8score,
        'week9score': week9score,
        'week10score': week10score
      };
}

class StudentModel extends ChangeNotifier {
  /// Internal, private state of the list.
  final List<Student> items = [];

  //added this
  CollectionReference studentsCollection = FirebaseFirestore.instance.collection('students');

  //added this
  bool loading = false;

  //Normally a model would get from a database here, we are just hardcoding some data for this week
  StudentModel() {
    fetch();
  }

  //added this
  void fetch() async {
    //clear any existing data we have gotten previously, to avoid duplicate data
    items.clear();

    //indicate that we are loading
    loading = true;
    notifyListeners(); //tell children to redraw, and they will see that the loading indicator is on

    //get all students
    var querySnapshot = await studentsCollection.orderBy("studentid").get();

    //iterate over the students and add them to the list
    querySnapshot.docs.forEach((doc) {
      //note not using the add(Student item) function, because we don't want to add them to the db
      var student = Student.fromJson(doc.data());
      student.id = doc.id; //add this line
      items.add(student);
    });

    //put this line in to artificially increase the load time, so we can see the loading indicator (when we add it in a few steps time)
    //comment this out when the delay becomes annoying
    //await Future.delayed(Duration(seconds: 2));

    //we're done, no longer loading
    loading = false;
    notifyListeners();
  }

  void add(Student item) async {
    loading = true;
    notifyListeners();

    await studentsCollection.add(item.toJson());

    await fetch();
  }

  void update(String id, Student item) async {
    loading = true;
    notifyListeners();

    await studentsCollection.doc(id).set(item.toJson());

    await fetch();
  }

  void delete(String id) async {
    loading= true;
    notifyListeners();

    await studentsCollection.doc(id).delete();

    await fetch();
  }

  Student get(String id) {
    if (id == null) return null;
    return items.firstWhere((student) => student.id == id);
  }
}
