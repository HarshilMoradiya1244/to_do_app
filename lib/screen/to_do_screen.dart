import 'package:flutter/material.dart';
import 'package:to_do_app/modal/to_do_modal.dart';

import '../utils/global.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  TextEditingController txttitle = TextEditingController();
  TextEditingController txtdetail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "To-Do",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, 'home');
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.circle_outlined,
                  color: Colors.black,
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Add To-Do",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      TodoModel details = TodoModel(
                          title: txttitle.text, details: txtdetail.text);
                      Global.g1.todoList.add(details);
                      Navigator.pop(context, [txttitle.text, txtdetail.text]);
                    },
                    icon: const Icon(
                      Icons.save,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.grid_view_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Column(
                children: [
                  Text(
                    "Priority",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Low"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Medium"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("High"),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Urgent"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txttitle,
                decoration: InputDecoration(
                    hintText: "Add Title",
                    label: Text("Add Title"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtdetail,
                decoration: InputDecoration(
                    label: Text("Add Detail"),
                    hintText: "Add Detail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
