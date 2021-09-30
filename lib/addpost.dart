import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:validators/validators.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final myTitleController = TextEditingController();
  final myDescriptionController = TextEditingController();
  final myImageUrlController= TextEditingController();

  @override


  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTitleController.dispose();
    myDescriptionController.dispose();
    myImageUrlController.dispose();
    super.dispose();
  }
  bool emptyValidation =true;
  bool urlValidation =true;
  void addPostFunc() {
    urlValidation = isURL(myImageUrlController.text);
    emptyValidation = myTitleController.text.isNotEmpty &&
        myDescriptionController.text.isNotEmpty &&
        myImageUrlController.text.isNotEmpty;
    if ( emptyValidation && urlValidation ) {
      Navigator.pop(context, {
        'title': myTitleController.text,
        'description': myDescriptionController.text,
        'imgUrl': myImageUrlController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: [Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter title',
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors. white, width: 2.0),
                      borderRadius: BorderRadius. circular(25.0),
                    ),
                  ),
                  controller: myTitleController,
                ),
                SizedBox(height: 5.0,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter description',
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors. white, width: 2.0),
                      borderRadius: BorderRadius. circular(25.0),
                    ),
                  ),
                  controller: myDescriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter image Url',
                    focusedBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors. white, width: 2.0),
                      borderRadius: BorderRadius. circular(25.0),
                    ),
                  ),
                  controller: myImageUrlController,
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          addPostFunc();
                          if(urlValidation==false && emptyValidation==true)
                          {
                            showDialog(
                                context: context,
                                builder:(context){
                                  return AlertDialog(
                                    content: Text('invalid url'),
                                  );
                                }
                            );
                          }
                          if(emptyValidation==false && urlValidation==true){
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('field cannot be empty'),
                                );
                              },
                            );
                          }
                          if(emptyValidation==false && urlValidation==false){
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('field cannot be empty and invalid url'),
                                );
                              },
                            );
                          }
                        },
                        child: Text('  add post'),
                      ),
                    ]
                )
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}
