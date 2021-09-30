import 'package:flutter/material.dart';
import 'post.dart';

class Display extends StatelessWidget {
  final Post post;
  final Function delete;
  final Function edit;
  final num index;
  Display({required this.post,required this.delete,required this.index,required this.edit});
  // const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.0,5.0,0.0,5.0),
            child: Text(
              post.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
          ),
          SizedBox(height:6.0),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0,0.0,0.0,5.0),
            child: Text(
              post.description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Image.network(post.imageUrl,height: 250.0),
          SizedBox(height: 10.0),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton.icon(
                  onPressed: () {edit();},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green[600])
                  ),
                  icon: Icon(Icons.edit),
                  label: Text('Edit the Post', style: TextStyle(color: Colors.grey[200]),)),
              SizedBox(width: 5.0),
              TextButton.icon(onPressed: () {delete();},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green[600])
                  ),
                  icon: Icon(Icons.delete),
                  label: Text('Delete the Post', style: TextStyle(color: Colors.grey[200]),))
            ],
          )
        ],
      ),
    );
  }
}
