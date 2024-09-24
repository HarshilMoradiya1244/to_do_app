import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/screen/home/controller/home_controller.dart';
import 'package:to_do_app/utils/color_list.dart';
import 'package:to_do_app/utils/db_helper.dart';
import 'package:to_do_app/utils/shared_prefrences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "To-Do",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.grid_view_sharp)),
            IconButton(
                onPressed: () {
                  Get.toNamed("favorite");
                }, icon: const Icon(Icons.favorite_border)),
          ],
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.dataList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(15),
                height: MediaQuery.sizeOf(context).height * 0.22,
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
                        "${controller.dataList[index].title}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "${controller.dataList[index].description}",
                        style: const TextStyle(fontSize: 15),
                      ),
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "18/06/2024",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () async {
                                Map<String, dynamic> likedToDo = {
                                  "id": controller.dataList[index].id,
                                  "title": controller.dataList[index].title,
                                  "description": controller.dataList[index].description,
                                };
                                await ShareHelper.saveLikedToDo(likedToDo);
                                Get.snackbar('Liked', 'To-Do saved to liked screen');
                              },
                              icon: const Icon(Icons.favorite_border),
                              color: Colors.black,
                            ),
                          ),                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                DBHelper helper = DBHelper();
                                helper.deleteDB(
                                    id: "${controller.dataList[index].id}");
                                controller.getData();
                              },
                              icon: const Icon(Icons.delete_outline),
                              color: Colors.black,
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('add');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
