import 'package:fast_inspection/local_db/business_db_provider.dart';
import 'package:fast_inspection/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialize();
  runApp(const ProviderScope(child: MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BusinessDbProvider businessDbProvider = BusinessDbProvider();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
      routes: const {},
    );
  }
}

/* 
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _indicator = Text('Yet to Start');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: getProgress, child: Text('Save PDF')),
            Center(
              child: _indicator,
            )
          ],
        ),
      ),
    );
  }

  void getProgress() async {
    setState(() {
      _indicator = CircularProgressIndicator();
    });
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(savePdf, receivePort.sendPort);
    SendPort sendPort = await receivePort.first;
    List<int> imageData = await _readImageData('image.jpg');
    List<int>? bytes = await sendReceive(sendPort, imageData);

    setState(() {
      _indicator = Text('success');
    });

    //Get the external storage directory
    Directory directory = (await getApplicationDocumentsDirectory());
    //Get the directory path
    String path = directory.path;
    //Create an empty file to write the PDF data
    File file = File('$path/Output.pdf');
    //Write the PDF data
    await file.writeAsBytes(bytes!, flush: true);
    //Open the PDF document on the mobile
    OpenFile.open('$path/Output.pdf');
  }

  Future sendReceive(SendPort send, message) {
    ReceivePort receivePort = ReceivePort();
    send.send([message, receivePort.sendPort]);
    return receivePort.first;
  }

  static savePdf(SendPort sendPort) async {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    var msg = await receivePort.first;
    SendPort replyPort = msg[1];
    replyPort.send(await generateInvoice(msg[0]));
  }

  Future<List<int>> _readImageData(String name) async {
    final ByteData data = await rootBundle.load('assets/images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  static Future<List<int>> generateInvoice(List<int> imageData) async {
    final PdfImage image = PdfBitmap(imageData);
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Add page to the PDF
    final PdfPage page = document.pages.add();
    //Get page client size
    final Size pageSize = page.getClientSize();
    //Create a PdfGrid

    page.graphics.drawImage(image, Rect.fromLTWH(0, 0, pageSize.width, 100));
    //Generate PDF grid.
    PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 4);
    //Create the header row of the grid.
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    //Set style
    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(22, 111, 105));
    headerRow.style.textBrush = PdfSolidBrush(PdfColor(187, 167, 85));
    headerRow.cells[0].value = 'SR NO';
    headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[1].value = 'PRODUCT IMAGE';
    headerRow.cells[1].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[2].value = 'PRODUCT DETAILS';
    headerRow.cells[2].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[3].value = 'QUANTITY';
    headerRow.cells[3].stringFormat.alignment = PdfTextAlignment.center;
    //Add rows
    int sr_no = 1;
    for (int i = 0; i < 1000; i++) {
      final PdfGridRow row = grid.rows.add();
      row.cells[0].value = 'sample text';
      row.cells[0].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[0].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
      row.cells[1].value = image;
      //row.cells[1].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[1].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
      row.cells[2].value =
          '   DESIGN NO - test\n   G. WT - test\n   D. WT - test\n   COLOUR - test';
      row.cells[2].stringFormat.alignment = PdfTextAlignment.left;
      row.cells[2].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
      row.cells[3].value = 'Test';
      row.cells[3].stringFormat.alignment = PdfTextAlignment.center;
      row.cells[3].stringFormat.lineAlignment = PdfVerticalAlignment.middle;
      grid.rows[i].height = 160;
    }
    grid.columns[0].width = 70;
    grid.columns[3].width = 70;

    for (int i = 0; i < headerRow.cells.count; i++) {
      headerRow.cells[i].style.cellPadding =
          PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
    }
    final PdfStringFormat format = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle);
    //Add a new row
    final PdfGridRow totalRow = grid.rows.add();
    totalRow.cells[0].value = 'TOTAL QUANTITY';
    //Set column span
    totalRow.cells[0].columnSpan = 3;
    totalRow.cells[0].style.stringFormat = format;
    totalRow.height = 25;

    totalRow.cells[3].value = 'sum';
    totalRow.cells[3].stringFormat.alignment = PdfTextAlignment.center;
    totalRow.cells[3].stringFormat.lineAlignment = PdfVerticalAlignment.middle;

    grid.draw(page: page, bounds: Rect.fromLTWH(0, 120, 0, 0));
    //Save the PDF document
    final List<int> bytes =await document.save();
    //Dispose the document.
    document.dispose();

    return bytes;
    // //Get external storage directory
    // Directory directory = (await getApplicationDocumentsDirectory());
    // //Get directory path
    // String path = directory.path;
    // print(path);
    // //Create an empty file to write PDF data
    // File file = File('$path/CART-CATALOGUE.pdf');
    // //Write PDF data
    // await file.writeAsBytes(bytes, flush: true);
    // //Open the PDF document in mobile
    // OpenFile.open('$path/CART-CATALOGUE.pdf');
  }
}
 */