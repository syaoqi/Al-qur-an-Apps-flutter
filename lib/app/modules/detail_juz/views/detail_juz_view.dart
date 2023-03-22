import 'package:alquran/app/data/models/juz.dart' as juz;
import 'package:flutter/material.dart';
import '../../../constant/color.dart';
import 'package:get/get.dart';

import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  final juz.Juz detailJuz = Get.arguments;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          title: Text('Juz ${detailJuz.juzStartSurahNumber}'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: detailJuz.verses?.length ?? 0,
            itemBuilder: (context, index) {
              if (detailJuz.verses == null || detailJuz.verses?.length == 0) {
                return Center(
                  child: Text("Tidak ada data."),
                );
              }
              juz.Verses ayat = detailJuz.verses![index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: appPurpleLight2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Get.isDarkMode
                                    ? "assets/logo/octagonal2.png"
                                    : "assets/logo/octagonal.png"),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${ayat.number?.inSurah}",
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark_add_outlined,
                                  size: 30,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${ayat.text?.arab}",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${ayat.text?.transliteration?.en}",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${ayat.translation?.id}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              );
            },
          ),
        ));
  }
}
