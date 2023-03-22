import 'package:alquran/app/constant/color.dart';
import 'package:alquran/app/data/models/juz.dart' as juz;
import 'package:alquran/app/data/models/surah.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      controller.isDark.value = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Al-Quran",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              size: 30,
              color: appWhite,
            ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamualaikum",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Colors.grey,
                    fontSize: 15),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [appPurpleDark, appPurpleLight2],
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () => Get.toNamed(Routes.LAST_READ),
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -60,
                            right: -3,
                            child: Opacity(
                              opacity: 0.6,
                              child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                  "assets/logo/alquran.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: appWhite,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Terakhir Dibaca",
                                      style: TextStyle(color: appWhite),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Al-Fatihah",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: appWhite),
                                ),
                                Text(
                                  "Ayat No:1",
                                  style: TextStyle(color: appWhite),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              TabBar(
                labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "PoppinsRegular"),
                tabs: [
                  Tab(
                    text: "Surah",
                  ),
                  Tab(
                    text: "Juz",
                  ),
                  Tab(
                    text: "Bookmark",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        //jika tidak punya data
                        if (!snapshot.hasData) {
                          return Center(child: Text("Tidak Ada Data"));
                        }
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              Surah surah = snapshot.data![index];
                              return ListTile(
                                onTap: () => Get.toNamed(Routes.DETAIL_SURAH,
                                    arguments: surah),
                                leading: Obx(() => Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(controller
                                                  .isDark.isTrue
                                              ? "assets/logo/octagonal2.png"
                                              : "assets/logo/octagonal.png"),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${surah.number}",
                                        ),
                                      ),
                                    )),
                                title: Text(
                                  "${surah.name?.transliteration?.id ?? 'Error...'}",
                                ),
                                subtitle: Text(
                                  "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'Error...'}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: appGrey,
                                  ),
                                ),
                                trailing: Text(
                                  "${surah.name?.short ?? 'Error...'}",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                    FutureBuilder<List<juz.Juz>>(
                      future: controller.getAllJuz(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        //jika tidak punya data
                        if (!snapshot.hasData) {
                          return Center(child: Text("Tidak Ada Data"));
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            juz.Juz detailJuz = snapshot.data![index];
                            return ListTile(
                              onTap: () => Get.toNamed(Routes.DETAIL_JUZ,
                                  arguments: detailJuz),
                              leading: Obx(() => Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            controller.isDark.isTrue
                                                ? "assets/logo/octagonal2.png"
                                                : "assets/logo/octagonal.png"),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${index + 1}",
                                      ),
                                    ),
                                  )),
                              title: Text(
                                "Juz ${index + 1}",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(top: 15),
                              subtitle: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mulai dari ${detailJuz.juzStartInfo}",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    "Sampai dengan ${detailJuz.juzEndInfo}",
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Center(
                      child: Text("data3"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.isDarkMode
          //     ? Get.changeTheme(themeLight)
          //     : Get.changeTheme(themeDark);
          Get.changeTheme(Get.isDarkMode ? themeLight : themeDark);
          controller.isDark.toggle();
        },
        child: Obx(() => Icon(Icons.color_lens_rounded,
            size: 40,
            color: controller.isDark.isTrue ? appPurpleLight2 : appWhite)),
      ),
    );
  }
}
