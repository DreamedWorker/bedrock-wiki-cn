import 'package:bedrock_wiki_cn/utils/widget_explanation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xml/xml.dart';

class BasicStageController extends GetxController {

  var viewList = <Widget>[].obs;
  var pageTitle = "文档标题".obs;
  var leftWidgets = <Widget>[].obs;

  @override
  void onInit() {
    super.onInit();
    viewList.add(
        Center(
          child: Text("我们正在载入文档", style: TextStyle(fontSize: 16.sp)),
        )
    );
  }

  void loadLeftMenu(String path) async {
    leftWidgets.clear();
    var fileContext = await rootBundle.loadString(path);
    var document = XmlDocument.parse(fileContext);
    var menuRoot = document.getElement("content")!;
    var menuList = menuRoot.childElements; //这里拿到所有的menu元素
    for(var singleMenu in menuList){
      var subContext = <Widget>[];
      for(var singleElement in singleMenu.childElements){
        subContext.add(WidgetExplain.toWidget(singleElement, this));
      }
      leftWidgets.add(ExpansionTile(title: Text(singleMenu.getAttribute("title")!), children: subContext));
    }
  }

  void loadFile(String path) async {
    var fileContext = await rootBundle.loadString(path);
    var document = XmlDocument.parse(fileContext);
    var page = document.getElement("page")!;
    var pageContext = page.getElement("context")!;
    pageTitle.value = page.getElement("meta-data")!.getElement("doc-title")!.text;
    addElement2Page(pageContext);
  }

  void addElement2Page(XmlElement pageContext) {
    viewList.clear();
    var firstLayer = pageContext.childElements;
    for(var layerElements in firstLayer){ //这里拿到的是context下所有的view
      var viewWidgets = <Widget>[]; //这里装载每个view下的控件
      var innerElements = layerElements.childElements;
      for(var inner in innerElements){
        viewWidgets.add(WidgetExplain.toWidget(inner, this));
      } //致此完成了一个view的解析
      viewList.add(Container(
        margin: EdgeInsets.only(bottom: 24.sp),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: viewWidgets),
      ));
    }
  }
}