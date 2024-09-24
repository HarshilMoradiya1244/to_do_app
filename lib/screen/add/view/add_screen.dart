import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/screen/home/controller/home_controller.dart';
import 'package:to_do_app/screen/home/model/home_model.dart';
import 'package:to_do_app/utils/db_helper.dart';


class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  HomeController controller = Get.put(HomeController());
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("To-Do"),
          leading: IconButton(onPressed: (){
            Get.back();
          },icon: const Icon(Icons.arrow_back_ios_new),),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.dark_mode_outlined)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("Add To-Do",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          DBHelper helper = DBHelper();
                          helper.insertDB(DBModel(
                            title: txtTitle.text,
                            description: txtDesc.text,
                          ),);
                          txtTitle.clear();
                          txtDesc.clear();
                          controller.getData();
                          Get.back();
                        }, icon: const Icon(Icons.save)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.grid_view_sharp)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.restart_alt)),
                  ],
                ),
                const SizedBox(height: 20,),
                Column(
                  children: [
                    const Text("Priority",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Container(
                        height: MediaQuery.sizeOf(context).height*0.05,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(),
                        ),child:const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Low  |",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        Text("Medium  |",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        Text("High  |",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        Text("Urgent",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ],
                    )
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Title Is Not Available':null,
                  controller: txtTitle,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Title"),
                    hintText: "ToDo",
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  validator: (value) => value!.isEmpty ? 'Description Is Empty':null,
                  controller: txtDesc,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Description"),
                    hintText: "Write Here",
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    const Text("Pick Date"),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month)),
                    const Spacer(),
                    const Text("18/06/2024"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
