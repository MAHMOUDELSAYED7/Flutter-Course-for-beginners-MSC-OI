import 'package:flutter/material.dart';
import 'package:flutter_course_for_beginners_msc/my_snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//! from Backend

  List<Map> postsList = [
    {
      "name": "Mahmoud",
      "time": "9:45",
      "title": "hello every body",
      "subTitle": "flutter Course"
    },
    {
      "name": "Abdelrhim",
      "time": "8:00",
      "title": "hello Flutter Developers",
      "subTitle": "flutter Course"
    },
    {
      "name": "Nancy",
      "time": "6:45",
      "title": "Welcome to Flutter",
      "subTitle": "flutter Course"
    },
    {
      "name": "Mahmoud",
      "time": "11:45",
      "title": "hello every body",
      // "subTitle": "flutter Course"
    },
    {
      "name": "Mahmoud",
      "time": "9:45",
      "title": "hello every body",
      "subTitle": "flutter Course"
    },
  ];

  showAddPostDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Post"),
        actionsAlignment: MainAxisAlignment.center,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  label: Text("title"), hintText: "write something"),
            ),
            TextField(
              controller: subTitleController,
              decoration: InputDecoration(
                  label: Text("Sub Title"), hintText: "write content"),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue)),
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    if (titleController.text.trim().isNotEmpty) {
                      postsList.add({
                        "name": "Mahmoud",
                        "time":
                            "${DateTime.now().hour}:${DateTime.now().minute}",
                        "title": titleController.text,
                        "subTitle": subTitleController.text.trim().isNotEmpty
                            ? subTitleController.text
                            : null
                      });
                      showMySnackBar(context, "Post add successfully!...");
                      setState(() {});
                      titleController.clear();
                      subTitleController.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Add"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: postsList.isEmpty
          ? Center(
              child: Text("No Posts..."),
            )
          : ListView.builder(
              key: UniqueKey(),
              itemCount: postsList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Card(
                    color: Colors.red,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.only(right: 40),
                            child:
                                const Icon(Icons.delete, color: Colors.white))),
                  ),
                  key: ValueKey(index.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    postsList.removeAt(index);
                    showMySnackBar(context, "Post deleted successfully.");
                    setState(() {});
                  },
                  child: _BuildPostCard(
                    name: postsList[index]["name"],
                    time: postsList[index]["time"],
                    title: postsList[index]["title"],
                    subTitle: postsList[index]["subTitle"],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddPostDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

class _BuildPostCard extends StatelessWidget {
  const _BuildPostCard(
      {required this.name,
      required this.time,
      required this.title,
      this.subTitle});
  final String name;
  final String time;
  final String title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: subTitle != null ? Text(subTitle!) : null,
        leading: CircleAvatar(
          child: Text(name[0].toUpperCase()),
        ),
        trailing: Text(time),
      ),
    );
  }
}

//! Listview
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home"),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//       ),
//       body: ListView(
//         children: [
//           Container(
//             width: 200,
//             height: 200,
//             margin: EdgeInsets.all(5),
//             color: Colors.red,
//             alignment: Alignment.center,
//             child: Text(
//               "Hello",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//           Container(
//             width: 200,
//             height: 200,
//             margin: EdgeInsets.all(5),
//             color: Colors.blue,
//             alignment: Alignment.center,
//             child: Text(
//               "Hello",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//           Container(
//             width: 200,
//             height: 200,
//             margin: EdgeInsets.all(5),
//             color: Colors.green,
//             alignment: Alignment.center,
//             child: Text(
//               "Hello",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//           Container(
//             width: 200,
//             height: 200,
//             margin: EdgeInsets.all(5),
//             color: Colors.yellow,
//             alignment: Alignment.center,
//             child: Text(
//               "Hello",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//           Container(
//             width: 200,
//             height: 200,
//             margin: EdgeInsets.all(5),
//             color: Colors.red,
//             alignment: Alignment.center,
//             child: Text(
//               "Hello",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//           Container(
//             width: 200,
//             height: 200,
//             margin: EdgeInsets.all(5),
//             color: Colors.purple,
//             alignment: Alignment.center,
//             child: Text(
//               "Hello",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//           Container(
//             width: 200,
//             height: 200,
//             margin: EdgeInsets.all(5),
//             color: Colors.pink,
//             alignment: Alignment.center,
//             child: Text(
//               "Hello",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//           Container(
//             width: 200,
//             height: 200,
//             margin: EdgeInsets.all(5),
//             color: Colors.blueGrey,
//             alignment: Alignment.center,
//             child: Text(
//               "Hello",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//           Container(
//             width: 200,
//             height: 200,
//             margin: EdgeInsets.all(5),
//             color: Colors.brown,
//             alignment: Alignment.center,
//             child: Text(
//               "Hello",
//               style: TextStyle(fontSize: 22),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
