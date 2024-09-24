import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/screen/home/controller/home_controller.dart';
import 'package:to_do_app/utils/color_list.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Liked To-Dos"),
        ),
        body: Obx(() {
          if (controller.likedToDos.isEmpty) {
            return const Center(child: Text("No liked to-dos"));
          } else {
            return ListView.builder(
              itemCount: controller.likedToDos.length,
              itemBuilder: (context, index) {
                final todo = controller.likedToDos[index];
                return Container(
                  margin: const EdgeInsets.all(15),
                  height: MediaQuery.sizeOf(context).height * 0.18,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors[index],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${todo['title']}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "${todo['description']}",
                          style: const TextStyle(fontSize: 15),
                        ),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "18/06/2024", // You can update this to display actual date
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.deleteLikedToDo(todo['id']);
                              },
                              icon: const Icon(Icons.delete_outline),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}