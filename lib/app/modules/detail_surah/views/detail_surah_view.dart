import 'package:alquran/app/data/models/detail_surah.dart' as detail;
import 'package:alquran/app/data/models/surah.dart';
import 'package:flutter/material.dart';
import '../../../constant/color.dart';
import 'package:get/get.dart';
import '../controllers/detail_surah_controller.dart';
class DetailSurahView extends GetView<DetailSurahController> {
  final Surah surah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            ' Surah',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: false,
        ),
        body: Builder(builder: (context) {
          return ListView(
            padding: EdgeInsets.all(20),
            children: [
              GestureDetector(
                onTap: () => Get.defaultDialog(
                  backgroundColor: Get.isDarkMode
                      ? appPurpleDark.withOpacity(0.9)
                      : appGrey[100],
                  contentPadding: EdgeInsets.all(20),
                  title:
                      "Tafsir ${surah.name?.transliteration?.id?.toUpperCase() ?? 'Error...'}",
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  content: Container(
                    child: Text(
                      "${surah.tafsir?.id ?? 'Tidak ada tafsir pada surah ini'}",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  titlePadding: EdgeInsets.only(top: 10, bottom: 10),
                  middleTextStyle: TextStyle(
                      decorationStyle: TextDecorationStyle.solid,
                      fontFamily: "poppins"),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        colors: [appPurpleDark, appPurpleLight2]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${surah.name?.transliteration?.id?.toUpperCase() ?? 'Error...'}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: appWhite),
                        ),
                        Text(
                          "( ${surah.name?.translation?.id?.toUpperCase() ?? 'Error...'} )",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: appWhite),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'Error...'}",
                          style: TextStyle(fontSize: 15, color: appWhite),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<detail.DetailSurah>(
                  future: controller.getDetailSurah(surah.number.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    //jika tidak punya data
                    if (!snapshot.hasData) {
                      return Center(child: Text("Tidak Ada Data"));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.verses?.length ?? 0,
                      itemBuilder: (context, index) {
                        if (snapshot.data?.verses?.length == 0) {
                          return SizedBox();
                        }
                        detail.Verse? ayat = snapshot.data?.verses?[index];
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          "${surah.number}",
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
                              "${ayat!.text?.arab}",
                              textAlign: TextAlign.end,
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${ayat.text?.transliteration?.en}",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
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
                    );
                  })
            ],
          );
        }));
  }
}
