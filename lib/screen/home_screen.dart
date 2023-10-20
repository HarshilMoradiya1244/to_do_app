import 'package:flutter/material.dart';
import 'package:to_do_app/modal/to_do_modal.dart';
import 'package:to_do_app/utils/color.dart';

import '../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txttitle = TextEditingController();
  TextEditingController txtdetail = TextEditingController();
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("To-Do"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                },
                icon: Icon(isGrid ? Icons.grid_view_outlined : Icons.list)),
          ],
        ),
        body: isGrid
            ? ListView.builder(
          itemCount: Global.g1.todoList.length,
          itemBuilder: (context, index) {
            TodoModel data = Global.g1.todoList[index];
            return InkWell(
              onDoubleTap: () {
                setState(() {
                  Global.g1.todoList.removeAt(index);
                });
              },
              onLongPress: () {
                TodoModel t1 = Global.g1.todoList[index];
                txttitle.text = t1.title!;
                txtdetail.text = t1.details!;
                updateDialog( index);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:boxcolorList[index] ,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.title}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${data.details}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
            : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: Global.g1.todoList.length,
          itemBuilder: (context, index) {
            TodoModel data = Global.g1.todoList[index];
            return InkWell(
              onDoubleTap: () {
                setState(() {
                  Global.g1.todoList.removeAt(index);
                });
              },
              onLongPress: () {
                TodoModel t1 = Global.g1.todoList[index];
                txttitle.text = t1.title!;
                txtdetail.text = t1.title!;
                updateDialog(index);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.title}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${data.details}",
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "todo").then(
                  (value) {
                setState(() {});
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<dynamic> updateDialog(int index) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txttitle,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtdetail,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "details"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Global.g1.todoList[index] = TodoModel(
                    title: txttitle.text,
                    details: txtdetail.text,
                  );
                });
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
