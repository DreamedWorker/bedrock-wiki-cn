import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class MarkdownViewer extends StatelessWidget {
  final String data;
  const MarkdownViewer(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return MarkdownWidget(data: data);
  }
}