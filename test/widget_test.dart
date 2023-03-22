import 'dart:convert';

import 'package:alquran/app/data/models/ayat.dart';
import 'package:alquran/app/data/models/juz.dart';
import 'package:http/http.dart' as http;

void main() async {
//   var res =
//       await http.get(Uri.parse("https://api.quran.gading.dev/surah/108/1"));
//   Map<String, dynamic> data = json.decode(res.body)["data"];

// //comvert mapping ayat to model ayat
//   Ayat ayat = Ayat.fromJson(data);
//   print(ayat.tafsir?.id?.short);
  Uri url = Uri.parse("https://api.quran.gading.dev/juz/5");
  var res = await http.get(url);

  Map<String, dynamic> data =
      (json.decode(res.body) as Map<String, dynamic>)["data"];

  //get surah 114 annas, karena mulai dari index ke 0, jadi surah annas ada di index ke 113
  Juz juz = Juz.fromJson(data);
  print(juz.juzStartInfo);
  print(juz.juzEndInfo);
}
