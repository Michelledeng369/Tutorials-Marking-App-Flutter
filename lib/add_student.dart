import 'package:camera/camera.dart';
import 'dart:async';
import 'dart:io';
//add for download/upload
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorials_marking_application/classlist.dart';
import 'student.dart';

class AddStudent extends StatefulWidget
{
  final String id;
  final String imagePath;
  const AddStudent({Key key, this.id, this.imagePath}) : super(key: key);

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

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
      //durationController.text = student.image.toString();
    }

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
                            return Classlist();
                          }));
                    },
                  );
                }),
            title: Text("Add Student")
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          // Provide an onPressed callback.
          onPressed: () async {
            final cameras = await availableCameras();
            // Get a specific camera from the list of available cameras.
            final firstCamera = cameras.first;

            //use the TakePictureScreen to get an image. This is like doing a startActivityForResult
            var picture = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TakePictureScreen (
                      // Pass the appropriate camera to the TakePictureScreen widget.
                        camera: firstCamera
                    )
                )
            );
            //now do the upload
            try {
              await FirebaseStorage.instance
                  .ref('uploads/hello-world' + DateTime
                  .now()
                  .millisecondsSinceEpoch
                  .toString() + '.jpeg')
                  .putFile(picture);
            } on FirebaseException catch (e) {
              // e.g, e.code == 'canceled'
            }
          },
        ),
        resizeToAvoidBottomInset: false,
        body:
        Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  if (adding == false) Text("Student Index ${widget.id}"), //check out this dart syntax, lets us do an if as part of an argument list
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          if (widget.imagePath == null) Image.asset("assets/images/default.png",

                            fit: BoxFit.fill,
                            width: 200,
                            height: 200,
                            scale: 0.5
                      ) else Image.file(File(widget.imagePath),

                              fit: BoxFit.fill,
                              width: 200,
                              height: 200,
                              scale: 0.5
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton.icon(onPressed: () {
                              if (_formKey.currentState.validate())
                              {
                                if (adding)
                                {
                                  student = Student();
                                }

                                //update the student object
                                student.studentid = int.parse(idController.text);
                                student.studentname = nameController.text;

                                student.week1score = 0.0;
                                student.week2score = 0.0;
                                student.week3score = 0.0;
                                student.week4score = 0.0;
                                student.week5score = 0.0;
                                student.week6score = 0.0;
                                student.week7score = 0.0;
                                student.week8score = 0.0;
                                student.week9score = 0.0;
                                student.week10score = 0.0;//good code would validate these

                                //TODO: update the model
                                if (adding){
                                  Provider.of<StudentModel>(context, listen: false).add(student);
                                }
                                Navigator.push(context, MaterialPageRoute(
                                    builder:(context) => Classlist()
                                ));
                              }
                            }, icon: Icon(Icons.save), label: Text("Save", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold))),
                          )
                        ],
                      ),
                    ),
                  )
                ]
            )
         )
    );
  }

}




class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({Key key, @required this.camera,}) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();
            final picture = File(image?.path);

            print(image?.path);

            // Navigator.pop(context, picture);
            // return;

            //this was the camera sample from flutter, show the image full-screen. Comment out pop and return above to see it
            // If the picture was taken, display it on a new screen.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddStudent(
                  // Pass the automatically generated path to
                  // the AddStudent widget.
                  imagePath: image?.path,
                    // print(imagePath);

                ),
              ),
            );

          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
      ),
    );
  }
}