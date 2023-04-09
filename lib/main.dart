import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1024, 768),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Bedrock Wiki 简体中文版',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.green, applyElevationOverlayColor: true),
            home: Scaffold(
                appBar: AppBar(
                  title: const Text("基岩版 Wiki 首页"),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.construction),
                        tooltip: "贡献"),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.document_scanner),
                        tooltip: "访问微软文档"),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.contact_page),
                        tooltip: "交流讨论")
                  ],
                ),
                body: Container(
                  width: MediaQueryData.fromWindow(window).size.width,
                  child: ListView(
                    children: [
                      headlineWithImage(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          functionCard(
                              "初学者指南",
                              "逐步式教程，面向第一次接触附加包的用户。",
                              "public/assets/images/homepage/crafting_table_0.png",
                            170.sp
                          ),
                          SizedBox(width: 16.sp),
                          functionCard(
                              "讨论",
                              "加入讨论群组以了解学习附加包制作，或向其他创作者寻求帮助。",
                              "public/assets/images/homepage/discord.png",
                            170.sp
                          )
                        ],
                      ),
                      SizedBox(height: 16.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          functionCard(
                              "实体",
                              "初学者指南：学习并掌握行为包中实体文件的结构。\n\n排除问题：学习如何解决在修改实体时出现的一些常见问题，如实体纹理不显示。",
                              "public/assets/images/homepage/spawn_egg_30.png",
                            225.sp
                          ),
                          SizedBox(width: 16.sp),
                          functionCard(
                              "物品",
                              "初学者指南：帮助你向游戏添加一个最基础的物品。\n\n1.16+版本物品的变动：了解并学习新的实验性玩法物品的编写。",
                              "public/assets/images/homepage/iron_pickaxe_0.png",
                            225.sp
                          )
                        ],
                      ),
                      SizedBox(height: 16.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          functionCard(
                              "方块",
                              "初学者指南：帮助你向游戏添加一个最基础的方块。\n\n1.16+版本物品的变动：了解并学习新的实验性玩法方块的编写。",
                              "public/assets/images/homepage/diamond_ore_0.png",
                              225.sp
                          ),
                          SizedBox(width: 16.sp),
                          functionCard(
                              "脚本（Scripting）",
                              "初学者指南：学习 scripting-api 基本功能的使用。\n\n自定义指令：教你如何向游戏内添加自定义的指令。",
                              "public/assets/images/homepage/scripting.png",
                              225.sp
                          )
                        ],
                      ),
                      SizedBox(height: 16.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          functionCard(
                              "世界结构生成",
                              "初学者指南：帮助你了解如何创建新的生物群落、地形结构及矿物等随世界生成的内容。",
                              "public/assets/images/homepage/buildplate.png",
                              170.sp
                          ),
                          SizedBox(width: 16.sp),
                          functionCard(
                              "做出贡献",
                              "此wiki基于社区维护的英文版翻译而来，如果你有改进意见或问题，欢迎与我们取得联系。",
                              "public/assets/images/homepage/writable_book_0.png",
                              170.sp
                          )
                        ],
                      ),
                      SizedBox(height: 64.sp),
                      disclaimerPane()
                    ],
                  ),
                )),
          );
        });
  }

  Widget headlineWithImage() {
    return Container(
      width: MediaQueryData.fromWindow(window).size.width,
      height: 100.sp,
      margin: EdgeInsets.only(top: 24.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("public/favicon.ico", width: 64.sp, height: 64.sp),
              SizedBox(width: 16.sp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bedrock Wiki 中文版",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp,
                    decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 2.25.sp,
                      decorationColor: const Color.fromRGBO(215, 215, 215, 1)
                    ),
                  ),
                  SizedBox(height: 12.sp),
                  Text(
                      "这是一个Minecraft基岩版技术分享网站，它涵盖了文档、教程和一些一般的入门信息。",
                    style: TextStyle(fontSize: 16.sp),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget disclaimerPane(){
    return Container(
      width: MediaQueryData.fromWindow(window).size.width,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(228, 228, 228, 1)
      ),
      padding: EdgeInsets.all(12.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bedrock Wiki 英文版由：", style: TextStyle(fontSize: 12.sp)),
              SizedBox(width: 4.sp),
              GestureDetector(
                onTap: (){},
                child: Text("Bedrock—OSS", style: TextStyle(fontSize: 12.sp, color: const Color.fromRGBO(28, 78, 216, 1))),
              ),
              SizedBox(width: 4.sp),
              Text("编写并发布", style: TextStyle(fontSize: 12.sp))
            ],
          ),
          SizedBox(height: 8.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("中文版由：", style: TextStyle(fontSize: 12.sp)),
              SizedBox(width: 4.sp),
              GestureDetector(
                onTap: (){},
                child: Text("BlueDream", style: TextStyle(fontSize: 12.sp, color: const Color.fromRGBO(28, 78, 216, 1))),
              ),
              SizedBox(width: 4.sp),
              Text("翻译、开源、发布", style: TextStyle(fontSize: 12.sp))
            ],
          ),
          SizedBox(height: 8.sp),
          Text("\"Minecraft\"是 Mojang AB 的商标，本Wiki的英文版、此简体中文翻译版与微软或 Mojang AB 没有任何关联。",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp))
        ],
      ),
    );
  }

  Widget functionCard(String title, String message, String imgPath, double mHeight){
    return Container(
      width: 374.sp,
      height: mHeight,//170.sp,266
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        border: Border.all(width: 2.sp, color: const Color.fromRGBO(228, 231, 235, 1)),
        borderRadius: BorderRadius.circular(8.sp)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(imgPath, width: 56.sp, height: 56.sp),
              SizedBox(width: 16.sp),
              Text(title, style: TextStyle(
                fontSize: 30.sp,
                color: const Color.fromRGBO(28, 78, 216, 1),
                decoration: TextDecoration.underline,
                decorationColor: const Color.fromRGBO(215, 215, 215, 1),
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 2.25.sp,
              ))
            ],
          ),
          SizedBox(height: 16.sp),
          Text(message, style: TextStyle(fontSize: 16.sp))
        ],
      ),
    );
  }
}
