import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class EditPost extends StatefulWidget {
  const EditPost({Key? key}) : super(key: key);

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {

  late TextEditingController myTitleController;
  late TextEditingController myDescriptionController;
  late TextEditingController myImageUrlController;

  @override
  void dispose() {
    myTitleController.dispose();
    myDescriptionController.dispose();
    myImageUrlController.dispose();
    super.dispose();
  }

  bool emptyValidation = true;
  bool urlValidation = true;

  void addPostFunc() {
    urlValidation = isURL(myImageUrlController.text);
    emptyValidation = myTitleController.text.isNotEmpty &&
        myDescriptionController.text.isNotEmpty &&
        myImageUrlController.text.isNotEmpty;
    if (urlValidation && emptyValidation) {
      Navigator.pop(context, {
        'title': myTitleController.text,
        'description': myDescriptionController.text,
        'ImageUrl': myImageUrlController.text
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Map data= {};
    data= data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    myTitleController= TextEditingController(text: data['title']);
    myDescriptionController= TextEditingController(text: data['description']);
    myImageUrlController= TextEditingController(text: data['ImageUrl']);

    return Material(
      child: Form(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(5.0,10.0,5.0,0.0),
            child: ListView(
              children: [Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter the Title'
                    ),
                    controller: myTitleController,
                  ),
                  SizedBox(height:5.0),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter the Description'
                    ),
                    controller: myDescriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                  SizedBox(height:5.0),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter the Image Url'
                    ),
                    controller: myImageUrlController,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            addPostFunc();
                            if(urlValidation==false && emptyValidation==true) {
                              showDialog(
                                  context: context,
                                  builder:(context){
                                    return AlertDialog(
                                      content: Text('Oops!! Sry you gave an invalid Image Url',
                                      style: TextStyle(
                                        color: Colors.red
                                      ),),
                                    );
                                  });
                            }
                            if(emptyValidation==false && urlValidation==true) {
                              showDialog(
                                  context: context,
                                  builder:(context) {
                                    return AlertDialog(
                                      content: Text(
                                        'Oops!! You missed some field!!! Fields cannot be empty',
                                        style: TextStyle(
                                          color: Colors.red
                                        ),
                                      ),
                                    );
                                  });
                            }
                            if(urlValidation==false && emptyValidation==false) {
                              showDialog(
                                  context: context,
                                  builder:(context){
                                    return AlertDialog(
                                      content: Text(
                                        'Oops!! You gave an invalid Image Url as well as missed some field',
                                        style: TextStyle(
                                          color: Colors.red
                                        ),
                                      ),
                                    );
                                  } );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green[600]),
                          ),
                          child: Text('Add Post',style: TextStyle(color: Colors.grey[200]),) )
                    ],
                  )
                ],
              )],
            ),
          ),
        ),
      ),
    );
  }
}