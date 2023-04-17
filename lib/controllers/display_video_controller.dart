import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok_getx/models/video_model.dart';

class DisplayVideoController extends GetxController {
  final Rx<List<VideoModel>> _videoList = Rx<List<VideoModel>>([]);

  List<VideoModel> get videoList => _videoList.value;
  @override
  void onInit() {
    super.onInit();

    _videoList.bindStream(FirebaseFirestore.instance
        .collection("videos")
        .snapshots()
        .map((event) {
      List<VideoModel> retVal = [];
      for (var element in event.docs) {
        retVal.add(VideoModel.fromMap(element));
      }
      return retVal;
    }));
  }
  // var videos = <VideoModel>[].obs;
  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchVideos();
  // }

  // Future<void> fetchVideos() async {
  //   try {
  //     final QuerySnapshot querySnapshot = await _db.collection('videos').get();

  //     for (var element in querySnapshot.docs) {
  //       videos.add(VideoModel.fromMap(element));
  //     }
  //   } catch (e) {
  //     e.toString();
  //   }
  // }
}
