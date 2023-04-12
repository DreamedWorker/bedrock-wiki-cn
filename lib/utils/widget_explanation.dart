import 'package:bedrock_wiki_cn/controller/basic_stage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xml/xml.dart';

class WidgetExplain {
  static Widget toWidget(XmlElement element, BasicStageController controller) {
    var widgetType = element.name.toString();
    switch (widgetType) {
      case "title":
        {
          return Container(
            margin: EdgeInsets.only(bottom: 8.sp),
            child: Text(element.text,
                style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 2.25.sp,
                    decorationColor: const Color.fromRGBO(215, 215, 215, 1))),
          );
        }
      case "para":
        {
          var paraContextIterable = element.childElements;
          var paraList = <Widget>[];
          for (var sentence in paraContextIterable) {
            if (sentence.name.toString() == "hint") {
              paraList.add(toWidget(sentence, controller));
            } else {
              paraList
                  .add(Text(sentence.text, style: TextStyle(fontSize: 16.sp)));
              paraList.add(SizedBox(height: 12.sp));
            }
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: paraList,
          );
        }
      case "bar":
        {
          if (element.getAttribute("title")! == "指南") {
            return Container(
              padding: EdgeInsets.all(4.sp),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(4.sp)
              ),
              child: Text("指南", style: TextStyle(fontSize: 14.sp, color: Colors.white)),
            );
          } else if (element.getAttribute("title")! == "更多") {
            return Container(
              padding: EdgeInsets.all(4.sp),
              decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(4.sp)
              ),
              child: Text("更多", style: TextStyle(fontSize: 14.sp, color: Colors.white)),
            );
          } else {
            return const Text("解析此字段时出现异常");
          }
        }
      case "box":
        {
          Color color = const Color.fromRGBO(2, 2, 2, 0);
          if (element.getAttribute("color")! == "green") {
            color = const Color.fromRGBO(63, 175, 124, 1);
          } else if (element.getAttribute("color")! == "red") {
            color = const Color.fromRGBO(231, 191, 0, 1);
          }
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(color: color),
            margin: EdgeInsets.all(4.sp),
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(element.getElement("subtitle")!.text,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 16.sp),
                Text(element.getElement("part")!.text,
                    style: TextStyle(fontSize: 16.sp, color: Colors.white))
              ],
            ),
          );
        }
      case "hint":
        {
          return Container(
              padding: EdgeInsets.all(4.sp),
              child: Text(element.text,
                  style: TextStyle(fontSize: 12.sp, color: Colors.amber)));
        }
      case "item":
        {
          var name = element.text;
          return ListTile(
            title: Text(name, style: TextStyle(fontSize: 14.sp)),
            onTap: () {
              controller.loadFile(element.getAttribute("order")!);
            },
          );
        }
      case "delimiter":
        {
          return Container(
            width: double.infinity,
            height: 1.5.sp,
            decoration: const BoxDecoration(color: Colors.black54),
          );
        }
      case "list":
        {
          var listContext = <Widget>[];
          for (var singleItem in element.childElements) {
            if (singleItem.getAttribute("type")! == "normal") {
              listContext.add(Text("～    ${singleItem.text}",
                  style: TextStyle(fontSize: 16.sp)));
            } else if (singleItem.getAttribute("type")! == "link") {
              listContext.add(GestureDetector(
                onTap: () {
                  controller.loadFile(singleItem.getAttribute("href")!);
                },
                child: Text("～    ${singleItem.text}",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color.fromRGBO(28, 78, 216, 1))),
              ));
            }
          }
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listContext);
        }
      case "hyperlink":
        {
          var address = element.getAttribute("address")!;
          return GestureDetector(
            onTap: () async {
              await launchUrl(Uri.parse(address));
            },
            child: Text(element.text,
                style: TextStyle(fontSize: 16.sp, color: Colors.blueAccent)),
          );
        }
      case "native":
        {
          return Container(
              width: double.infinity,
              height: 200.sp,
              margin: EdgeInsets.all(4.sp),
              child: FutureBuilder(
                  future: rootBundle.loadString(element.getAttribute("path")!),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(data: snapshot.data, selectable: true);
                    } else {
                      return const Text("markdown-解析失败");
                    }
                  }));
        }
      default:
        {
          return const Text("解析此字段时出现异常");
        }
    }
  }
}
