import 'dart:convert';

import 'package:get/get.dart';
import '../../../data/models/juz.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/surah.dart';

class HomeController extends GetxController {
  RxBool isDark = false.obs;
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah");
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }

  //untuk mendapatkan semua juz, perlu di looping karna kita tidak di siapkan datanya ketika dicari dengan cara /juz
  Future<List<Juz>> getAllJuz() async {
    List<Juz> allJuz = [];
    for (int i = 1; i <= 30; i++) {
      Uri url = Uri.parse("https://api.quran.gading.dev/juz/$i");
      var res = await http.get(url);

      Map<String, dynamic> data =
          (json.decode(res.body) as Map<String, dynamic>)["data"];

      Juz juz = Juz.fromJson(data);
      allJuz.add(juz);
    }
    return allJuz;
  }
}
