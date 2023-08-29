import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  const PdfView({super.key,required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(
          child: SfPdfViewer.file(
              File(path),
              password: 'syncfusion')));
  }
}
