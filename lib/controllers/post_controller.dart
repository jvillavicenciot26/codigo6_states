import 'package:codigo6_states/services/remote/api_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  RxList posts = [].obs;
  RxBool isLoading = false.obs;
  RxString name = "Juan".obs;

  ApiService apiService = ApiService();

  @override
  onInit() {
    super.onInit();
    getPosts();
  }

  getPosts() async {
    isLoading(true);
    posts(await apiService.getPosts());
    isLoading(false);
  }
}
