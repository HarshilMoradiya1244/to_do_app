import 'package:flutter/material.dart';
import 'package:to_do_app/modal/to_do_modal.dart';

import '../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txttitle = TextEditingController();
  TextEditingController txtdetail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "To-Do",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.grid_on_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.circle_outlined,
                  color: Colors.black,
                ))
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            TodoModel todo = Global.g1.todoList[index];
            return InkWell(
              onDoubleTap: () {
                Global.g1.todoList.remove(index);
              },
              onLongPress: () {
                TodoModel s1 = Global.g1.todoList[index];
                txttitle.text = s1.title!;
                txtdetail.text = s1.details!;
                updateDialog(index);
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.amber.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title : ${todo.title}",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          Text(
                            "Details : ${todo.details}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: Global.g1.todoList.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'todo').then((value) {
              setState(() {});
            });
          },
          backgroundColor: Colors.amberAccent,
          child: const Icon(
            Icons.add,
            color: Colors.black,
            size: 25,
          ),
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
