import 'dart:ui';

import 'package:bedrock_wiki_cn/controller/basic_stage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BasicStage extends StatelessWidget {
  final globalController = Get.put(BasicStageController());
  final args = Get.arguments as Map;

  BasicStage({super.key});

  @override
  Widget build(BuildContext context) {
    globalController.loadLeftMenu("public/doc/content.xml");
    globalController.loadFile(args["order"]);
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(globalController.pageTitle.value)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.account_box))
          ],
        ),
        body: Container(
          width: MediaQueryData.fromWindow(window).size.width,
          child: Row(
            children: [
              Obx(() => Container(
                    width: MediaQueryData.fromWindow(window).size.width * 0.2,
                    decoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: Color.fromRGBO(218, 218, 218, 1)))),
                    child: ListView(
                      children: [
                        Column(
                          children: globalController.leftWidgets.value,
                        )
                      ],
                    ),
                  )),
              Obx(() => Container(
                  width: MediaQueryData.fromWindow(window).size.width * 0.8,
                  padding: EdgeInsets.only(left: 16.sp, top: 24.sp, right: 8.sp),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: globalController.viewList.value,
                      ),
                    ],
                  )))
            ],
          ),
        ));
  }

  Widget drawerItems() {
    return ListView(
      children: [
        ExpansionTile(
          title: Text("初学者指南", style: TextStyle(fontSize: 16.sp)),
          children: [
            ListTile(title: Text("简明导入", style: TextStyle(fontSize: 14.sp))),
            ListTile(title: Text("附加包说明", style: TextStyle(fontSize: 14.sp)))
          ],
        )
      ],
    );
  }
}
