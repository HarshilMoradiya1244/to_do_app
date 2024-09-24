import 'package:get/get.dart';
import 'package:to_do_app/screen/home/model/home_model.dart';
import 'package:to_do_app/utils/db_helper.dart';
import 'package:to_do_app/utils/shared_prefrences.dart';


class HomeController extends GetxController {
  RxList<DBModel> dataList = <DBModel>[].obs;
  RxList<Map> likedToDos = <Map>[].obs;


  Future<void> getData() async {
    DBHelper helper = DBHelper();
    List<DBModel> data = await helper.readDB(DBModel());
    dataList.value = data;
  }

  Future<void> updateData(DBModel dbModel) async {
    DBHelper helper = DBHelper();
    await helper.updateDB(dbModel);
    getData();
  }

  @override
  void onInit() {
    super.onInit();
    getLikedToDos();
  }

  Future<void> getLikedToDos() async {
    List<Map<String, dynamic>> todos = await ShareHelper.getLikedToDos();
    likedToDos.assignAll(todos);
  }

  Future<void> deleteLikedToDo(String id) async {
    await ShareHelper.deleteLikedToDo(id);
    getLikedToDos();
  }

}


