import 'package:api_call2/model/user_model.dart';
import 'package:api_call2/services/api_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var getUsers = <UserModel>[].obs;
  ApiService apiService = ApiService();
  var postLoading = true.obs;

  @override
  void onInit() {
    callpostmethod();
    super.onInit();
  }

  callpostmethod() async {
    try {
      postLoading.value = true;
      var result = await apiService.fetchUsers();
      if (result != null) {
        getUsers.assignAll(result);
      } else {
        print('null');
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }
}
