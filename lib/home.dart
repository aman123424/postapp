import 'package:flutter/material.dart';
import 'package:learning_task1/post.dart';
import 'displayposts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Post> posts =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Post App', style: TextStyle(color: Colors.grey[200]),),
        backgroundColor: Colors.green[600],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: [ Column(children: [
          Column(
            children: posts
                .map((post) => Display(
              post: post,
              delete: () {
                setState(() {
                  posts.remove(post);
                });
              },
              index: posts.indexOf(post),
              edit: () async {
                dynamic result= await Navigator.pushNamed(context,'/editpost',
                    arguments: {
                      'title':post.title,
                      'description':post.description,
                      'imgUrl':post.imageUrl,
                    }
                );
                setState(() {
                  posts[posts.indexOf(post)]=
                      Post(title: result['title'], description: result['description'],imageUrl: result['imgUrl'],);
                });
              },
            ))
                .toList(),
          ),
          Row(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    dynamic result= await Navigator.pushNamed(context, '/addpost');
                    setState(() {
                      posts.add(
                          Post(title: result['title'], description: result['description'],imageUrl: result['imgUrl'],)
                      );
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green[600])
                  ),
                  icon: Icon(Icons.add),
                  label: Text('Add a new Post',
                  style: TextStyle(
                    color: Colors.grey[200]
                  ),)),
            ],
          )
        ]),
        ],
      ),
    );
  }
}