import 'dart:io';
import 'dart:isolate';

import 'package:fast_inspection/constants/file_storage.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../constants/constant_values.dart';
import '../constants/long_texts.dart';
import '../local_db/business_db_provider.dart';
import '../models/business.dart';

class PdfClass {
  void formPdf() async {
    final note1 = getStringAsync(k11ThermalNote1, defaultValue: '');
    final note2 = getStringAsync(k11ThermalNote2, defaultValue: '');
    final note3 = getStringAsync(k11ThermalNote3, defaultValue: '');
    final note4 = getStringAsync(k11ThermalNote4, defaultValue: '');
    final note5Controller = getStringAsync(k11ThermalNote5, defaultValue: '');
    final image1 = getStringAsync(k11ThermalPic1, defaultValue: '');
    final image2 = getStringAsync(k11ThermalPic2, defaultValue: '');
    final image3 = getStringAsync(k11ThermalPic3, defaultValue: '');
    final image4 = getStringAsync(k11ThermalPic4, defaultValue: '');
    final image5 = getStringAsync(k11ThermalPic5, defaultValue: '');

    final PdfDocument document = PdfDocument();
// Add a PDF page and draw text.
    document.pages.add().graphics.drawString(
        'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(0, 0, 150, 20));
// Save the document.
    File('HelloWorld.pdf').writeAsBytes(await document.save());
// Dispose the document.
    document.dispose();
  }

  static savePdf(SendPort sendPort) async {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    var msg = await receivePort.first;
    SendPort replyPort = msg[1];
    replyPort.send(await generateInvoice(msg[0]));
  }

  static Future<String> generateInvoice(String nifd) async {
    //Create a PDF document.
    final PdfDocument document = PdfDocument();
    //Add page to the PDF
    final PdfPage page0 = document.pages.add();
    final PdfPage page = document.pages.add();
    //Get page client size
    final Size pageSize = page.getClientSize();
    //Draw rectangle
    /*  page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(0, 0, pageSize.width, pageSize.height),
      pen: PdfPen(PdfColor(142, 170, 219))); */
    //final Uint8List imageData = File('assets/images/logo.png').readAsBytesSync();
    final ByteData bytesddd = await rootBundle.load('assets/images/logo.png');
    final ByteData bytes2222 =
        await rootBundle.load('assets/images/checker.png');
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> kitchenListStore =
        prefs.getStringList(k5KitchenNumberList) ?? ['1'];
    print(' kitchen list $kitchenListStore');
    List<String> bathRoomListStore =
        prefs.getStringList(k5BathroomNumberList) ?? ['1'];
    List<String> livingRoomListStore =
        prefs.getStringList(k5LivingRoomNumberList) ?? ['1'];
    List<String> buildingRoomListStore =
        prefs.getStringList(k5BuilldingNumberList) ?? ['1'];
    List<String> laundryRoomListStore =
        prefs.getStringList(k5LuandryNumberList) ?? ['1'];
    List<String> buidExtRoomListStore =
        prefs.getStringList(k5BuidExtNumberList) ?? ['1'];
    final Uint8List imageData = bytesddd.buffer.asUint8List();
    final Uint8List checkerImageData = bytes2222.buffer.asUint8List();
//Load the image using PdfBitmap.
    final PdfBitmap image = PdfBitmap(imageData);
//Draw the image to the PDF page.
    /*  page.graphics.drawImage(
        image,
        Rect.fromCenter(
            center: Offset(pageSize.width / 2, 120), height: 200, width: 200));
 */
    //Generate PDF grid.
    // final PdfGrid grid = getGrid();
    //Draw the header section by creating text element
    //final PdfLayoutResult result = drawHeader(page, pageSize);
    PdfLayoutResult layoutResult =
        showReport('PROPERTY INSPECTION REPORT', page0.size, page0);

    Business? business = await BusinessDbProvider.getBusinesses() ??
        Business(
            id: 1,
            businessName: '',
            businessAddress: '',
            businessPhone: '',
            businessEmail: '',
            businessWebsite: '',
            imagePath: '');

    layoutResult = showLogo(getStringAsync('', defaultValue: ''),
        business.imagePath, pageSize, page0);
    showBusinessName(' ${business.businessName}', page0.size, page0);
    showBusinessAddress(business.businessAddress, page0.size, page0, 310);
    showBusinessAddress(business.businessEmail, page0.size, page0, 340);
    showBusinessAddress(business.businessWebsite, page0.size, page0, 370);
    showBusinessAddress(business.businessPhone, page0.size, page0, 400);

    layoutResult = showPropertyImage(getStringAsync('', defaultValue: ''),
        getStringAsync(k1PropertyList, defaultValue: ''), pageSize, page0);
    layoutResult = showInspectionAddress(
        '${getStringAsync(k1IAAddressLine1)} ${getStringAsync(k1IACity)} ${getStringAsync(k1IAState)} ${getStringAsync(k1IAPostal)} ',
        page0.size,
        page0);
    PdfLayoutResult layoutResult1 = showImageBig(
        getStringAsync('', defaultValue: ''),
        getStringAsync('', defaultValue: ''),
        pageSize,
        page);
    // String text1 =
    //     "This inspection and report meet Australian Standard AS 4349.1-2007 Pre-Purchase Inspections –Residential Buildings’ and Australian Standard AS 4349.3 Inspections of Buildings - Timber Pest Inspections.";
    // String text2 =
    //     'PO Box 573 Newtown NSW 2042\n\nPh: 0492 961 622\n\nEmail: info@innerwestpropertyinspections.com.au\n\nwww.innerwestpropertyinspections.com.au';
    // layoutResult1 = showText(page, text1, text2);
    // String text3 = "Header";

    // PdfLayoutResult layoutResult1 = showHeader('Business', layoutResult);
    /*  PdfLayoutResult layoutResult1 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult,
        header: "Business Name",
        text: getStringAsync(k1PropertyBusinessName, defaultValue: '')); */

    /*  layoutResult1 = showImage('Picture',
        getStringAsync(k1PropertyFacade, defaultValue: ''), layoutResult1); */
    // layoutResult1 = showHeaderNewPage('  ', document.pages.add());
    layoutResult1 = showHeader2('Property facade', layoutResult1);
    final newImageList = getStringAsync(k1PropertyList, defaultValue: '');
    List<String> listman = newImageList.split('J@^J');
    listman.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    print('objechhhhhht${listman.length}');
    for (int i = 0; i < listman.length; i++) {
      if (i == 0) {
        print('objechhhhhht${listman[0]}');
        layoutResult1 = showImage('', listman[0], layoutResult1);
      }
      if (i == 1) {
        print('objechhhhhht${listman[1]}');
        layoutResult1 = showImageSide('', listman[1], layoutResult1);
      }

      if (i == 2) {
        print('objechhhhhht${listman[2]}');
        layoutResult1 = showImageDown('', listman[2], layoutResult1);
      }

      if (i == 3) {
        print('objechhhhhht${listman[3]}');
        layoutResult1 = showImageDownSide('', listman[3], layoutResult1);
      }
    }

    layoutResult1 = showHeaderAfterBig2(
        '     ', layoutResult1, listman.length > 2 ? 400 : 200);
    layoutResult1 = showHeader2('Inspection Address', layoutResult1);
    PdfLayoutResult layoutResult2 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult1,
        header: "Address Line 1",
        text: getStringAsync(k1IAAddressLine1, defaultValue: ''));

    PdfLayoutResult layoutResult3 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult2,
        header: "City",
        text: getStringAsync(k1IACity, defaultValue: ''));
    showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult3,
        header: "Report number",
        text: getStringAsync(k1IAReport_number, defaultValue: ''));

    PdfLayoutResult layoutResult4 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult3,
        header: "State / Province / Region",
        text: getStringAsync(k1IAState, defaultValue: ''));
    PdfLayoutResult layoutResult5 = showHeader('', layoutResult4);

    layoutResult4 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult2,
        header: "Postal/Zip Code",
        text: getStringAsync(k1IAState, defaultValue: ''));
    // layoutResult4 = showHeader('', layoutResult4);
    layoutResult5 = showHeaderNewPage('  ', document.pages.add());
    PdfLayoutResult layoutResult6 = showHeader(
        '''As requested and agreed with the Client, the inspection carried out by the Building Consultant and TimberPest Detection Consultant is a Standard Property & Timber Pest Report comprising a Property Report anda Timber Pest Report.

“Client” means the person or persons, for whom the Report was carried out or their Principal (i.e. theperson or persons for whom the report is being obtained).

“Building Consultant” means a person, business or company who is qualified and experienced to undertake a pre-purchase inspection in accordance with Australian Standard AS 4349.1-2007 ‘Inspection of Buildings. Part 1: Pre-Purchase Inspections – Residential Buildings’. The consultant must also meet any Government licensing requirement, where applicable.

“Timber Pest Detection Consultant” means person who meets the minimum skills requirement set out in the current Australian Standard AS 4349.3 Inspections of Buildings. Part 3: Timber Pest Inspection Reports or state/territory legislation requirements beyond this Standard, where applicable.

This Standard Property & Timber Pest Report was produced for the exclusive use of the Client. The consultant, their company or firm is not liable for any reliance placed on this report by any third party.''',
        layoutResult5);
    final newPagepnj12wq = document.pages.add();
    PdfLayoutResult layoutResult7 =
        showHeaderNewPage(' 1. Client Details', newPagepnj12wq);
    // PdfLayoutResult layoutResult7 =
    //     showHeader2('1. Client Details', layoutResultpageplkloqq);
    PdfLayoutResult layoutResult8 = showHeader2('Client Name', layoutResult7);
    PdfLayoutResult layoutResult9 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult8,
        header: "First",
        text: getStringAsync(k2CDFirstName, defaultValue: ''));

    PdfLayoutResult layoutResult10 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult9,
        header: "Last",
        text: getStringAsync(k2CDLastName, defaultValue: ''));
    PdfLayoutResult layoutResult11 = space('', layoutResult10);
    layoutResult10 = showHeader2('', layoutResult10);
    PdfLayoutResult layoutResult13 =
        showHeader2('Client address', layoutResult10);

    PdfLayoutResult layoutResult14 = showTextFullRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult13,
        header: "Address Line 1",
        text: getStringAsync(k2CDAddressLine1, defaultValue: ''));
    PdfLayoutResult layoutResult15 = showTextFullRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult14,
        header: "Address Line 2",
        text: getStringAsync(k2CDAddressLine2, defaultValue: ''));
    PdfLayoutResult layoutResult16 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult15,
        header: "City",
        text: getStringAsync(k2CDCity, defaultValue: ''));
    layoutResult16 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult16,
        header: "State / Province / Region",
        text: getStringAsync(k2CDState, defaultValue: ''));

    PdfLayoutResult layoutResult17 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult16,
        header: "Postal / Zip Code",
        text: getStringAsync(k2CDPostal, defaultValue: ''));
    layoutResult17 = showHeader('', layoutResult17);
    PdfLayoutResult layoutResult19 = showTextWithRectangleLong(
        pageSize: pageSize,
        layoutResult: layoutResult17,
        header: "Client email",
        text: getStringAsync(k2CDEmail, defaultValue: ''));

    PdfLayoutResult layoutResult18 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult19,
        header: "Client phone",
        text: getStringAsync(k2CDPhone, defaultValue: ''));
    final newPagepnj12w = document.pages.add();
    PdfLayoutResult layoutResult20 =
        showHeaderNewPage(' 2. Property Details', newPagepnj12w);

    // PdfLayoutResult layoutResult20 =
    //     showHeader2('2. Property Details', layoutResultpageplkloq);
    // //String age =
    PdfLayoutResult layoutResult21 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult20,
        header: "Approx age of property  years",
        text: getStringAsync(k2PDAge, defaultValue: '0'));

    PdfLayoutResult layoutResult22 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult21,
        header: "Property facade faces",
        text: getStringAsync(k2PDPropertyFacadeF, defaultValue: ''));
    PdfLayoutResult layoutResult23 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult22,
        header: "Type of property",
        text: getStringAsync(k2PDTypeProperty, defaultValue: ''));
    layoutResult23 = showHeader('', layoutResult23);
    PdfLayoutResult layoutResult24 = showHeader(
        'Is the property strata or company title? (If theproperty is under strata or company title only theunit and immediate surrounds were inspected.No inspection of common areas was carried out)',
        layoutResult23);

    PdfLayoutResult layoutResult25 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult24,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k2PDTypePropertyStrata, defaultValue: 'No'));

    PdfLayoutResult layoutResult26 = showTextWithCircleSide(
        pageSize: pageSize,
        layoutResult: layoutResult24,
        header: "  ",
        text: 'No',
        type: getStringAsync(k2PDTypePropertyStrata, defaultValue: 'No'));

    PdfLayoutResult layoutResult27 = showTextWithRectangleLong(
        pageSize: pageSize,
        layoutResult: layoutResult26,
        header: "Occupancy status",
        text: getStringAsync(k2Occupation_status, defaultValue: ''));
    layoutResult27 = showHeader('', layoutResult27);
    layoutResult27 = showHeader('', layoutResult27);
    PdfLayoutResult layoutResult28 =
        showHeader2('Wall construction', layoutResult27);
//wall contruction
    PdfLayoutResult layoutResult29 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult28,
        header: "  ",
        text: getBoolAsync(k2OWallConstructionBrick, defaultValue: false),
        type: 'Brick veneer',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult30 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult29,
        header: "  ",
        text: getBoolAsync(k2OWallConstructionFullBrick, defaultValue: false),
        type: 'Full brick',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult31 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult30,
        header: "  ",
        text: getBoolAsync(k2OWallConstructionTimber, defaultValue: false),
        type: 'Timber frame',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult32 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult31,
        header: "  ",
        text: getBoolAsync(k2OWallConstructionClad, defaultValue: false),
        type: 'Clad',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult33 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult32,
        header: "  ",
        text: getBoolAsync(k2OWallConstructionSheet, defaultValue: false),
        type: 'Sheet',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult34 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult33,
        header: "  ",
        text: getBoolAsync(k2OWallConstructionCombination, defaultValue: false),
        type: 'Combination',
        checkerImageData: checkerImageData);

    //wall contruction
    final newPagepnj12wqq = document.pages.add();
    PdfLayoutResult layoutResult35 =
        showHeaderNewPage('Roof construction', newPagepnj12wqq);
//Roof construction
    // PdfLayoutResult layoutResult35 =
    //     showHeader2('Roof construction', layoutResultpageplkloqqq);

    PdfLayoutResult layoutResult36 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult35,
        header: "  ",
        text: getBoolAsync(k2ORoofConstructionMetal, defaultValue: false),
        type: 'Metal corrugated',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult37 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult36,
        header: "  ",
        text: getBoolAsync(k2ORoofConstructionConcrete, defaultValue: false),
        type: 'Concrete tile',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult38 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult37,
        header: "  ",
        text: getBoolAsync(k2ORoofConstructionAsbestos, defaultValue: false),
        type: 'Asbestos',
        checkerImageData: checkerImageData);

    PdfLayoutResult layoutResult39 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult38,
        header: "  ",
        text: getBoolAsync(k2ORoofConstructionTerracotta, defaultValue: false),
        type: 'Terracotta tile',
        checkerImageData: checkerImageData);
    /* final newPagepnjn = document.pages.add();
  PdfLayoutResult layoutResultpageplklo = showHeaderNewPage('  ', newPagepnjn); */
    PdfLayoutResult layoutResult40 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult39,
        header: "  ",
        text: getBoolAsync(k2ORoofConstructionFlat, defaultValue: false),
        type: 'Flat',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult41 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult40,
        header: "  ",
        text: getBoolAsync(k2ORoofConstructionPitched, defaultValue: false),
        type: 'Pitched',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult42 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult41,
        header: "  ",
        text: getBoolAsync(k2ORoofConstructionCombination, defaultValue: false),
        type: 'Combination',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult43 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult42,
        header: "  ",
        text: getBoolAsync(k2ORoofConstructionOther, defaultValue: false),
        type: 'Other',
        checkerImageData: checkerImageData);
    layoutResult43 = showHeader('', layoutResult43);
    //Roof construction
    //floor consruction
    PdfLayoutResult layoutResult44 =
        showHeader2('Floor construction', layoutResult43);

    PdfLayoutResult layoutResult45 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult44,
        header: "  ",
        text:
            getBoolAsync(k2OfloorConstructionTimberBrick, defaultValue: false),
        type: 'Timber on brick piers',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult46 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult45,
        header: "  ",
        text: getBoolAsync(k2OfloorConstructionTimberSand, defaultValue: false),
        type: 'Timber on sandstone piers',
        checkerImageData: checkerImageData);

    PdfLayoutResult layoutResult47 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult46,
        header: "  ",
        text: getBoolAsync(k2OfloorConstructionConcrete, defaultValue: false),
        type: 'Concrete Slab',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult48 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult47,
        header: "  ",
        text:
            getBoolAsync(k2OfloorConstructionCombination, defaultValue: false),
        type: 'Combination',
        checkerImageData: checkerImageData);
    final newPagepnj342 = document.pages.add();
    PdfLayoutResult layoutResultpagejk32 = showHeaderNewPage(
        'Accommodation and significant ancillaries', newPagepnj342);

    PdfLayoutResult layoutResult49 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult48,
        header: "  ",
        text: getBoolAsync(k2OfloorConstructionOther, defaultValue: false),
        type: 'Other',
        checkerImageData: checkerImageData);
    //floor consruction

    //others
    PdfLayoutResult layoutResult50 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResultpagejk32,
        header: 'No of bedrooms',
        text: getStringAsync(k2ONoBedroom, defaultValue: ''));

    PdfLayoutResult layoutResult51 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult50,
        header: 'No of living rooms',
        text: getStringAsync(k2ONolivingroom, defaultValue: ''));
    //lll

    PdfLayoutResult layoutResult52 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult51,
        header: 'No of kitchens',
        text: getStringAsync(k2ONoKitchen, defaultValue: ''));

    PdfLayoutResult layoutResult53 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult52,
        header: 'No of bathrooms',
        text: getStringAsync(k2ONobathroom, defaultValue: ''));

    PdfLayoutResult layoutResult54 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult53,
        header: 'No of toilets',
        text: getStringAsync(k2ONotoilet, defaultValue: ''));
    PdfLayoutResult layoutResult55 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult54,
        header: 'No of laundries',
        text: getStringAsync(k2ONolaundries, defaultValue: ''));
    layoutResult55 = showTextWithRectangleBig(
        pageSize: pageSize,
        layoutResult: layoutResult55,
        header: 'Notes',
        text: getStringAsync(k2ONoNote, defaultValue: ''));
    // layoutResult55 = showHeaderAfterBig('      ', layoutResult55);
    //others
    // page2 end
    //page 3 start

    layoutResult55 =
        showHeaderNewPage(' 3. Inspection Details', document.pages.add());
    // PdfLayoutResult layoutResult56 =
    //     showHeader2('3. Inspection Details', layoutResult55);
    PdfLayoutResult layoutResult57 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult55,
        header: 'Date of inspection',
        text: getStringAsync(k3DateInspection, defaultValue: ''));

    PdfLayoutResult layoutResult58 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult57,
        header: 'Date of report',
        text: getStringAsync(k3DateReport, defaultValue: ''));

    PdfLayoutResult layoutResult59 = showTextWithRectangleLong(
        pageSize: pageSize,
        layoutResult: layoutResult58,
        header: 'Type of inspection',
        text: getStringAsync(k3TypeInspection, defaultValue: ''));

    PdfLayoutResult layoutResult60 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult59,
        header: 'Weather at time of inspection',
        text: getStringAsync(k3Weatherspection, defaultValue: ''));
    // PdfLayoutResult layoutResultsp = showHeader2('      ', layoutResult60);
    PdfLayoutResult layoutResult61 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult60,
        header: 'Inspectors name',
        text: getStringAsync(k3InspectorsName, defaultValue: ''));

    layoutResult61 = showHeader2('', layoutResult61);
    layoutResult61 = showHeader2('Inaccessible areas', layoutResult61);
    //kk
    PdfLayoutResult layoutResult62 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult61,
        header: "  ",
        text: getBoolAsync(k3InaccessibleAreaRoofExt, defaultValue: false),
        type: 'Roof exterior',
        checkerImageData: checkerImageData);

    PdfLayoutResult layoutResult63 = showTextWithRecCheckSide(
        pageSize: pageSize,
        layoutResult: layoutResult62,
        header: "  ",
        text: getBoolAsync(k3InaccessibleAreaPartRoofExt, defaultValue: false),
        type: 'Part roof exterior',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult64 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult63,
        header: "  ",
        text: getBoolAsync(k3InaccessibleAreaRoofInterior, defaultValue: false),
        type: 'Roof interior',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult65 = showTextWithRecCheckSide(
        pageSize: pageSize,
        layoutResult: layoutResult64,
        header: "  ",
        text: getBoolAsync(k3InaccessibleAreaPartRoofInt, defaultValue: false),
        type: 'Part roof interior',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult66 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult65,
        header: "  ",
        text: getBoolAsync(k3InaccessibleAreaSubFloor, defaultValue: false),
        type: 'Sub floor',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult67 = showTextWithRecCheckSide(
        pageSize: pageSize,
        layoutResult: layoutResult66,
        header: "  ",
        text: getBoolAsync(k3InaccessibleAreaPartSubFloor, defaultValue: false),
        type: 'Part sub floor',
        checkerImageData: checkerImageData);

    //layoutResult55 = showHeaderNewPage('  ', document.pages.add());
    PdfLayoutResult layoutResult68 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult67,
        header: "  ",
        text: getBoolAsync(k3InaccessibleAreaLockedRoom, defaultValue: false),
        type: 'Locked room',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult69 = showTextWithRecCheckSide(
        pageSize: pageSize,
        layoutResult: layoutResult68,
        header: "  ",
        text: getBoolAsync(k3InaccessibleAreaLockedGar, defaultValue: false),
        type: 'Locked garage',
        checkerImageData: checkerImageData);

    //lkl
    PdfLayoutResult layoutResult70 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult69,
        header: "  ",
        text: getBoolAsync(k3InaccessibleAreaGrannyFLat, defaultValue: false),
        type: 'Locked granny flat',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult71 = showTextWithRectangleBigSmall(
        pageSize: pageSize,
        layoutResult: layoutResult70,
        header: 'Notes on inaccessible areas',
        text: getStringAsync(k3NoteInaccessibleArea, defaultValue: ''));
    layoutResult71 = showHeaderNewPage('khali', document.pages.add());

    PdfLayoutResult layoutResult72 = showHeaderAfterBigSmall(
        'Which items obstructed visual inspection of building elements',
        layoutResult71);
    PdfLayoutResult layoutResult73 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult72,
        header: "  ",
        text: getBoolAsync(k3buildCupboard, defaultValue: false),
        type: 'Built in cupboards',
        checkerImageData: checkerImageData);

    PdfLayoutResult layoutResult74 = showTextWithRecCheckSide(
        pageSize: pageSize,
        layoutResult: layoutResult73,
        header: "  ",
        text: getBoolAsync(k3buildFloorCovering, defaultValue: false),
        type: 'Floor coverings',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult75 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult73,
        header: "  ",
        text: getBoolAsync(k3buildFurniture, defaultValue: false),
        type: 'Furniture',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult76 = showTextWithRecCheckSide(
        pageSize: pageSize,
        layoutResult: layoutResult75,
        header: "  ",
        text: getBoolAsync(k3buildStoredItem, defaultValue: false),
        type: 'Stored items',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult77 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult76,
        header: "  ",
        text: getBoolAsync(k3buildExteriorVegetation, defaultValue: false),
        type: 'Exterior vegetation',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult78 = showTextWithRecCheckSide(
        pageSize: pageSize,
        layoutResult: layoutResult77,
        header: "  ",
        text: getBoolAsync(k3buildACRoof, defaultValue: false),
        type: 'A/C in roof interior',
        checkerImageData: checkerImageData);
    PdfLayoutResult layoutResult79 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult78,
        header: "  ",
        text: getBoolAsync(k3buildInsulationRoof, defaultValue: false),
        type: 'Insulation in roof interior',
        checkerImageData: checkerImageData);
    layoutResult79 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult79,
        header: "  ",
        text: getBoolAsync(k3buildstoredGoodRoof, defaultValue: false),
        type: 'Stored goods in roof interior',
        checkerImageData: checkerImageData);

    // layoutResult79 = showHeaderNewPage('  ', document.pages.add());
    layoutResult79 = showHeader2('', layoutResult79);
    PdfLayoutResult layoutResult80 = showTextWithRectangleBig(
        pageSize: pageSize,
        layoutResult: layoutResult79,
        header: 'Notes on inaccessible areas',
        text: getStringAsync(k3NoteInaccessibleArea, defaultValue: ''));
    PdfLayoutResult layoutResult81 = showHeaderAfterBig(
        'Was there evidence of major or structural defects', layoutResult80);

    PdfLayoutResult layoutResult82 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult81,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k3StructuralDefects, defaultValue: 'No'));

    PdfLayoutResult layoutResult83 = showTextWithCircleSide(
        pageSize: pageSize,
        layoutResult: layoutResult81,
        header: "  ",
        text: 'No',
        type: getStringAsync(k3StructuralDefects, defaultValue: 'No'));
    PdfLayoutResult layoutResult84 = showTextWithRectangleBig(
        pageSize: pageSize,
        layoutResult: layoutResult82,
        header: 'What were the major or structural defects',
        text: getStringAsync(k3NoteStructuralDefects, defaultValue: ''));

    PdfLayoutResult layoutResult85 = showHeaderAfterBig(
        'Was there evidence of minor defects', layoutResult84);

    PdfLayoutResult layoutResult86 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult85,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k3StructuralMinorDefects, defaultValue: 'No'));

    PdfLayoutResult layoutResult87 = showTextWithCircleSide(
        pageSize: pageSize,
        layoutResult: layoutResult85,
        header: "  ",
        text: 'No',
        type: getStringAsync(k3StructuralMinorDefects, defaultValue: 'No'));

    final newPage = document.pages.add();
    PdfLayoutResult layoutResultpage = showHeaderNewPageLite('khali', newPage);

    PdfLayoutResult layoutResult88 = showTextWithRectangleBig(
        pageSize: pageSize,
        layoutResult: layoutResultpage,
        header: 'For minor defects see below',
        text: getStringAsync(k3NoteStructuralMinorDefects, defaultValue: ''));

    PdfLayoutResult layoutResult89 = showHeaderAfterBig(
        'Were any major safty hazards detected', layoutResult88);
    PdfLayoutResult layoutResult90 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult89,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k3StructuralMinorHazards, defaultValue: 'No'));

    PdfLayoutResult layoutResult91 = showTextWithCircleSide(
        pageSize: pageSize,
        layoutResult: layoutResult89,
        header: "  ",
        text: 'No',
        type: getStringAsync(k3StructuralMinorHazards, defaultValue: 'No'));

    PdfLayoutResult layoutResult92 = showTextWithRectangleBig(
        pageSize: pageSize,
        layoutResult: layoutResult91,
        header: 'Was there evidence of minor defects',
        text: getStringAsync(k3NoteStructuralSafetyHarzard, defaultValue: ''));

    layoutResult92 = showHeader('', layoutResult92);
    // layoutResult92 = showHeader('', layoutResult92);
    layoutResult92 = showHeaderAfterBig2('', layoutResult92, 10);
    PdfLayoutResult layoutResult93 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult92,
        header: 'The property presents in condition',
        text: getStringAsync(k3PropertyCondition, defaultValue: ''));
    /*  PdfLayoutResult layoutResult94 = showImage(
        'Picture',
        getStringAsync(k3PropertyConditionImage, defaultValue: ''),
        layoutResult93); */

    var newImageList1 =
        getStringAsync(k3PropertyConditionImage, defaultValue: '');
    List<String> listman1 = newImageList1.split('J@^J');
    listman1.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

    for (int i = 0; i < listman1.length; i++) {
      if (i == 0) {
        layoutResult93 = showImage('', listman1[0], layoutResult93);
      }
      if (i == 1) {
        print('objechhhhhht${listman[1]}');
        layoutResult93 = showImageSide('', listman1[1], layoutResult93);
      }

      if (i == 2) {
        print('objechhhhhht${listman[2]}');
        layoutResult93 = showImageDown('', listman1[2], layoutResult93);
      }

      if (i == 3) {
        print('objechhhhhht${listman[3]}');
        layoutResult93 = showImageDownSide('', listman1[3], layoutResult93);
      }
    }
    layoutResult93 = showHeaderAfterBig2(
        '     ', layoutResult93, listman1.isNotEmpty ? 200 : 0);

    PdfLayoutResult layoutResult95 = showTextWithRectangleBigSide(
        pageSize: pageSize,
        layoutResult: layoutResult93,
        header: 'Notes',
        text: getStringAsync(k3NotePropertyConditionImage, defaultValue: ''));
    final newPage2 = document.pages.add();
    PdfLayoutResult layoutResultpage2 = showHeaderNewPage(' ', newPage2);
    layoutResult95 = showHeader('', layoutResult95);
    layoutResult95 = showHeader('', layoutResult95);
    PdfLayoutResult layoutResult96 =
        showHeaderAfterBig('4. Terms and Conditions', layoutResult95);
    PdfLayoutResult layoutResult97 =
        showTextLarge(layoutResult96, LongTexts.privacy);
    layoutResult97 = showHeaderNewPage(
        '5. Inspection Results - Interior', document.pages.add());
    // PdfLayoutResult layoutResultopp =
    //     showHeader('5. Inspection Results - Interior', layoutResult97);
    PdfLayoutResult layoutResult98 = showHeader2('Kitchen', layoutResult97);
    PdfLayoutResult layoutResult100 = layoutResult98;
    int i = 1;
    for (String value in kitchenListStore) {
      // int j = i + 1;
      //PdfLayoutResult layoutResult9p = showHeader('   ', layoutResult100);
      PdfLayoutResult layoutResult99 =
          showHeader2('Kitchen $value', layoutResult100);
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult99,
          header: 'Floor',
          text: getStringAsync('k5Kitchen1Floor$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Walls',
          text: getStringAsync('k5Kitchen1Wall$value',
              defaultValue: 'Satisfactory'));
      if (i == 3) {
        layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      }
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Doors and windows',
          text: getStringAsync('k5Kitchen1DoorsWindows$value',
              defaultValue: 'Satisfactory'));

      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Ceiling',
          text: getStringAsync('k5Kitchen1Ceiling$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Benchtop',
          text: getStringAsync('k5Kitchen1BenchTop$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Taps',
          text: getStringAsync('k5Kitchen1Taps$value',
              defaultValue: 'Satisfactory'));
      /*  if (i == 1) {
        layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      } */
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Cupboards',
          text: getStringAsync('k5Kitchen1Cupboard$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Range hood',
          text: getStringAsync('k5Kitchen1RangeHood$value',
              defaultValue: 'Satisfactory'));
      /*    layoutResult100 = showImage(
          'Picture',
          getStringAsync('k5Kitchen1Picture$value', defaultValue: ''),
          layoutResult100); */

      var newImageList1 =
          getStringAsync('k5Kitchen1Picture$value', defaultValue: '');
      List<String> listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('Picture', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showHeaderNewPage(' ', document.pages.add());
          layoutResult100 =
              showImageDownNewPage('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 =
              showImageDownSideNewPage('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.isNotEmpty ? 200 : 0);
      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync('k5NoteKitchen1$value', defaultValue: ''));
      layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      i++;
    }
    i = 0;
    // layoutResult100 = showHeader('    ', layoutResult100);

    layoutResult100 = showHeader2('Bathroom', layoutResult100);

    for (String value in bathRoomListStore) {
      // int j = i + 1;
      layoutResult100 = showHeader2('Bathroom $value', layoutResult100);
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Wall tiles',
          text: getStringAsync('k5Bathroom1WallTiles$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Floor tiles',
          text: getStringAsync('k5Bathroom1FloorTiles$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Vanity',
          text: getStringAsync('k5Bathroom1Vanity$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Shower',
          text: getStringAsync('k5Bathroom1Shower$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Floor waste',
          text: getStringAsync('k5Bathroom1FloorWaste$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Door',
          text: getStringAsync('k5Bathroom1rDoor$value',
              defaultValue: 'Satisfactory'));

      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Window',
          text: getStringAsync('k5Bathroom1Window$value',
              defaultValue: 'Satisfactory'));
      /*  layoutResult100 = showImage(
          'Picture',
          getStringAsync('', defaultValue: ''),
          layoutResult100); */
      //imge
      var newImageList1 =
          getStringAsync('k5Bathroom1Picture$value', defaultValue: '');
      List<String> listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('Picture', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          layoutResult100 = showHeaderNewPage('', document.pages.add());
          // print('objechhhhhht${listman[2]}');
          layoutResult100 =
              showImageDownNewPage('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 =
              showImageDownSideNewPage('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.isNotEmpty ? 200 : 0);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync('k5Bathroom1Note$value', defaultValue: ''));
      layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      i++;
    }
    //llpl
    i = 0;

    //layoutResult100 = showHeader2('Living/dining area', layoutResult100);
    //layoutResult100 = showHeader('Living/dining area', layoutResult100);
    layoutResult100 = showHeader2('Living/dining area', layoutResult100);
    for (String value in livingRoomListStore) {
      // int j = i + 1;
      layoutResult100 =
          showHeader2('Living/dining area $value', layoutResult100);
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Walls',
          text: getStringAsync('k5Living1WallTiles$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Floor',
          text: getStringAsync('k5Living1FloorWaste$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Windows',
          text: getStringAsync('k5Living1FloorTiles$value',
              defaultValue: 'Satisfactory'));

      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Door',
          text: getStringAsync('k5Living1Vanity$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Ceiling',
          text: getStringAsync('k5Living1Shower$value',
              defaultValue: 'Satisfactory'));
      /*    
 */
      /* layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Window',
        text: getStringAsync('k5Bathroom1Window$value',
            defaultValue: 'Satisfactory')); */
      /*   if (i == 0) {
        layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      } */
      /*  layoutResult100 = showImage(
          'Picture',
          getStringAsync('k5Living1Picture$value', defaultValue: ''),
          layoutResult100); */

      var newImageList1 =
          getStringAsync('k5Living1Picture$value', defaultValue: '');
      List<String> listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('Picture', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          layoutResult100 = showHeaderNewPage('', document.pages.add());
          // print('objechhhhhht${listman[2]}');
          layoutResult100 =
              showImageDownNewPage('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 =
              showImageDownSideNewPage('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.isNotEmpty ? 200 : 0);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync('k5Living1Note$value', defaultValue: ''));

      layoutResult100 = showHeaderNewPage('', document.pages.add());

      i++;
    }

    //laundry
    i = 0;
    layoutResult100 = showHeader2('Laundry', layoutResult100);

    //layoutResult100 = showHeaderDynamic('Laundry', layoutResult100);

    for (String value in laundryRoomListStore) {
      // int j = i + 1;
      layoutResult100 = showHeader2('Laundry $value', layoutResult100);
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Walls',
          text: getStringAsync('k5Laundry1WallTiles$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Floor',
          text: getStringAsync('k5Laundry1FloorTiles$value',
              defaultValue: 'Satisfactory'));

      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Ceiling',
          text: getStringAsync('k5Laundry1Vanity$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Taps',
          text: getStringAsync('k5Laundry1Shower$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Floor waste',
          text: getStringAsync('k5Laundry1FloorWaste$value',
              defaultValue: 'Satisfactory'));
      /*   if (i == 0) {
      layoutResult100 = showHeaderNewPage('  ', document.pages.add());
    } */
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Door',
          text: getStringAsync('k5Laundry1Door$value',
              defaultValue: 'Satisfactory'));
      //layoutResult100 = showHeaderNewPage('  ', document.pages.add());

      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Window',
          text: getStringAsync('k5Laundry1Window$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Tub',
          text: getStringAsync('k5Laundry1Tub$value',
              defaultValue: 'Satisfactory'));

      /* layoutResult100 = showImage(
          'Picture',
          getStringAsync('k5Laundry1Picture$value', defaultValue: ''),
          layoutResult100); */

      var newImageList1 =
          getStringAsync('k5Laundry1Picture$value', defaultValue: '');
      List<String> listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('Picture', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          layoutResult100 = showHeaderNewPage('', document.pages.add());
          // print('objechhhhhht${listman[2]}');
          layoutResult100 =
              showImageDownNewPage('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 =
              showImageDownSideNewPage('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.isNotEmpty ? 200 : 0);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync('k5Laundry1Note$value', defaultValue: ''));
      layoutResult100 = showHeaderNewPage('', document.pages.add());
      i++;
    }

    //luandary

    //Hallway/Foyer etc
    i = 0;
    layoutResult100 = showHeader2('Hallway/Foyer etc', layoutResult100);

    //layoutResult100 = showHeader('Hallway/Foyer etc', layoutResult100);

    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Walls',
        text:
            getStringAsync(k5Hallway1WallTiles, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Floor',
        text:
            getStringAsync(k5Hallway1FloorTiles, defaultValue: 'Satisfactory'));

    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Windows',
        text:
            getStringAsync(k5Hallwayroom1Vanity, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Door',
        text: getStringAsync(k5Hallway1Shower, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Ceiling',
        text:
            getStringAsync(k5Hallway1FloorWaste, defaultValue: 'Satisfactory'));

    /*  layoutResult100 = showTextWithRectangle(
      pageSize: pageSize,
      layoutResult: layoutResult100,
      header: 'Door',
      text: getStringAsync(k5Hallway1Door, defaultValue: 'Satisfactory'));

  layoutResult100 = showTextWithRectangle(
      pageSize: pageSize,
      layoutResult: layoutResult100,
      header: 'Window',
      text: getStringAsync(k5Hallway1Window, defaultValue: 'Satisfactory')); */

    /*  layoutResult100 = showImage('Picture',
        getStringAsync(k5Hallway1Picture, defaultValue: ''), layoutResult100);

 */
    int height = 200;
    newImageList1 = getStringAsync(k5Hallway1Picture, defaultValue: '');
    listman1 = newImageList1.split('J@^J');
    listman1.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

    for (int i = 0; i < listman1.length; i++) {
      if (i == 0) {
        layoutResult100 = showImage('Picture', listman1[0], layoutResult100);
      }
      if (i == 1) {
        // print('objechhhhhht${listman[1]}');
        layoutResult100 = showImageSide('', listman1[1], layoutResult100);
      }

      if (i == 2) {
        // print('objechhhhhht${listman[2]}');
        layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        if (listman1.length == 3) {
          layoutResult100 = showHeaderNewPage('', document.pages.add());
        }
        height = 0;
      }

      if (i == 3) {
        // print('objechhhhhht${listman[3]}');
        layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        layoutResult100 = showHeaderNewPage('', document.pages.add());
      }
    }

    layoutResult100 = showHeaderAfterBig2(
        '     ', layoutResult100, listman1.isNotEmpty ? height : 0);
    //layoutResult100 = showHeaderNewPage('  ', document.pages.add());
    layoutResult100 = showTextWithRectangleBigSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Notes',
        text: getStringAsync(k5Hallway1Note, defaultValue: ''));

    //Hallway/Foyer etc
    //end page 5
    //start page 6
    layoutResult100 = showHeaderNewPage(
        '6. Inspection Results - Exterior', document.pages.add());

    // layoutResult100 =
    //     showHeaderDynamic('6. Inspection Results - Exterior', layoutResult100);
    layoutResult100 = showHeader2('Yard and fences', layoutResult100);
    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Drainage',
        text:
            getStringAsync(k6YardFanceDrainage, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Fences',
        text: getStringAsync(k6YardFanceFences, defaultValue: 'Satisfactory'));

    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Retaining walls',
        text: getStringAsync(k6YardFanceRetainingWall,
            defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Garage/carport',
        text: getStringAsync(k6YardFanceGarage, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Pavement',
        text:
            getStringAsync(k6YardFancePavement, defaultValue: 'Satisfactory'));

    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Taps',
        text: getStringAsync(k6YardFanceTaps, defaultValue: 'Satisfactory'));
    //layoutResult100 = showHeaderNewPage('  ', document.pages.add());
    //
    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Pavers',
        text: getStringAsync(k6YardFancePavers, defaultValue: 'Satisfactory'));

    /*  layoutResult100 = showTextWithRectangle(
      pageSize: pageSize,
      layoutResult: layoutResult100,
      header: 'Range hood',
      text: getStringAsync(k6YardFanceRangeHood, defaultValue: 'Satisfactory')); */
    // layoutResult100 = showHeaderNewPage('  ', document.pages.add());
    /*  layoutResult100 = showImage(
        'Picture',
        getStringAsync(k6YardFanceRangePicture, defaultValue: ''),
        layoutResult100); */
    height = 200;
    newImageList1 = getStringAsync(k6YardFanceRangePicture, defaultValue: '');
    listman1 = newImageList1.split('J@^J');
    listman1.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

    for (int i = 0; i < listman1.length; i++) {
      if (i == 0) {
        layoutResult100 = showImage('Picture', listman1[0], layoutResult100);
      }
      if (i == 1) {
        // print('objechhhhhht${listman[1]}');
        layoutResult100 = showImageSide('', listman1[1], layoutResult100);
      }

      if (i == 2) {
        // print('objechhhhhht${listman[2]}');
        layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        if (listman1.length == 3) {
          layoutResult100 = showHeaderNewPage('', document.pages.add());
        }
        height = 0;
      }

      if (i == 3) {
        // print('objechhhhhht${listman[3]}');
        layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        layoutResult100 = showHeaderNewPage('', document.pages.add());
      }
    }
    layoutResult100 = showHeaderAfterBig2(
        '     ', layoutResult100, listman1.isNotEmpty ? height : 0);

//k6YardFanceRangeNote
    layoutResult100 = showTextWithRectangleBigSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Notes',
        text: getStringAsync(k6YardFanceRangeNote, defaultValue: ''));
    //building
    i = 0;
    layoutResult100 =
        showHeaderNewPage('Building exterior', document.pages.add());

    //layoutResult100 = showHeader('Building exterior', layoutResult100);

    for (String value in buidExtRoomListStore) {
      // int j = i + 1;
      layoutResult100 =
          showHeader2('Building exterior $value', layoutResult100);
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Walls',
          text: getStringAsync('k5BuidExt1WallTiles$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Windows',
          text: getStringAsync('k5BuidExt1FloorTiles$value',
              defaultValue: 'Satisfactory'));

      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Eaves',
          text: getStringAsync('k5BuidExt1Vanity$value',
              defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangleSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Pergola',
          text: getStringAsync('k5BuidExt1Shower$value',
              defaultValue: 'Satisfactory'));

      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Deck',
          text: getStringAsync('k5BuidExt1FloorWaste$value',
              defaultValue: 'Satisfactory'));

      /*  layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Door',
        text: getStringAsync('k5BuidExt1Door$value',
            defaultValue: 'Satisfactory'));

    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Window',
        text: getStringAsync('k5BuidExt1Window$value',
            defaultValue: 'Satisfactory')); */

      /*    layoutResult100 = showImage(
          'Picture',
          getStringAsync('k5BuidExt1Picture$value', defaultValue: ''),
          layoutResult100); */
      height = 200;
      newImageList1 =
          getStringAsync('k5BuidExt1Picture$value', defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('Picture', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
          if (listman1.length == 3) {
            layoutResult100 = showHeaderNewPage('', document.pages.add());
          }
          height = 0;
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
          layoutResult100 = showHeaderNewPage('', document.pages.add());
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.isNotEmpty ? height : 0);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync('k5BuidExt1Note$value', defaultValue: ''));
      layoutResult100 = showHeaderNewPage('', document.pages.add());

      i++;
    }

    //sub floor
    i = 0;
    layoutResult100 = showHeader2('Sub floor', layoutResult100);

    // layoutResult100 = showHeaderDynamic('Sub floor', layoutResult100);

    //  layoutResult100 = showHeader2('Sub floor', layoutResult100);
    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Dryness',
        text:
            getStringAsync(k5SubFloor1WallTiles, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Ventilation',
        text: getStringAsync(k5SubFloor1FloorTiles,
            defaultValue: 'Satisfactory'));

    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Ant caps',
        text: getStringAsync(k5SubFloor1Vanity, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Piers',
        text: getStringAsync(k5SubFloor1Shower, defaultValue: 'Satisfactory'));
    //layoutResult100 = showHeaderNewPage('  ', document.pages.add());
    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'General Condition',
        text: getStringAsync(k5SubFloor1GeneralCondition,
            defaultValue: 'Satisfactory'));
    /*  layoutResult100 = showImage('Picture',
        getStringAsync(k5SubFloor1Picture, defaultValue: ''), layoutResult100); */
    height = 200;
    newImageList1 = getStringAsync(k5SubFloor1Picture, defaultValue: '');
    listman1 = newImageList1.split('J@^J');
    listman1.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

    for (int i = 0; i < listman1.length; i++) {
      if (i == 0) {
        layoutResult100 = showImage('Picture', listman1[0], layoutResult100);
      }
      if (i == 1) {
        // print('objechhhhhht${listman[1]}');
        layoutResult100 = showImageSide('', listman1[1], layoutResult100);
      }

      if (i == 2) {
        // print('objechhhhhht${listman[2]}');
        layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        if (listman1.length == 3) {
          layoutResult100 = showHeaderNewPage('', document.pages.add());
        }
        height = 0;
      }

      if (i == 3) {
        // print('objechhhhhht${listman[3]}');
        layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        layoutResult100 = showHeaderNewPage('', document.pages.add());
      }
    }
    layoutResult100 = showHeaderAfterBig2(
        '     ', layoutResult100, listman1.isNotEmpty ? height : 0);
    layoutResult100 = showTextWithRectangleBigSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Notes',
        text: getStringAsync(k5SubFloor1Note, defaultValue: ''));
//roof exterior
    layoutResult100 = showHeader('    ', layoutResult100);
    layoutResult100 = showHeaderNewPage('  ', document.pages.add());

    //layoutResult100 = showHeader('Roof exterior', layoutResult100);

    layoutResult100 = showHeader2('Roof exterior', layoutResult100);
    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Tiles',
        text: getStringAsync(k5RoofExtTiles, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Sheeting',
        text: getStringAsync(k5RoofExtSheeting, defaultValue: 'Satisfactory'));

    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Flashing',
        text: getStringAsync(k5RoofExtFlashing, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Ridge and mortar',
        text:
            getStringAsync(k5RoofExtRidgeMortar, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Gutters/down pipes',
        text: getStringAsync(k5RoofExtGutters, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'General Condition',
        text: getStringAsync(k5SubFloor1GenCondition,
            defaultValue: 'Satisfactory'));
    /*  layoutResult100 = showTextWithRectangleSide(
      pageSize: pageSize,
      layoutResult: layoutResult100,
      header: 'Level',
      text: getStringAsync(k5RoofExtLevel, defaultValue: 'Satisfactory')); */

    /*    layoutResult100 = showImage(
        'Picture',
        getStringAsync(k5RoofExtLevelPicture, defaultValue: ''),
        layoutResult100); */
    height = 200;
    newImageList1 = getStringAsync(k5RoofExtLevelPicture, defaultValue: '');
    listman1 = newImageList1.split('J@^J');
    listman1.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

    for (int i = 0; i < listman1.length; i++) {
      if (i == 0) {
        layoutResult100 = showImage('Picture', listman1[0], layoutResult100);
      }
      if (i == 1) {
        // print('objechhhhhht${listman[1]}');
        layoutResult100 = showImageSide('', listman1[1], layoutResult100);
      }

      if (i == 2) {
        // print('objechhhhhht${listman[2]}');
        layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        if (listman1.length == 3) {
          layoutResult100 = showHeaderNewPage('', document.pages.add());
        }
        height = 0;
      }

      if (i == 3) {
        // print('objechhhhhht${listman[3]}');
        layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        layoutResult100 = showHeaderNewPage('', document.pages.add());
      }
    }
    layoutResult100 = showHeaderAfterBig2(
        '     ', layoutResult100, listman1.isNotEmpty ? height : 0);

    layoutResult100 = showTextWithRectangleBigSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Notes',
        text: getStringAsync(k5RoofExtLevelNote, defaultValue: ''));

//Roof interior
    layoutResult100 = showHeaderNewPage('Roof interior', document.pages.add());

    //layoutResult100 = showHeader2('', layoutResult100);

    // layoutResult100 = showHeader('Roof interior', layoutResult100);

    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Dryness',
        text: getStringAsync(k5RoofIntDryness, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Insulation',
        text:
            getStringAsync(k5RoofIntInsulation, defaultValue: 'Satisfactory'));

    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Sarking',
        text: getStringAsync(k5RoofIntSarking, defaultValue: 'Satisfactory'));
    layoutResult100 = showTextWithRectangleSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'General Condition',
        text: getStringAsync(k5RoofIntGenConndition,
            defaultValue: 'Satisfactory'));

/*     layoutResult100 = showImage('Picture',
        getStringAsync(k5RoofIntPicture, defaultValue: ''), layoutResult100);

 */
    height = 0;
    newImageList1 = getStringAsync(k5RoofIntPicture, defaultValue: '');
    listman1 = newImageList1.split('J@^J');
    listman1.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

    for (int i = 0; i < listman1.length; i++) {
      if (i == 0) {
        layoutResult100 = showImage('Picture', listman1[0], layoutResult100);
        height = 210;
      }
      if (i == 1) {
        // print('objechhhhhht${listman[1]}');
        layoutResult100 = showImageSide('', listman1[1], layoutResult100);
      }

      if (i == 2) {
        // print('objechhhhhht${listman[2]}');
        layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        height = 410;
      }

      if (i == 3) {
        // print('objechhhhhht${listman[3]}');
        layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
      }
    }
    layoutResult100 = showHeaderAfterBig2('     ', layoutResult100, height);
    layoutResult100 = showTextWithRectangleBigSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Notes',
        text: getStringAsync(k5RoofIntNote, defaultValue: ''));
    //end page 6
    //start page 7
    layoutResult100 = showHeader('    ', layoutResult100);
    layoutResult100 = showHeaderNewPage('  ', document.pages.add());
    layoutResult100 = showHeader2('7. Timber Pest Report', layoutResult100);

    layoutResult100 =
        showHeader2('Results of inspection - Summary', layoutResult100);
    layoutResult100 = showTextLarge(layoutResult100,
        '''This Summary is not the Report. The following Report MUST be read in full in conjunction with this Summary. If there is a discrepancy between the information provided in this Summary and that contained within the body of the Report, the information in the body of the Report shall override this''');

    layoutResult100 = showHeader(
        'Evidence of active (live) termites was found?', layoutResult100);

    layoutResult100 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k7TimberPest1, defaultValue: 'No'));

    layoutResult100 = showTextWithCircleSide2(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: 'No',
        type: getStringAsync(k7TimberPest1, defaultValue: 'No'));

    layoutResult100 = showHeader(
        'Evidence of termite activity (including workings) and/or damage was found?',
        layoutResult100);

    layoutResult100 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k7TimberPest2, defaultValue: 'No'));

    layoutResult100 = showTextWithCircleSide2(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: 'No',
        type: getStringAsync(k7TimberPest2, defaultValue: 'No'));

    layoutResult100 = showHeader(
        'Evidence of a possible previous termite management program was found?',
        layoutResult100);

    layoutResult100 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k7TimberPest3, defaultValue: 'No'));
    // layoutResult100 = showHeaderNewPage('  ', document.pages.add());
    layoutResult100 = showTextWithCircleSide2(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: 'No',
        type: getStringAsync(k7TimberPest3, defaultValue: 'No'));

    layoutResult100 = showTextWithRectangle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header:
            'The next inspection to help detect any future termite attack is recommended within:',
        text: getStringAsync(k7TimberPestDuration, defaultValue: 'ASAP'));
    layoutResult100 = showHeader(
        'Evidence of chemical delignification damage was found',
        layoutResult100);

    layoutResult100 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k7TimberPest4, defaultValue: 'No'));

    layoutResult100 = showTextWithCircleSide2(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: 'No',
        type: getStringAsync(k7TimberPest4, defaultValue: 'No'));
    layoutResult100 = showHeader(
        'Evidence of fungal decay (timber rot) and/or damage was found?',
        layoutResult100);

    layoutResult100 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k7TimberPest5, defaultValue: 'No'));

    layoutResult100 = showTextWithCircleSide2(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: 'No',
        type: getStringAsync(k7TimberPest5, defaultValue: 'No'));

    layoutResult100 = showHeaderNewPage('  ', document.pages.add());

    layoutResult100 = showHeader(
        'Evidence of wood borer activity and/or damage was found?',
        layoutResult100);

    layoutResult100 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k7TimberPest6, defaultValue: 'No'));
    layoutResult100 = showTextWithCircleSide2(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: 'No',
        type: getStringAsync(k7TimberPest6, defaultValue: 'No'));

    layoutResult100 = showHeader(
        'Evidence of conditions conducive to timber pest attack was found?',
        layoutResult100);

    layoutResult100 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k7TimberPest7, defaultValue: 'No'));

    layoutResult100 = showTextWithCircleSide2(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: 'No',
        type: getStringAsync(k7TimberPest7, defaultValue: 'No'));

    layoutResult100 = showHeader(
        'Evidence of major safety hazards was found?', layoutResult100);

    layoutResult100 = showTextWithCircle(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "   ",
        text: 'Yes',
        type: getStringAsync(k7TimberPest8, defaultValue: 'No'));
    layoutResult100 = showTextWithCircleSide2(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: 'No',
        type: getStringAsync(k7TimberPest8, defaultValue: 'No'));
    // layoutResult100 = showHeaderNewPage('  ', document.pages.add());

    /* layoutResult100 = showImage('Picture',
        getStringAsync(k7TimberPestPicture, defaultValue: ''), layoutResult100); */
    int images = 0;
    newImageList1 = getStringAsync(k7TimberPestPicture, defaultValue: '');
    listman1 = newImageList1.split('J@^J');
    listman1.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

    for (int i = 0; i < listman1.length; i++) {
      if (i == 0) {
        layoutResult100 = showImage('Picture', listman1[0], layoutResult100);
        images = 1;
      }
      if (i == 1) {
        // print('objechhhhhht${listman[1]}');
        layoutResult100 = showImageSide('', listman1[1], layoutResult100);
      }

      if (i == 2) {
        // print('objechhhhhht${listman[2]}');
        layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        images = 3;
      }

      if (i == 3) {
        // print('objechhhhhht${listman[3]}');
        layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
      }
    }

    if (images > 0 && images < 3) {
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.isNotEmpty ? 200 : 0);
      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k7TimberPestNote, defaultValue: ''));
      layoutResult100 = showHeaderNewPage('  ', document.pages.add());
    } else if (images > 2) {
      layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k7TimberPestNote, defaultValue: ''));
      layoutResult100 = showHeaderAfterBig2('', layoutResult100, 90);
    }

    layoutResult100 = showTextWithRectangleWithSpace(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header:
            '''Due to the level of accessibility for inspection including the presence of obstructions, the overall degree of risk of undetected timber pest attack and conditions conducive to timber pest attack was considered:''',
        text: getStringAsync(k7TimberPestPriority, defaultValue: 'Low'));

    layoutResult100 = showTextLarge(
      layoutResult100,
      '''A further inspection is strongly recommended of those areas that were not readily accessible and of inaccessible or obstructed areas once access has been provided or the obstruction removed. This will involve a separate visit to the site, permission from the owner of the property and additional cost. For further information or advice see Section C “Accessibility”.

Unless stated otherwise, any recommendation or advice given in this Report should be implemented as a matter of urgency.
For further information including advice on how to help protect against financial loss due to timber pest attack, see Section F.''',
    );

    layoutResult100 = showHeader2('Section C Accessibility', layoutResult100);
    layoutResult100 = showHeader2('Areas inspected', layoutResult100);
    layoutResult100 = showTextLarge(
      layoutResult100,
      '''The inspection covered the readily accessible and safe to access areas of the building and bite''',
    );

    layoutResult100 = showHeader2('Areas not inspected', layoutResult100);
    layoutResult100 = showTextLarge(
      layoutResult100,
      '''The inspection did not include areas which were inaccessible, not readily accessible, or obstructed at the time of inspection.
The Consultant did not move or remove any obstructions which may be concealing evidence of defects, including timber pest attack.
Areas which are not normally accessible were not inspected, such as under slabs on ground, as it is not "considered practical" to gain access to them.
Evidence of timber pest attack in obstructed or concealed areas may only be revealed when the items are moved or removed, or access has been provided.''',
    );

/*   layoutResult100 = showTextWithRectangle(
      pageSize: pageSize,
      layoutResult: layoutResult100,
      header: '''Undetected timber pest risk assessment''',
      text: getStringAsync(k7TimberPestPriority1, defaultValue: 'Low')); */

    layoutResult100 = showTextLarge(
      layoutResult100,
      '''A further inspection is strongly recommended of areas that were not readily accessible, and of inaccessible or obstructed areas once access has been provided or the obstruction removed.

This may require the moving, lifting or removal of obstructions such as floor coverings, furniture, stored items, foliage, and insulation. In some instances, it may also require the removal of ceiling and wall linings, and the cutting of traps and access holes.

For further advice, consult the person who carried out this report.''',
    );

    layoutResult100 = showHeader2(
        'Conditions conducive to timber pest attack', layoutResult100);

    layoutResult100 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: getBoolAsync(k7TimberPestTypeObstruction1, defaultValue: false),
        type: 'Garden against building',
        checkerImageData: checkerImageData);

    layoutResult100 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: getBoolAsync(k7TimberPestTypeObstruction2, defaultValue: false),
        type: 'Tap(s) without drain under',
        checkerImageData: checkerImageData);
    // layoutResult100 = showHeaderNewPage('  ', document.pages.add());

    layoutResult100 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: getBoolAsync(k7TimberPestTypeObstruction3, defaultValue: false),
        type: 'Hot water system outlet draining to ground',
        checkerImageData: checkerImageData);

    layoutResult100 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: getBoolAsync(k7TimberPestTypeObstruction4, defaultValue: false),
        type: 'Air conditioner unit outlet draining to ground',
        checkerImageData: checkerImageData);
    layoutResult100 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: getBoolAsync(k7TimberPestTypeObstruction5, defaultValue: false),
        type: 'No ant caps installed on sub floor piers',
        checkerImageData: checkerImageData);
    layoutResult100 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: getBoolAsync(k7TimberPestTypeObstruction6, defaultValue: false),
        type: 'Termite treatment label missing in meter box',
        checkerImageData: checkerImageData);

    layoutResult100 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: getBoolAsync(k7TimberPestTypeObstruction7, defaultValue: false),
        type: 'Ground level above slab height',
        checkerImageData: checkerImageData);
    layoutResult100 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: getBoolAsync(k7TimberPestTypeObstruction8, defaultValue: false),
        type: 'Lack of sub floor ventilation',
        checkerImageData: checkerImageData);
    layoutResult100 = showTextWithRecCheck(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: "  ",
        text: getBoolAsync(k7TimberPestTypeObstruction9, defaultValue: false),
        type:
            'Bridging or breaching of termite management systems and/or inspection zones',
        checkerImageData: checkerImageData);

/*     layoutResult100 = showImage(
        'Conducive Picture',
        getStringAsync(k7TimberPestTypePicture, defaultValue: ''),
        layoutResult100); */
    layoutResult100 = showHeaderNewPage('', document.pages.add());

    int conduciveImageList = 0;
    newImageList1 = getStringAsync(k7TimberPestTypePicture, defaultValue: '');
    listman1 = newImageList1.split('J@^J');
    listman1.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

    for (int i = 0; i < listman1.length; i++) {
      if (i == 0) {
        layoutResult100 =
            showImage('Conducive Picture', listman1[0], layoutResult100);
        conduciveImageList = 1;
      }
      if (i == 1) {
        // print('objechhhhhht${listman[1]}');
        layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        if (getStringAsync(k7TimberPestTypePicture, defaultValue: '')
            .isNotEmpty) {}
      }

      if (i == 2) {
        // print('objechhhhhht${listman[2]}');
        if (getStringAsync(k7TimberPestTypePicture, defaultValue: '').length >
            2) {
          //   layoutResult100 = showHeaderNewPage('', document.pages.add());
          conduciveImageList = 3;
        }
        layoutResult100 = showImageDown('', listman1[2], layoutResult100);
      }

      if (i == 3) {
        // print('objechhhhhht${listman[3]}');
        layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
      }
    }
    /* layoutResult100 = showHeaderAfterBig2(
        '     ', layoutResult100, listman1.length > 2 ? 400 : 200); */
    // if (getStringAsync(k7TimberPestTypePicture, defaultValue: '').isEmpty) {
    //   layoutResult100 = showHeader('', layoutResult100);
    //   layoutResult100 = showTextWithRectangleBigSide(
    //       pageSize: pageSize,
    //       layoutResult: layoutResult100,
    //       header: 'Notes',
    //       text: getStringAsync(k7TimberPestTypeNote, defaultValue: ''));
    //   layoutResult100 = showHeaderNewPage('  ', document.pages.add());
    // } else if (conduciveImageList > 0 && conduciveImageList < 3) {
    if (conduciveImageList > 0 && conduciveImageList < 3) {
      layoutResult100 = showHeaderAfterBig2('', layoutResult100, 220);
    }
    if (conduciveImageList > 2) {
      layoutResult100 = showHeaderAfterBig2('', layoutResult100, 430);
    }
    layoutResult100 = showTextWithRectangleBigSide(
        pageSize: pageSize,
        layoutResult: layoutResult100,
        header: 'Notes',
        text: getStringAsync(k7TimberPestTypeNote, defaultValue: ''));
    layoutResult100 = showHeaderAfterBig2('', layoutResult100, 110);

    // } else if (conduciveImageList > 2) {
    //   //layoutResult100 = showHeaderNewPage('  ', document.pages.add());
    //   layoutResult100 = showHeaderAfterBig2('', layoutResult100, 220);

    //   layoutResult100 = showTextWithRectangleBigSide(
    //       pageSize: pageSize,
    //       layoutResult: layoutResult100,
    //       header: 'Notes',
    //       text: getStringAsync(k7TimberPestTypeNote, defaultValue: ''));
    //   layoutResult100 = showHeaderAfterBig2('', layoutResult100, 110);
    // }
    // layoutResult100 = showHeaderNewPage('  ', document.pages.add());

    //8
    layoutResult100 = showHeader2(
        'Timber pest definitions to help you better understand this report:',
        layoutResult100);
    layoutResult100 = showTextLarge(
      layoutResult100,
      '''“Timber Pest Attack” Timber Pest Activity and/or Timber Pest Damage.

“Timber Pest Activity” Telltale signs associated with ‘active’ (live) and/or ‘inactive’ (absence of live) Timber Pests at the time of inspection.
“Timber Pest Damage” Noticeable impairments to the integrity of timber and other susceptible materials resulting from attack by Timber Pests.

"Major Safety Hazard” Any item that may constitute an immediate or imminent risk to life, health or property resulting directly from Timber Pest Attack. Occupational, health and safety or any other consequence of these hazards has not been assessed.
“Conditions Conducive to Timber Pest Attack” Noticeable building deficiencies or environmental factors that may contribute to the presence of Timber Pests.

“Readily Accessible Areas” Areas which can be easily and safely inspected without injury to person or property, are up to 3.6 metres above ground or floor levels or accessible from a 3.6 metre ladder, in roof spaces where the minimum area of accessibility is not less than 600 mm high by 600 mm wide and subfloor spaces where the minimum area of accessibility is not less than 400 mm high by 600mm wide, providing the spaces or areas permit entry. 

The term ‘readily accessible’ also includes: (a) accessible subfloor areas on a sloping site where the minimum clearance is not less than 150mm high, provided that the area is not more than 2 metres from a point with conforming clearance (i.e. 400 mm high by 600 mm wide); and (b) areas at the eaves of accessible roof spaces that are within the consultant’s unobstructed line of sight and within arm’s length from a point with conforming clearance (i.e. 600 mm high by 600 mm wide).

“Client” The person or persons for whom the Timber Pest Report was carried out or their Principal (i.e. the person or persons for whom the report was being obtained).

“Timber Pest Detection Consultant” A person who meets the minimum skills requirement set out in the current Australian Standard AS 4349.3 Inspections of Buildings. Part 3: Timber Pest Inspection Reports or state/territory legislation requirements beyond this Standard, where applicable.

“Building and Site” The main building (or main buildings in the case of a building complex) and all timber structures (such as outbuildings, landscaping, retaining walls, fences, bridges, trees and stumps with a diameter greater than 100 mm and timber embedded in soil) and the land within the property boundaries up to a distance of 50 metres from the main building(s).

“Timber Pests” One or more of the following wood destroying agents which attack timber in service and affect its structural properties: (a) Chemical Delignification - the breakdown of timber through chemical action. (b) Fungal Decay - the microbiological degradation of timber caused by soft rot fungi and decay fungi, but does not include mould, which is a type of fungus that does not structurally damage wood. (c) Wood Borers - wood destroying insects belonging to the order ‘Coleoptera’ which commonly attack seasoned timber. (d) Termites - wood destroying insects belonging to the order ‘Isoptera’ which commonly attack seasoned timber.

“Tests” Additional attention to the visual examination was given to those accessible areas which the consultant’s experience has shown to be particularly susceptible to attack by Timber Pests. Instrument Testing of those areas and other visible accessible timbers/materials/areas showing evidence of attack was performed.

“Instrument Testing” Where appropriate the carrying out of Tests using the following techniques and instruments: (a) electronic moisture detecting meter - an instrument used for assessing the moisture content of building elements; (b) stethoscope - an instrument used to hear sounds made by termites within building elements; (c) probing - a technique where timber and other materials/areas are penetrated with a sharp instrument (e.g. bradawl or pocket knife), but does not include probing of decorative timbers or finishes, or the drilling of timber and trees; and (d) sounding - a technique where timber is tapped with a solid object.

“Subterranean Termite Management Proposal” A written proposal in accordance with Australian Standard AS 3660.2 to treat a known subterranean termite infestation and/or manage the risk of concealed subterranean termite access to buildings and structures''',
    );

    layoutResult100 = showHeader2(
        'Terms on which this report was prepared:', layoutResult100);
    layoutResult100 = showTextLarge(
      layoutResult100,
      '''SERVICE: As requested by the Client, the inspection carried out by the Timber Pest Detection Consultant (“the Consultant”) was a “Standard Timber Pest Report”.

PURPOSE: The purpose of this inspection is to assist the Client to identify and understand any Timber Pest issues observed at the time of inspection.

SCOPE OF INSPECTION: This Report only deals with the detection or non detection of Timber Pest Attack and Conditions Conducive to Timber Pest Attack discernible at the time of inspection. The inspection was limited to the Readily Accessible Areas of the Building & Site (see Note below) and was based on a visual examination of surface work (excluding furniture and stored items), and the carrying out of Tests.

Note. With strata and company title properties, the inspection was limited to the interior and the immediate exterior of the particular residence inspected. Common property was not inspected.

ACCEPTANCE CRITERIA: Unless noted in “Special Conditions or Instructions”, the building being inspected was compared with a similar building. To the Consultant's knowledge the similar building used for comparison was constructed in accordance with generally accepted timber pest management practices and has since been maintained during all its life not to attract or support timber pest infestation.

Unless noted in “Special Conditions or Instructions”, this Report assumes that the existing use of the building will continue. This Report only records the observations and conclusions of the Consultant about the readily observable state of the property at the time of inspection. This Report therefore cannot deal with:

(a) possible concealment of timber pest attack, including but not limited to, timber pest attack concealed by lack of accessibility, obstructions such as furniture, wall linings and floor coverings, or by applied finishes such as render and paint; and
(b) undetectable or latent timber pest attack, including but not limited to, timber pest attack that may not be apparent at the time of inspection due to seasonal changes, recent or prevailing weather conditions, and whether or not services have been used some time prior to the inspection being carried out.

These matters outlined above in (a) & (b) are excluded from consideration in this Report. If the Client has any doubt about the purpose, scope and acceptance criteria on which this Report was based please discuss your concerns with the Consultant on receipt of this Report. The Client acknowledges that, unless stated otherwise, the Client as a matter of urgency should implement any recommendation or advice given in this Report.''',
    );
    layoutResult100 = showHeader2('LIMITATIONS:', layoutResult100);
    layoutResult100 = showTextLarge(layoutResult100, '''The Client acknowledges:
1. This Report does not include the inspection and assessment of matters outside the scope of the requested inspection and report.

2. The inspection only covered the Readily Accessible Areas of the Building and Site. The inspection did not include areas which were inaccessible, not readily accessible or obstructed at the time of inspection. Obstructions are defined as any condition or physical limitation which inhibits or prevents inspection and may include – but are not limited to – roofing, fixed ceilings, wall linings, floor coverings, fixtures, fittings, furniture, clothes, stored articles/materials, thermal insulation, sarking, pipe/duct work, builder’s debris, vegetation, pavements or earth.

3. The detection of drywood termites may be extremely difficult due to the small size of the colonies. No warranty of absence of these termites is given.

4. European House Borer (Hylotrupes bajulus) attack is difficult to detect in the early stages of infestation as the galleries of boring larvae rarely break through the affected timber surface. No warranty of absence of these borers is given. Regular inspections including the carrying out of appropriate tests are required to help monitor susceptible timbers.

5. This is not a structural damage report. Neither is this a warranty as to the absence of Timber Pest Attack.

6. If the inspection was limited to any particular type(s) of timber pest (e.g. subterranean termites), then this would be the subject of a Special-Purpose Inspection Report, which is adequately specified.

7. This Report does not cover or deal with environmental risk assessment or biological risks not associated with Timber Pests (e.g. toxic mould) or occupational, health or safety issues. Such advice may be the subject of a Special-Purpose Inspection Report which is adequately specified and must be undertaken by an appropriately qualified inspector. The choice of such inspector is a matter for the Client.

8. This Report has been produced for the use of the Client. The Consultant or their firm or company are not liable for any reliance placed on this report by any third party.''');
    layoutResult100 = showHeader2('EXCLUSIONS:', layoutResult100);
    layoutResult100 =
        showTextLarge(layoutResult100, '''The Client acknowledges that:
1. This Report does not deal with any timber pest preventative or treatment measures, or provide costs for the control, rectification or prevention of attack by timber pests. However, this additional information or advice may be the subject of a timber pest management proposal which is adequately specified.''');
//8

//9
    layoutResult100 = showHeader2(
        'Risk management options for timber pests', layoutResult100);
    layoutResult100 = showTextLarge(layoutResult100,
        '''To help protect against financial loss, it is essential that the building owner immediately control or rectify any evidence of destructive timber pest activity or damage identified in this Report.

The Client should further investigate any high-risk area where access was not gained. It is strongly advised that appropriate steps be taken to remove, rectify or monitor any evidence of conditions conducive to timber pest attack.

It is recommended that the client act on the following advice to further protect their investment against timber pest infestation:
- Undertake thorough regular inspections at intervals not exceeding twelve months or more frequent inspections where the risk of timber pest attack is high or the building type is susceptible to attack.

- To further reduce the risk of subterranean termite attack, implement a management program in accordance with Australian Standard AS 3660. This may include the installation of a monitoring and/or baiting system, or chemical and/or physical management system. However, AS 3660 stresses that subterranean termites can bridge or breach management systems and inspection zones and that thorough regular inspections of the building are necessary.

If the Client has any queries or concerns regarding this Report, or the Client requires further information on a risk management program, please do not hesitate to contact the person who carried out this Inspection.''');
//9

//10
    if (getStringAsync(k3TypeInspectionChoose, defaultValue: "1") == '2') {
      layoutResult100 =
          showHeader2('8. Electrical Inspection Report', layoutResult100);
      layoutResult100 =
          showHeader('Use this section only if required', layoutResult100);
      layoutResult100 = showHeader(
          'Terms and Conditions for Electrical Inspection ', layoutResult100);

      layoutResult100 = showTextLarge(layoutResult100,
          '''1. Scope of Inspection: The electrical inspection will encompass visible electrical systems and components within the property, including but not limited to: electrical panels, circuits, wiring, fixtures, switches and outlets.

2. Inspection Process: The inspection will be performed by a licensed and qualified electrician, who will conduct a visual inspection of electrical systems and components. Any necessary testing or measurements will be conducted to ensure the electrical systems and components are in compliance with the relevant Australian standards and codes.

3. Limitations of Inspection: The inspection will be limited to readily accessible areas and systems. The inspector will not move any furniture or personal belongings, nor will they disassemble any electrical systems or components. The inspector will not provide an evaluation of the performance or efficiency of the electrical systems or components.

4. Report and Recommendations: Upon completion of the inspection, the inspector will provide a written report detailing their findings and any recommendations for repairs or rectification.The report will not include any warranties or guarantees, and it is the responsibility of the property owner to ensure that any necessary repairs or upgrades are performed by a licensed and qualified electrician.

5. Payment Terms: Payment for the inspection services is due upon completion of the inspection and receipt of the report. The inspector reserves the right to withhold the report until payment has been received in full.

6. Liability and Indemnification: The inspector assumes no liability for any damages or losses arising from the inspection or any repairs or upgrades recommended in the report. The property owner agrees to indemnify and hold harmless the inspector for any claims, damages, or losses arising from the inspection or any repairs or upgrades recommended in the report.

7. Governing Law: These terms and conditions shall be governed by and construed in accordance with the laws of the state in which the inspection is performed.

8. Entire Agreement: These terms and conditions constitute the entire agreement between the inspector and the property owner, and supersede all prior negotiations, understandings, and agreements between the parties.

9. Amendments: These terms and conditions may only be amended in writing and signed by both the inspector and the property owner. ''');

      layoutResult100 =
          showHeaderNewPage('Electrical results', document.pages.add());

      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Meter box/meter panel',
          text: getStringAsync(k5RoofIntSarking, defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Wiring',
          text: getStringAsync(k5RoofIntSarking, defaultValue: 'Satisfactory'));
      //layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Power outlets & switches',
          text: getStringAsync(k5RoofIntSarking, defaultValue: 'Satisfactory'));

      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Light fittings',
          text: getStringAsync(k5RoofIntSarking, defaultValue: 'Satisfactory'));

      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Hot water system',
          text: getStringAsync(k5RoofIntSarking, defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Smoke detectors (not tested)',
          text: getStringAsync(k5RoofIntSarking, defaultValue: 'Satisfactory'));
      layoutResult100 = showTextWithRectangle(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Earthing system',
          text: getStringAsync(k5RoofIntSarking, defaultValue: 'Satisfactory'));
      height = 0;
      newImageList1 = getStringAsync(k10NewPicture, defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
      if (listman1.isNotEmpty) {
        layoutResult100 = showHeaderNewPage('', document.pages.add());
      }
      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 =
              showImage('Electrical Picture', listman1[0], layoutResult100);
          height = 210;
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
          height = 410;
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2('     ', layoutResult100, height);
      if (getStringAsync(k10NewPicture, defaultValue: '').isNotEmpty) {
        layoutResult100 = showTextWithRectangleBigSide(
            pageSize: pageSize,
            layoutResult: layoutResult100,
            header: 'Notes',
            text: getStringAsync(k10NewNote, defaultValue: ''));
      }
    }
//10

//11
    // if (getStringAsync(k3TypeInspectionChoose, defaultValue: "1") == '2') {
    //   layoutResult100 = showHeaderDynamic('     ', layoutResult100);
    // }
    //  layoutResult100 = showHeaderAfterBig2('', layoutResult100, 100);
    int lastSectionNo = 9;
    layoutResult100 = showHeaderNewPage('  ', document.pages.add());
    if (getStringAsync(k10NewPicture, defaultValue: '').isEmpty) {
      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k10NewNote, defaultValue: ''));
      layoutResult100 = showHeaderAfterBig2('     ', layoutResult100, 90);
    }
    layoutResult100 =
        showHeader2('$lastSectionNo. Conclusion', layoutResult100);
    layoutResult100 = showTextLarge(layoutResult100,
        '''This document certifies that the property described in this Report has been inspected by the Building Consultant & Timber Pest Detection Consultant in accordance with the level of service requested by the Client and the agreed Terms and Conditions set out at http://innerwestpropertyinspections.com.au/bookan-inspection/terms-conditions, and in accordance with Australian Standard AS 4349.1-2007: Inspection of Buildings - Pre-purchase Inspections and Australian Standard AS 3660 (termite) respectively.

Thank You

Authorised Signatory for Inner West Property Inspections Pty Ltd''');
    layoutResult100 = showImageSignature(
        '', getStringAsync('sigImage', defaultValue: ''), layoutResult100);
    layoutResult100 = showHeaderAfterBig2('', layoutResult100, 100);
    layoutResult100 = showTextFullRectangle(
        layoutResult: layoutResult100,
        pageSize: pageSize,
        header: 'Date of report',
        text: getStringAsync(k10Date, defaultValue: 'Nil'));
    //11
//12

    if (getStringAsync(k3TypeInspectionChoose, defaultValue: "1") == '3') {
      layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      layoutResult100 = showHeader('Signature', layoutResult100);
      layoutResult100 = showImage('Untitled',
          getStringAsync('sigImage', defaultValue: ''), layoutResult100);
      lastSectionNo = 10;
      layoutResult100 =
          showHeader('9. Thermal Imaging Photography Report', layoutResult100);
      layoutResult100 =
          showHeader('Introduction: What is Thermal Imaging?', layoutResult100);
      layoutResult100 = showTextLarge(layoutResult100,
          '''Thermal imaging is the non-contact detection and measurement of temperature differences and the assignment of colours based on temperature.

 

Any object that has a temperature above absolute zero (-273°C) emits infrared radiation. Thermography is a technique that uses thermal imaging cameras to visually represent the infrared energy emitted from a surface, transforming infrared measurements to construct a radiometric image.

 

The thermal imaging services offered by Roscon Property Services are an effective and efficient way of testing, some advantages are listed below:

 

• Minimises the downtime and labour costs associated with the more traditional forms of testing.

• Detect anomalies often invisible to the naked eye and allow corrective action to be taken before costly

system failures occur.

• Infrared scans are non-intrusive eliminating lengthy downtime, causing loss in production to your business.

• Infrared thermography has become one of the most valuable diagnostic tools for predictive maintenance.

• Large areas can be scanned faster.

• Efficiently and accurately identify and target hot spots.

• Can assist in detecting areas of moisture or thermal inconsistencies.

• Energy efficiency.''');
      layoutResult100 = showHeader('How it works:', layoutResult100);
      layoutResult100 = showTextLarge(layoutResult100,
          '''Thermal imaging does not "see" inside walls unlike an X-ray, CAT scan or MRI although you may have seen thermal images showing the framing inside walls.

 

This can be misleading as the darker lines of the frame are visible because the frame acts as a heat sink draining heat from the wall sheet and appearing as a dark spot.

 

The frame lines on the image are actually colder sections of wall sheeting as a result of the heat being drained away from the surface of the wall sheet and not the frame itself being "seen" through the sheet.

 

Thermal imaging simply provides a temperature reading across a surface, building up a picture from thousands of

temperature measurements in its field of view.

 

It's also useful in displaying patterns of moisture which evaporates and cools surrounding material.

 

Conversely, as termites maintain a constant temperature between 28 and 32 degrees

Celsius in their workings, if there are enough of them and the ambient temperature is cooler, termite activity presents as a hot spot.

 

Using thermal imaging is not a simple process and requires knowledge, skill, experience, and training.

 

The process must take into account the climate, the current weather, the structure's use and occupancy, the time of day,

the type of construction, heating and air conditioning, plumbing, wiring, construction materials, surface finish, and even colour.

 

Other supporting technology includes Moisture Meters and Bore scope.''');

      layoutResult100 = showHeader('Heat:', layoutResult100);
      layoutResult100 = showTextLarge(layoutResult100,
          '''To fully understand infrared thermography, its applications, qualities and limitations, it is necessary to be familiar with the laws of physics that govern heat, heat transfer and the principles of infrared radiation. Heat is the transfer of energy from one material or substance to another.

 

Heat is energy in transit; it always flows from the material at a higher temperature to that at a lower temperature until thermal equilibrium is reached.

 

Heat may be transferred from one

object or place to another by three modes; conduction, convection and radiation. It is the radiation mode that infrared thermography can detect.

 

There are several basic factors that affect the accuracy of measurements using this technique and must all be taken into consideration for reproducible results. They are: surface emissivity, reflected temperature

and ambient temperature.''');
      layoutResult100 = showHeader('Temperature:', layoutResult100);
      layoutResult100 = showTextLarge(layoutResult100,
          '''Temperature is arguably the most widely measured physical parameter in science and engineering and is a reliable

indicator of an objects condition.''');
      layoutResult100 = showHeader('Infrared cameras:', layoutResult100);
      layoutResult100 = showTextLarge(
          layoutResult100, '''Characteristics of Infrared Thermography Camera

 

• It captures as a temperature distribution on a surface, and it can display as visible information.

• Temperature can be measured from a distance without contacting an object.

• Temperature can be measured in real time.

Merits of Infrared Thermography Camera

• Relative comparison of distribution of surface temperature can be made over a wide area.

• Temperature can be measured easily for a moving object or an object which is dangerous to get close to.

• Temperature of small object can be measured without confusing the temperature.

• Temperature of food, medicine or chemicals can be measured in a sanitary fashion.

• Temperature of an object with drastic temperature change or a phenomenon during a short period of time can be

measured.''');
      layoutResult100 = showHeader('Applications:', layoutResult100);
      layoutResult100 = showTextLarge(layoutResult100, '''• Moisture inspection

• Heat or cooling loss

• Water/ Steam leaks

• Construction quality

• Electrical installation

• Repair validation

• Termites and pests

• Electrical power distribution systems: Three-phase systems, distribution panels, fuses, wiring and connections,

substations, electrical vaults

• Electro-mechanical equipment: Motors, pumps, fans, compressors, bearings, windings, gear boxes, and conveyors

• Process instrumentation: Process control equipment, pipes, valves, steam traps and tanks/vessels

• Facility maintenance: HVAC systems, buildings, roofs, insulation''');

      layoutResult100 = showHeader('Limitations:', layoutResult100);
      layoutResult100 = showTextLarge(layoutResult100,
          '''• Building construction materials can inhibit the use of the thermal imaging camera.

• Thermal imaging cameras do not see through walls & cannot determine the extent of any structural damage. It

basically only detects the surface temperature of whatever is being scanned.

• Images can be difficult to interpret accurately when based upon certain objects, specifically objects with erratic

temperatures, although this problem is reduced in active thermal imaging.

• Accurate temperature measurements are hindered by differing emissivity’s and reflections from other surfaces.

• Most cameras have ±2% accuracy or worse in measurement of temperature and are not as accurate as contact methods

• Only able to directly detect surface temperatures.

• Condition of work, depending of the case, can be drastic: 10°C of difference between internal/external, 10km/h of wind maximum, no direct sun, and no recent rain.''');

      layoutResult100 =
          showHeader('Inspection method/criteria:', layoutResult100);
      layoutResult100 = showTextLarge(layoutResult100,
          '''Thermal intrusion testing is normally done by performing thermal imaging of the envelope components.

 

When using a thermal imaging camera to find missing insulation or energy losses, the difference in temperature between the inside of the building and the outside should be preferably at least 10 °C.

 

These images will indicate areas of excess thermal intrusion in wall or roof areas and can indicate the presence of thermal bridging of structural elements and also the presence of air leaks when the building is under testing pressure.

 

Any thermographic survey can show differences in apparent temperature of areas within the field of view.

 

To be useful, a thermographic survey must systematically detect all the apparent defects and assess them against criteria agreed

between Inner West Property Inspections and the client. It must reliably discount those anomalies that are not real defects, evaluate those that are real defects and report the results to the client.

 

On that count, the process generally consists of the following key steps.

 

• Step-1 Selecting the critical temperature parameter

 

• Step-2 Selecting maximum acceptable defect area

 

• Step-3 Measuring surface temperature difference caused by the defect

 

• Step-4 Measuring area of the defects

 

Thermal anomalies will only present themselves to the thermographer where temperature differences exist and

environmental phenomena are accounted for.

 

Generally, the below mentioned parameters may be considered as recommended prerequisite for the environmental conditions before proceeding with the thermal imaging for building.

 

• Temperature difference across the building fabric to be greater than 10°C.

• Internal air to ambient air temperature difference to be greater than 5°C for the last twenty four hours before

• External air temperature to be within +/- 3°C for duration of survey and for the previous hour External air

temperature to be within +/- 10°C for the preceding twenty-four hours.

• In addition, external surveys should also comply with the following

• Necessary surfaces free from direct solar radiation for at least one hour prior to survey. No precipitation either

just prior to or during the survey.

• Ensure that all building surfaces to be inspected are dry.

• Wind speed to be less than 10 metres / second during the operation.

 

Besides temperature, there are other environmental conditions that should be duly taken cognizance of when planning

a thermographic building survey.

 

External inspections for example, may be influenced by radiation emissions and reflections from adjacent buildings or a cold clear sky.

 

Sun may also have a significant influence on surface.

 

Additionally, where background temperatures differ from air temperatures either internally or externally by more than 5K, then background temperatures should be measured on all effected surfaces to allow surface temperature to be compared.''');

//12

      //layoutResult100 = showHeaderDynamic('         ', layoutResult100);
      layoutResult100 = showHeader('Thermal Imaging Pictures', layoutResult100);

      /*   layoutResult100 = showImage('Untitled',
        getStringAsync(k11ThermalPic1, defaultValue: ''), layoutResult100);
 */
      layoutResult100 = showHeader('Untitled', layoutResult100);
      newImageList1 = getStringAsync(k11ThermalPic1, defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('  ', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.length > 2 ? 400 : 200);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k11ThermalNote1, defaultValue: ''));
      layoutResult100 = showHeaderDynamic('         ', layoutResult100);

//one
      /*    layoutResult100 = showImage('Untitled',
        getStringAsync(k11ThermalPic2, defaultValue: ''), layoutResult100);

 */
      layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      layoutResult100 = showHeader('Untitled', layoutResult100);
      newImageList1 = getStringAsync(k11ThermalPic2, defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('   ', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.length > 2 ? 400 : 200);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k11ThermalNote2, defaultValue: ''));
      layoutResult100 = showHeaderDynamic('         ', layoutResult100);

//two
      /*  layoutResult100 = showImage('Untitled',
        getStringAsync(k11ThermalPic3, defaultValue: ''), layoutResult100);
 */
      layoutResult100 = showHeader('Untitled', layoutResult100);
      newImageList1 = getStringAsync(k11ThermalPic3, defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('    ', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.length > 2 ? 400 : 200);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k11ThermalNote3, defaultValue: ''));
      // layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      /*  layoutResult100 = showImage('Untitled',
        getStringAsync(k11ThermalPic4, defaultValue: ''), layoutResult100);
 */
      layoutResult100 = showHeaderDynamic('         ', layoutResult100);
      layoutResult100 = showHeader('Untitled', layoutResult100);
      newImageList1 = getStringAsync(k11ThermalPic4, defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('   ', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.length > 2 ? 400 : 200);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k11ThermalNote4, defaultValue: ''));
      layoutResult100 = showHeaderDynamic('         ', layoutResult100);

//5
/*     layoutResult100 = showImage('Untitled',
        getStringAsync(k11ThermalPic5, defaultValue: ''), layoutResult100);
 */
      layoutResult100 = showHeader('Untitled', layoutResult100);
      newImageList1 = getStringAsync(k11ThermalPic5, defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('    ', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.length > 2 ? 400 : 200);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k11ThermalNote5, defaultValue: ''));
      layoutResult100 = showHeaderDynamic('         ', layoutResult100);
      //6
      /*  layoutResult100 = showImage('Untitled',
        getStringAsync(k11ThermalPic6, defaultValue: ''), layoutResult100);
 */
      layoutResult100 = showHeader('Untitled', layoutResult100);
      newImageList1 = getStringAsync(k11ThermalPic6, defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('   ', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.length > 2 ? 400 : 200);
      layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k11ThermalNote6, defaultValue: ''));
      // layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      //7
      /*  layoutResult100 = showImage('Untitled',
        getStringAsync(k11ThermalPic7, defaultValue: ''), layoutResult100);
 */
      layoutResult100 = showHeaderDynamic('         ', layoutResult100);
      layoutResult100 = showHeader('Untitled', layoutResult100);
      newImageList1 = getStringAsync(k11ThermalPic7, defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('   ', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.length > 2 ? 400 : 200);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k11ThermalNote7, defaultValue: ''));
      // layoutResult100 = showHeaderDynamic('         ', layoutResult100);
      layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      //8
/*     layoutResult100 = showImage('Untitled',
        getStringAsync(k11ThermalPic8, defaultValue: ''), layoutResult100);
 */
      // layoutResult100 = showHeaderDynamic('         ', layoutResult100);
      layoutResult100 = showHeader('Untitled', layoutResult100);
      newImageList1 = getStringAsync(k11ThermalPic8, defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('   ', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.length > 2 ? 400 : 200);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k11ThermalNote8, defaultValue: ''));
      layoutResult100 = showHeaderDynamic('         ', layoutResult100);
      //9
      /* layoutResult100 = showImage('Untitled',
        getStringAsync(k11ThermalPic9, defaultValue: ''), layoutResult100); */
      layoutResult100 = showHeader('Untitled', layoutResult100);
      newImageList1 = getStringAsync(k11ThermalPic9, defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('   ', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.length > 2 ? 400 : 200);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k11ThermalNote9, defaultValue: ''));
      layoutResult100 = showHeaderDynamic('         ', layoutResult100);
      //10
      /*   layoutResult100 = showImage('Untitled',
        getStringAsync(k11ThermalPic10, defaultValue: ''), layoutResult100);
         */
      layoutResult100 = showHeader('Untitled', layoutResult100);
      newImageList1 = getStringAsync(k11ThermalPic10, defaultValue: '');
      listman1 = newImageList1.split('J@^J');
      listman1.removeWhere(
          (element) => element == 'J@^J' || element.trim().isEmptyOrNull);

      for (int i = 0; i < listman1.length; i++) {
        if (i == 0) {
          layoutResult100 = showImage('  ', listman1[0], layoutResult100);
        }
        if (i == 1) {
          // print('objechhhhhht${listman[1]}');
          layoutResult100 = showImageSide('', listman1[1], layoutResult100);
        }

        if (i == 2) {
          // print('objechhhhhht${listman[2]}');
          layoutResult100 = showImageDown('', listman1[2], layoutResult100);
        }

        if (i == 3) {
          // print('objechhhhhht${listman[3]}');
          layoutResult100 = showImageDownSide('', listman1[3], layoutResult100);
        }
      }
      layoutResult100 = showHeaderAfterBig2(
          '     ', layoutResult100, listman1.length > 2 ? 400 : 200);

      layoutResult100 = showTextWithRectangleBigSide(
          pageSize: pageSize,
          layoutResult: layoutResult100,
          header: 'Notes',
          text: getStringAsync(k11ThermalNote10, defaultValue: ''));
      //  layoutResult100 = showHeaderDynamic('         ', layoutResult100);
      layoutResult100 = showHeaderNewPage('  ', document.pages.add());
      layoutResult100 = showHeader(
          'Terms and Conditions of Thermal Imaging Photography Report',
          layoutResult100);

      layoutResult100 = showTextLarge(layoutResult100,
          '''Orders: Orders for Inspections and Reports can be made by telephone, by email or by fax.
Access: We will organise access to the property using the information You provide.
Payment: Payment is required at the time that the Inspection is ordered.
Payment Method: Payment can be made by credit card or internet banking.
Cancellations: We require 24 hours notice for cancellations or You will be charged the full Inspection Fee.
Cancellation Method: Cancellation can be made by telephone, text or email.
Purpose of Report: The Thermal Imaging Inspection Report is solely undertaken for the purpose of
detecting thermal irregularities or anomalies that may be caused by current termite infestation.Thermal Images of every accessible room in the property were taken. Images included in this report are a
selection of the images taken of the property. Since thermal images are large files that cannot be emailed
easily, not all images are inserted in the report. Any images that indicate thermal anomalies are definitely
inserted in the report. If no thermal anomalies are present, a selection of images are used. Images not
used in the report are kept on file.\n
Not a Guarantee: This Report is not a guarantee that an infestation and/or defect does not exist in any
inaccessible or partly inaccessible area or section of the property. Nor is it a guarantee that a future
infestation of Timber Pests will not occur or be found. The Australian Standard for Termite Management
Part 2: In and Around Existing Buildings And Structures, AS 3660.2-2000, recommends that properties
should be inspected at least every 12 months but more frequent inspections are strongly recommended.
Sample Report: In accordance with the Australian Standard AS4349.0 Part 0: General requirements
Section 2 Inspection Agreement, 2.1 General, C2.1, you confirm that you, or your Solicitor or Conveyancer,
have seen a sample of our Report on our website, or elsewhere, and acknowledge that you are satisfied
with the aspects covered in the Sample Report and the extent of reporting in the Sample Report which is
similar to the Report you have received.\n
Thermal Imaging Camera: The thermal imaging camera uses infrared technology to detect variances in
infrared radiation being emitted from the surface being surveyed. It cannot see through walls and therefore
cannot determine the presence of any damage.
Thermal Anomalies: When thermal anomalies are identified, we strongly recommend that a more invasive
inspection should be undertaken which may include a boroscope inspection*, removing wall linings,
removing brickwork or other claddings, cutting traps and lifting carpets so that the timber structure can be
inspected for the presence of damage.\n
*A borescope inspection is an intrusive inspection involving the insertion of a probe through holes that are
made in the ceilings, walls and floors so that the concealed timbers in these areas can be examined to
determine whether termite damage or termite infestation is present. Permission should be obtained from
the owner because this process causes damage to the property.\n
Recommendations: Where recommendations are made for further investigation of any section of this
property, including recommendations to undertake a more invasive inspection, remove wall linings, remove
brickwork or other claddings, cut traps and lift carpets so that further access is gained, such access andfurther inspections subsequent to access being gained must be carried out before this purchase proceeds.
Thermal Imaging Limitations: Thermal imaging is a diagnostic technique that may detect variations in
temperature that may indicate the presence of termite infestation in a building. Thermal imaging is not a
conclusive test for the presence of termites because variations in temperature can be influenced by a
variety of factors including but not limited to the temperature on the day of the inspection, the temperature
inside the property, heaters and air conditioners in the property, plumbing pipes and electric cables in the
walls of the property, light switches, powerpoints and electrical appliances such as ovens, refrigerators and
hotplates. The thermal camera may also not be able detect a small number of termites that may be present
since they may not produce sufficient heat for detection. For all the reasons stated above, this report is not
a guarantee that termites are not present in the property. Accordingly, this report can only be relied upon if
termite infestation is discovered in the property.\n
Detection Of Damage: Thermal imaging cannot detect damage due to termites in the timber structure of a
building. For this reason, it is not the purpose of this Report to identify termite damage. Any termite
damage that may be present in the building can only be assessed by a visual inspection of the termite
damaged areas.\n
Areas Not Inspected: This Thermal Imaging Inspection Report covers all accessible internal areas of the
dwelling. The Report does not include the roof void, subfloor (area below the property), trees, fences,
sheds, pergolas and landscaping timber. These areas are areas that must be inspected by a pest inspector
and reported on in a Visual Timber Pest Inspection and Report.
Inaccessible Areas: This Report will not disclose termite infestation in inaccessible areas or areas that
are not reasonably visible.\n
Restricted Access: Only the readily accessible and readily visible areas of this building were inspected and
reported on. The Report therefore does not extend to any areas where there were physical limitations
which inhibit or prevent access and inspection, including but not limited to, fixtures, fittings and furniture
containing clothes and other stored articles/materials, thermal insulation, sarking, pipe/duct work, and
areas covered by or containing builders debris. Any section of the building that is not readily accessible,
such as garages, laundries, sheds, other rooms, or any other areas that are locked, cannot be reported on
and no responsibility will therefore be taken in respect of termite infestation that may be present in these
parts of the building. The client will be charged an additional fee to inspect these areas if access becomes
available at a later date.\n
Reasonable Access: The Australian Standard AS4349.1-2007 Inspection of Buildings Part 1: Prepurchase Inspections— Residential Buildings states that Reasonable Access is defined as "areas where
safe unobstructed access is provided". Reasonable access does not include removing screws or bolts to
access covers. Reasonable access does not include destructive or invasive inspection methods nor does itinclude cutting or making access traps or moving furniture, floor coverings or stored goods. Access to any
areas of the building as detailed above must be made by the owner. We recommend you arrange for us to
gain access to any areas of the building that were not accessible to determine whether any termite
infestation is present in these areas. However, we advise that this will require a second visit to the property
at an additional fee.\n
Further Access: Where we recommend that further access to sections of the property be arranged for us,
you should urgently arrange for such further access to be provided so that further inspections of those
sections can be carried out BEFORE you proceed with a purchase of this property. No inspection of any
furnishings or household items was made for the purposes of this Report.\n
Right Of Entry: In accordance with the Australian Standard AS4349.1 Part 1: Pre-purchase inspections—
buildings, please note that Section 2.3.2 Areas for inspection says that the inspection covers accessible
areas only. The client must arrange right of entry, facilitate physical entry to the property and supply
necessary information to enable the inspector to undertake the inspection and prepare a report. The
inspector is not responsible for arranging entry to property or parts of property. Areas where reasonable
entry is denied to the inspector, or where reasonable access is not available, are excluded from, and do
not form part of, the inspection. Accordingly, any areas of the building that are not accessible will be
excluded from the Report and the client will be charged an additional fee if those areas become accessible
and an inspection of those areas are requested.\n
Movement Of Objects: Our inspectors are not authorised to move any items on the properties we inspect
including but not limited to furniture, fittings, floor coverings, white goods, debris, vegetation or any
personal effects. These items can conceal termite infestation. Accordingly, the client will be charged an
additional fee to inspect these areas if access becomes available at a later date as a result of the
movement of these items.\n
Vacation Of Property: Occupied properties invariably present restrictions to access due to the presence
of furniture, furnishings, floor and wall coverings, insulation, appliances, foliage and personal possessions.
Accordingly, we will accept no responsibility for the presence of any termite infestation or for the repair of
any termite damage that may become apparent when a property is vacated by the former occupants of the
property.\n
Termite Damage: Should the presence of termite infestation be identified or suspected, it is not the
purpose of the Report to assess any damage due to termites.\n
Future Damage: This Report is based only on the condition of the building at the time of the inspection.
The Australian Standard AS4349.1 Part 1: Pre-purchase inspections— buildings states in section 2.2Purpose of Inspection that the purpose of the inspection is to provide advice to a prospective purchaser
regarding the condition of the property at the time of inspection. Accordingly, this Report is a Report on the
condition of the property at the time of the inspection and we accept no responsibility for any termite
infestation that may appear at any time in the future.\n
Termite Attack Awareness: Please be aware that termites can attack, infest and cause structural damage
to a property in a very short period of time, often in a matter of weeks, and for this reason this Thermal
Imaging Inspection and Report is only valid for 6 weeks from the date on the Report.
Repair Costs: Should the presence of termite infestation be identified or suspected, it is not the purpose of
the Report to assess the costs of repairs.\n
Undertaking of Repairs: It is not part of our engagement to undertake any repairs of any termite damage
that may be present in this property.\n
Termite Treatment: It is not part of our engagement to undertake any treatment where Timber Pests
infestation is found and it is not part of our engagement to undertake any repairs where damage caused by
Timber Pests is discovered.\n
Evidence Of a Treatment: Where evidence of a termite treatment is present, you should assume that the
treatment was applied as a curative measure and not as a preventative measure. You should obtain a
statement from the owner as to any treatments that have been carried out to the property. It is important to
obtain copies of any paperwork issued.\n
Conditions Conducive to Termite Infestation: This Report has identified a number of conditions that are
conducive to termite infestation and ALL the recommendations listed in the Report must be fully
implemented immediately to reduce the risk of Timber Pests entry and damage.
Preventative Treatment: Please note carefully that the only way to protect a property from being attacked
by Timber Pests is to have a complete preventative treatment carried out in accordance with Australian
Standard AS3660. Non-active Timber Pests can re-infest at any time unless a treatment is carried out
regularly and in accordance with the Australian Standard by a reputable Pest Control firm.
High Risk Categorisation: We may categorise this property as being of high risk that termite damage or
infestation may be present in any timber floor, wall and roof framing not exposed to view. Please note
carefully that should you undertake any alterations or additions to this property and discover any termitedamage or infestation, we will accept no responsibility for the presence of any termite damage or
infestation.\n
Pest Inspection and Report: This Thermal Imaging Report cannot be relied upon on its own and must be
read in conjunction with the Visual Timber Pest Inspection and Report in accordance with AS3660.2 and
AS4349.3.\n
Reliance on Report: In the event of any dispute or claim arising out of, or relating to the Inspection or the
Report, or any alleged negligent act or omission on our part or on the part of the individual conducting the
Inspection, you may rely on the Report to make a claim, however, you are required to rely on every part of
the report and you cannot be selective in the parts of the Report that you rely on
Verbal Report: This Report overrides any verbal report provided by our inspectors or any conversation that
may take place between our inspectors and the client. We strongly recommend that you do not exchange
contracts on the strength of a verbal report with the inspector and that every section of the Report is
thoroughly read before the purchase proceeds.\n
Disputes: In the event of any dispute or claim arising out of, or relating to the Inspection or the Report, or
any alleged negligent act or omission on our part or on the part of the individual conducting the Inspection,
either party must give written Notice of the dispute or claim to the other party. If the dispute is not resolved
within 21 days from the service of the Notice then either party may refer the dispute or claim to a mediator
nominated by this Company. Should the dispute or claim not be resolved by mediation then this Company
may refer the dispute or claim to the Institute of Arbitrators and Mediators of Australia who will appoint an
Arbitrator who will resolve the dispute by arbitration. The Arbitrators fees with be shared equally by the
Company and the client and the client is required to forward half of the cost of the Arbitrators fees to the
Company before the Arbitrator is engaged. The Arbitrator will also determine what costs each of the parties
are to pay.\n
Vexatious claims: You must read every section of the Report before you consider making a claim against
our Company. A vexatious claim is defined by the Courts as a claim that is without merit, ill conceived
and/or fraudulent. Should we categorise your claim as being without merit, ill conceived and/or fraudulent,
please note carefully that our response to your claim will incur a cost.
Conditions: The client agrees that they accept the report with all the conditions stated therein. Should the
Client not agree to any condition in this Report, a written Notice must be received in the Company's
registered office within 7 days of the date of the Report.\n
Liability To Third Parties: This Report is made for the use and benefit of the client named on the front of
the Report and no liability or responsibility whatsoever is accepted to any third party who may rely on the
Report, wholly or in part. Any third party seeking to rely or acting in reliance on this Report, whether in
whole or in part, does so at their own risk.Agreed Areas Of Inspection: For the purposes of any inspection where, regardless of whether access is
actually restricted, the client has instructed our inspector, or agreed with our inspector, that certain areas of
the property need not be inspected to fulfill their requirements for the inspection to have been completed
adequately. No liability or responsibility is accepted for termite infestation consequently found in any areas that the inspector was not instruct.''');
    }
    /*



/*   
 




 */

  

 */

    final List<int> bytes = document.saveSync();
    document.dispose();
    final diraa = await getApplicationDocumentsDirectory();
    final party = await FileStorage.generateKML(
        'fastinspection_${getStringAsync(k1PropertyBusinessName, defaultValue: 'name')}');
    //final path = "${FileStorage().}/fastinspection.pdf";
    //print(' this is the part $path');
    File receiptFile = File(party);
    receiptFile.writeAsBytesSync(bytes);

    return party;
  }

  static PdfLayoutResult showImage(
      String header, String t, PdfLayoutResult layoutResult93) {
    PdfLayoutResult layoutResultpage94 = showHeader(header, layoutResult93);
    if (t.trim().isNotEmpty) {
      final Uint8List imageData1 = File(t).readAsBytesSync();
//Load the image using PdfBitmap.
      final PdfBitmap image2 = PdfBitmap(imageData1);
//Draw the image to the PDF page.
      layoutResultpage94.page.graphics.drawImage(image2,
          Rect.fromLTWH(18, layoutResultpage94.bounds.bottom + 10, 230, 200));
    }
    return layoutResultpage94;
  }

  static PdfLayoutResult showImageSignature(
      String header, String t, PdfLayoutResult layoutResult93) {
    PdfLayoutResult layoutResultpage94 = showHeader(header, layoutResult93);
    if (t.trim().isNotEmpty) {
      final Uint8List imageData1 = File(t).readAsBytesSync();
//Load the image using PdfBitmap.
      final PdfBitmap image2 = PdfBitmap(imageData1);
//Draw the image to the PDF page.
      layoutResultpage94.page.graphics.drawImage(image2,
          Rect.fromLTWH(18, layoutResultpage94.bounds.bottom + 10, 100, 100));
    }
    return layoutResultpage94;
  }

  static PdfLayoutResult showImageBig(
      String header, String t, Size pageSize, PdfPage page) {
    PdfLayoutResult layoutResultpage94 = showHeaderBig(header, pageSize, page);
    if (t.trim().isNotEmpty) {
      final Uint8List imageData1 = File(t).readAsBytesSync();
//Load the image using PdfBitmap.
      final PdfBitmap image2 = PdfBitmap(imageData1);
//Draw the image to the PDF page.
      layoutResultpage94.page.graphics.drawImage(image2,
          Rect.fromLTWH(150, layoutResultpage94.bounds.bottom + 20, 220, 200));
    }
    return layoutResultpage94;
  }

  static PdfLayoutResult showImageSide(
      String header, String t, PdfLayoutResult layoutResult93) {
    if (t.trim().isNotEmpty) {
      final Uint8List imageData1 = File(t).readAsBytesSync();
//Load the image using PdfBitmap.
      final PdfBitmap image2 = PdfBitmap(imageData1);
//Draw the image to the PDF page.
      layoutResult93.page.graphics.drawImage(image2,
          Rect.fromLTWH(270, layoutResult93.bounds.bottom + 10, 220, 200));
    }
    return layoutResult93;
  }

  static PdfLayoutResult showImageDown(
      String header, String t, PdfLayoutResult layoutResult93) {
    if (t.trim().isNotEmpty) {
      final Uint8List imageData1 = File(t).readAsBytesSync();
//Load the image using PdfBitmap.
      final PdfBitmap image2 = PdfBitmap(imageData1);
//Draw the image to the PDF page.
      layoutResult93.page.graphics.drawImage(image2,
          Rect.fromLTWH(18, layoutResult93.bounds.bottom + 220, 230, 200));
    }
    return layoutResult93;
  }

  static PdfLayoutResult showImageDownNewPage(
      String header, String t, PdfLayoutResult layoutResult93) {
    if (t.trim().isNotEmpty) {
      final Uint8List imageData1 = File(t).readAsBytesSync();
//Load the image using PdfBitmap.
      final PdfBitmap image2 = PdfBitmap(imageData1);
//Draw the image to the PDF page.
      layoutResult93.page.graphics.drawImage(
          image2, Rect.fromLTWH(18, layoutResult93.bounds.bottom, 220, 200));
    }
    return layoutResult93;
  }

  static PdfLayoutResult showImageDownSide(
      String header, String t, PdfLayoutResult layoutResult93) {
    if (t.trim().isNotEmpty) {
      final Uint8List imageData1 = File(t).readAsBytesSync();
//Load the image using PdfBitmap.
      final PdfBitmap image2 = PdfBitmap(imageData1);
//Draw the image to the PDF page.
      layoutResult93.page.graphics.drawImage(image2,
          Rect.fromLTWH(270, layoutResult93.bounds.bottom + 220, 220, 200));
    }
    return layoutResult93;
  }

  static PdfLayoutResult showImageDownSideNewPage(
      String header, String t, PdfLayoutResult layoutResult93) {
    if (t.trim().isNotEmpty) {
      final Uint8List imageData1 = File(t).readAsBytesSync();
//Load the image using PdfBitmap.
      final PdfBitmap image2 = PdfBitmap(imageData1);
//Draw the image to the PDF page.
      layoutResult93.page.graphics.drawImage(
          image2, Rect.fromLTWH(270, layoutResult93.bounds.bottom, 220, 200));
    }
    return layoutResult93;
  }

  static PdfLayoutResult showImage4(
      String header, String t, PdfLayoutResult layoutResult93) {
    if (t.trim().isNotEmpty) {
      final Uint8List imageData1 = File(t).readAsBytesSync();
//Load the image using PdfBitmap.
      final PdfBitmap image2 = PdfBitmap(imageData1);
//Draw the image to the PDF page.
      layoutResult93.page.graphics.drawImage(
          image2,
          Rect.fromLTWH(layoutResult93.bounds.right + 5,
              layoutResult93.bounds.bottom + 10, 220, 200));
    }
    return layoutResult93;
  }

  static PdfLayoutResult showTextWithRectangle(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required String text}) {
    PdfLayoutResult layoutResult1 = showHeader(header, layoutResult);
    layoutResult.page.graphics.drawRectangle(
        brush: PdfBrushes.aliceBlue,
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(
            10, layoutResult1.bounds.bottom + 5, pageSize.width / 2 - 80, 30));
    PdfTextElement textElement = PdfTextElement(
        text: text.trim().isEmptyOrNull ? 'Nil' : text,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 10,
            layoutResult1.bounds.bottom + 11,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextWithRectangleWithSpace(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required String text}) {
    PdfLayoutResult layoutResult1 = showHeader2(header, layoutResult);
    layoutResult1 = showHeaderAfterBig2('', layoutResult1, 5);
    layoutResult.page.graphics.drawRectangle(
        brush: PdfBrushes.aliceBlue,
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(
            10, layoutResult1.bounds.bottom + 5, pageSize.width / 2 - 80, 30));
    PdfTextElement textElement = PdfTextElement(
        text: text.trim().isEmptyOrNull ? 'Nil' : text,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 10,
            layoutResult1.bounds.bottom + 11,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextWithRectangleLong(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required String text}) {
    PdfLayoutResult layoutResult1 = showHeader(header, layoutResult);
    layoutResult.page.graphics.drawRectangle(
        brush: PdfBrushes.aliceBlue,
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(
            10, layoutResult1.bounds.bottom + 10, pageSize.width / 2 + 50, 30));
    PdfTextElement textElement = PdfTextElement(
        text: text.trim().isEmptyOrNull ? 'Nil' : text,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 10,
            layoutResult1.bounds.bottom + 16,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextWithRectangleBig(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required String text}) {
    PdfLayoutResult layoutResult1 = showHeader(header, layoutResult);
    layoutResult.page.graphics.drawRectangle(
        brush: PdfBrushes.aliceBlue,
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(
            10, layoutResult1.bounds.bottom + 10, pageSize.width - 100, 60));
    PdfTextElement textElement = PdfTextElement(
        text: text.trim().isEmptyOrNull ? 'Nil' : text,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult1.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 10,
            layoutResult1.bounds.bottom + 20,
            layoutResult1.page.getClientSize().width - 110,
            layoutResult1.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextWithRectangleBigSmall(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required String text}) {
    PdfLayoutResult layoutResult1 = showHeader(header, layoutResult);
    layoutResult.page.graphics.drawRectangle(
        brush: PdfBrushes.aliceBlue,
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(
            10, layoutResult1.bounds.bottom + 10, pageSize.width - 100, 50));
    PdfTextElement textElement = PdfTextElement(
        text: text.trim().isEmptyOrNull ? 'Nil' : text,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult1.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 10,
            layoutResult1.bounds.bottom + 20,
            layoutResult1.page.getClientSize().width - 110,
            layoutResult1.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextWithRectangleBigSide(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required String text}) {
    PdfLayoutResult layoutResult1 =
        showHeaderSideRect(header, layoutResult, pageSize);
    layoutResult.page.graphics.drawRectangle(
        brush: PdfBrushes.aliceBlue,
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(
            20, layoutResult1.bounds.bottom + 10, pageSize.width / 1.5, 100));
    PdfTextElement textElement = PdfTextElement(
        text: text, font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult1.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 5,
            layoutResult1.bounds.bottom + 15,
            pageSize.width / 1.5,
            layoutResult1.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextWithRecCheck(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required bool text,
      required String type,
      required Uint8List checkerImageData}) {
    PdfLayoutResult layoutResult1 = showHeaderCheck(header, layoutResult);
    layoutResult1.page.graphics.drawRectangle(
        brush: PdfBrushes.aliceBlue,
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(layoutResult1.bounds.left + 5,
            layoutResult1.bounds.bottom + 5, 20, 20));
    PdfTextElement textElement = PdfTextElement(
        text: type, font: PdfStandardFont(PdfFontFamily.helvetica, 14));

    if (text) {
//Load the image using PdfBitmap.
      final PdfBitmap image = PdfBitmap(checkerImageData);
//Draw the image to the PDF page.
      layoutResult.page.graphics.drawImage(
        image,
        Rect.fromLTWH(layoutResult1.bounds.left + 10,
            layoutResult1.bounds.bottom + 10, 10, 10),
      );
    }
    /*  if (type.toLowerCase().contains('yes')) {
    layoutResult1.page.graphics.drawEllipse(
        Rect.fromLTWH(layoutResult1.bounds.left + 13,
            layoutResult1.bounds.bottom + 17, 15, 15),
        pen: PdfPen(PdfColor(0, 0, 0), width: 2),
        brush: PdfBrushes.black);
 // }
 */
    /* drawRectangle(
      brush: PdfBrushes.aliceBlue,
      pen: PdfPen(PdfColor(142, 170, 219)),
      bounds: Rect.fromLTWH(
          10, layoutResult1.bounds.bottom + 10, pageSize.width / 2 - 20, 50)); */

    PdfTextElement textElement1 = PdfTextElement(
        text: type, font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement1.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 40,
            layoutResult1.bounds.bottom + 6,
            layoutResult1.page.getClientSize().width - 10,
            layoutResult1.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextWithRecCheckSide(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required bool text,
      required String type,
      required Uint8List checkerImageData}) {
    PdfLayoutResult layoutResult1 =
        showHeaderCheckSideRec(header, layoutResult);
    layoutResult1.page.graphics.drawRectangle(
        brush: PdfBrushes.aliceBlue,
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(layoutResult1.bounds.left + 160,
            layoutResult1.bounds.bottom - 58, 25, 25));
    PdfTextElement textElement = PdfTextElement(
        text: type, font: PdfStandardFont(PdfFontFamily.helvetica, 14));

    if (text) {
//Load the image using PdfBitmap.
      final PdfBitmap image = PdfBitmap(checkerImageData);
//Draw the image to the PDF page.
      layoutResult.page.graphics.drawImage(
        image,
        Rect.fromLTWH(layoutResult1.bounds.left + 165,
            layoutResult1.bounds.bottom - 54, 15, 15),
      );
    }
    /*  if (type.toLowerCase().contains('yes')) {
    layoutResult1.page.graphics.drawEllipse(
        Rect.fromLTWH(layoutResult1.bounds.left + 13,
            layoutResult1.bounds.bottom + 17, 15, 15),
        pen: PdfPen(PdfColor(0, 0, 0), width: 2),
        brush: PdfBrushes.black);
 // }
 */
    /* drawRectangle(
      brush: PdfBrushes.aliceBlue,
      pen: PdfPen(PdfColor(142, 170, 219)),
      bounds: Rect.fromLTWH(
          10, layoutResult1.bounds.bottom + 10, pageSize.width / 2 - 20, 50)); */

    PdfTextElement textElement1 = PdfTextElement(
        text: type, font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement1.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 200,
            layoutResult1.bounds.bottom - 55,
            layoutResult1.page.getClientSize().width - 10,
            layoutResult1.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextWithCircle(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required String text,
      required String type}) {
    PdfLayoutResult layoutResult1 = showHeaderCheck(header, layoutResult);
    layoutResult1.page.graphics.drawEllipse(
        Rect.fromLTWH(layoutResult1.bounds.left + 5,
            layoutResult1.bounds.bottom + 10, 12, 12),
        pen: PdfPen(PdfColor(0, 0, 0), width: 2));
    if (type.toLowerCase().contains('yes')) {
      layoutResult1.page.graphics.drawEllipse(
          Rect.fromLTWH(layoutResult1.bounds.left + 7.5,
              layoutResult1.bounds.bottom + 12.4, 7, 7),
          pen: PdfPen(PdfColor(0, 0, 0), width: 0.7),
          brush: PdfBrushes.black);
    }

    /* drawRectangle(
      brush: PdfBrushes.aliceBlue,
      pen: PdfPen(PdfColor(142, 170, 219)),
      bounds: Rect.fromLTWH(
          10, layoutResult1.bounds.bottom + 10, pageSize.width / 2 - 20, 50)); */

    PdfTextElement textElement = PdfTextElement(
        text: text, font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 40,
            layoutResult1.bounds.bottom + 7,
            layoutResult1.page.getClientSize().width - 10,
            layoutResult1.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextWithCircleSide(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required String text,
      required String type}) {
    PdfLayoutResult layoutResult1 = showHeaderCheckSide(header, layoutResult);
    layoutResult1.page.graphics.drawEllipse(
        Rect.fromLTWH(layoutResult1.bounds.left + 0,
            layoutResult1.bounds.bottom + 10, 12, 12),
        pen: PdfPen(PdfColor(0, 0, 0), width: 2));
    if (type.toLowerCase().contains('no')) {
      layoutResult1.page.graphics.drawEllipse(
          Rect.fromLTWH(layoutResult1.bounds.left + 2.5,
              layoutResult1.bounds.bottom + 12.4, 7, 7),
          pen: PdfPen(PdfColor(0, 0, 0), width: 0.7),
          brush: PdfBrushes.black);
    }

    /* drawRectangle(
      brush: PdfBrushes.aliceBlue,
      pen: PdfPen(PdfColor(142, 170, 219)),
      bounds: Rect.fromLTWH(
          10, layoutResult1.bounds.bottom + 10, pageSize.width / 2 - 20, 50)); */

    PdfTextElement textElement = PdfTextElement(
        text: text, font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 30,
            layoutResult1.bounds.bottom + 8,
            layoutResult1.page.getClientSize().width - 10,
            layoutResult1.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextWithCircleSide2(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required String text,
      required String type}) {
    PdfLayoutResult layoutResult1 = showHeaderCheckSide2(header, layoutResult);
    layoutResult1.page.graphics.drawEllipse(
        Rect.fromLTWH(layoutResult1.bounds.left + 0,
            layoutResult1.bounds.top - 10, 12, 12),
        pen: PdfPen(PdfColor(0, 0, 0), width: 2));
    if (type.toLowerCase().contains('no')) {
      layoutResult1.page.graphics.drawEllipse(
          Rect.fromLTWH(layoutResult1.bounds.left + 2.5,
              layoutResult1.bounds.top - 7.5, 7, 7),
          pen: PdfPen(PdfColor(0, 0, 0), width: 0.7),
          brush: PdfBrushes.black);
    }
//layoutResult1.bounds.top - 15
    /* drawRectangle(
      brush: PdfBrushes.aliceBlue,
      pen: PdfPen(PdfColor(142, 170, 219)),
      bounds: Rect.fromLTWH(
          10, layoutResult1.bounds.bottom + 10, pageSize.width / 2 - 20, 50)); */

    PdfTextElement textElement = PdfTextElement(
        text: text, font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 30,
            layoutResult1.bounds.top - 12,
            layoutResult1.page.getClientSize().width - 10,
            layoutResult1.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextFullRectangle(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required String text}) {
    PdfLayoutResult layoutResult1 = showHeader(header, layoutResult);
    layoutResult1.page.graphics.drawRectangle(
        brush: PdfBrushes.aliceBlue,
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(
            10, layoutResult1.bounds.bottom + 5, pageSize.width - 70, 30));
    PdfTextElement textElement = PdfTextElement(
        text: text.trim().isEmpty ? 'Nil' : text,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult1.page,
        bounds: Rect.fromLTWH(
            layoutResult1.bounds.left + 10,
            layoutResult1.bounds.bottom + 10,
            layoutResult1.page.getClientSize().width - 10,
            layoutResult1.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextWithRectangleSide(
      {required PdfLayoutResult layoutResult,
      required Size pageSize,
      required String header,
      required String text}) {
    PdfLayoutResult layoutResult1 =
        showHeaderSide(header, layoutResult, pageSize);
    layoutResult.page.graphics.drawRectangle(
        brush: PdfBrushes.aliceBlue,
        pen: PdfPen(PdfColor(142, 170, 219)),
        bounds: Rect.fromLTWH(pageSize.width / 2 + 20,
            layoutResult1.bounds.bottom + 5, pageSize.width / 2 - 80, 30));
    PdfTextElement textElement = PdfTextElement(
        text: text.trim().isEmpty ? 'Nil' : text,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            pageSize.width / 2 + 30,
            layoutResult1.bounds.bottom + 12,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;
  }

//showtext
  static PdfLayoutResult showBusinessName(
      String text1, Size size, PdfPage page) {
    PdfFont font =
        PdfStandardFont(PdfFontFamily.helvetica, 24, style: PdfFontStyle.bold);
    PdfTextElement textElement = PdfTextElement(
      text: text1,
      font: font,
    );
    Size stringSize = font.measureString(text1);
    print(size.width);
//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: page,
        bounds: Rect.fromLTWH(
            (page.getClientSize().width - stringSize.width) / 2,
            270,
            page.getClientSize().width - 10,
            page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showReport(String text1, Size size, PdfPage page) {
    PdfFont font =
        PdfStandardFont(PdfFontFamily.helvetica, 26, style: PdfFontStyle.bold);
    PdfTextElement textElement = PdfTextElement(
      text: text1,
      font: font,
    );
    Size stringSize = font.measureString(text1);
    print(size.width);
//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: page,
        bounds: Rect.fromLTWH(
            (page.getClientSize().width - stringSize.width) / 2,
            20,
            page.getClientSize().width - 10,
            page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showBusinessAddress(
      String text1, Size size, PdfPage page, double height) {
    PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 18);
    PdfTextElement textElement = PdfTextElement(text: text1, font: font);
    Size stringSize = font.measureString(text1);
    print('string width = ${stringSize.width}');
//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: page,
        bounds: Rect.fromLTWH(
            (page.getClientSize().width - stringSize.width) / 2,
            height,
            page.getClientSize().width - 10,
            page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showText(PdfPage page, String text1, String text2) {
    PdfTextElement textElement = PdfTextElement(
        text: text1, font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    PdfLayoutResult layoutResult = textElement.draw(
        page: page,
        bounds: Rect.fromLTWH(0, 0, page.getClientSize().width - 10,
            page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement

    textElement.text = text2;

//Assign standard font to PdfTextElement
    textElement.font =
        PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.bold);

//Draw the header text on page, below the paragraph text with a height gap of 20 and maintain the position in PdfLayoutResult
    return layoutResult = textElement.draw(
        page: page,
        bounds: Rect.fromLTWH(
            0,
            layoutResult.bounds.bottom + 20,
            page.getClientSize().width - 10,
            page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showTextLarge(
    PdfLayoutResult layoutResult,
    String text1,
  ) {
    PdfTextElement textElement = PdfTextElement(
        text: text1, font: PdfStandardFont(PdfFontFamily.helvetica, 14));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            18,
            layoutResult.bounds.bottom + 20,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;
  }

  static PdfLayoutResult showHeaderDynamic(
      String text1, PdfLayoutResult layoutResult) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            20,
            layoutResult.bounds.bottom + 170,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showLogo(
      String header, String t, Size pageSize, PdfPage page) {
    PdfLayoutResult layoutResultpage94 = showHeaderBig('', pageSize, page);
    if (t.trim().isNotEmpty) {
      final Uint8List imageData1 = File(t).readAsBytesSync();
//Load the image using PdfBitmap.
      final PdfBitmap image2 = PdfBitmap(imageData1);
//Draw the image to the PDF page.
      layoutResultpage94.page.graphics.drawImage(
          image2, Rect.fromLTWH((pageSize.width / 2) - 100, 60, 215, 200));
    }
    return layoutResultpage94;
  }

  static PdfLayoutResult showHeader(
      String text1, PdfLayoutResult layoutResult) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(
          PdfFontFamily.helvetica, 14,
          // style: PdfFontStyle.
        ));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            10,
            layoutResult.bounds.bottom + 20,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderBig(String text1, Size size, PdfPage page) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: page,
        bounds: Rect.fromLTWH(20, 20, page.getClientSize().width - 10,
            page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderSide2(
      String text1, PdfLayoutResult layoutResult, Size pageSize) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            pageSize.width / 2 + 20,
            layoutResult.bounds.top - 20,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderCheck(
      String text1, PdfLayoutResult layoutResult) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            20,
            layoutResult.bounds.bottom + 5,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderCheckSide(
      String text1, PdfLayoutResult layoutResult) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            120,
            layoutResult.bounds.bottom + 5,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderCheckSide2(
      String text1, PdfLayoutResult layoutResult) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            120,
            layoutResult.bounds.bottom - 5,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

//property image show method
  static PdfLayoutResult showPropertyImage(
      String header, String t, Size pageSize, PdfPage page) {
    PdfLayoutResult layoutResultpage94 = showHeaderBig('', pageSize, page);
    List<String> files = t.split('J@^J');
    if (t.trim().isNotEmpty && files.isNotEmpty) {
      print(files);
      final Uint8List imageData1 = File(files[1].toString()).readAsBytesSync();
//Load the image using PdfBitmap.
      final PdfBitmap image2 = PdfBitmap(imageData1);
//Draw the image to the PDF page.
      layoutResultpage94.page.graphics.drawImage(
          image2,
          Rect.fromLTWH(
              (pageSize.width / 2) - 205, pageSize.height * 0.59, 410, 270));
    }
    return layoutResultpage94;
  }

  static PdfLayoutResult showHeaderCheckSideRec(
      String text1, PdfLayoutResult layoutResult) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            layoutResult.bounds.left + 30,
            layoutResult.bounds.bottom + 20,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult space(String text1, PdfLayoutResult layoutResult) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            20,
            layoutResult.bounds.bottom + 50,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeader2(
      String text1, PdfLayoutResult layoutResult) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 16,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            20,
            layoutResult.bounds.bottom + 25,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderAfterBig(
      String text1, PdfLayoutResult layoutResult) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 16,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            18,
            layoutResult.bounds.bottom + 70,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderAfterBigSmall(
      String text1, PdfLayoutResult layoutResult) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 16,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            18,
            layoutResult.bounds.bottom,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderAfterBig2(
      String text1, PdfLayoutResult layoutResult, int height) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 16,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            18,
            layoutResult.bounds.bottom + height,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderNewPage(String text1, PdfPage page) {
    text1 = text1.contains('khali') ? '' : text1;
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 16,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: page,
        bounds: Rect.fromLTWH(
            18,
            text1.contains('khali') ? 0 : 10,
            page.getClientSize().width - 10,
            page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderNewPageLite(String text1, PdfPage page) {
    text1 = text1.contains('khali') ? '' : text1;
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(
          PdfFontFamily.helvetica,
          14,
        ));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: page,
        bounds: Rect.fromLTWH(
            18,
            text1.contains('khali') ? 0 : 10,
            page.getClientSize().width - 10,
            page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderSide(
      String text1, PdfLayoutResult layoutResult, Size pageSize) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(
          PdfFontFamily.helvetica, 14,
          //style: PdfFontStyle.bold
        ));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            pageSize.width / 2 + 20,
            layoutResult.bounds.bottom - 47,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showInspectionAddress(
      String text1, Size size, PdfPage page) {
    PdfFont font =
        PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold);
    PdfTextElement textElement = PdfTextElement(text: text1, font: font);
    Size stringSize = font.measureString(text1);
//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: page,
        bounds: Rect.fromLTWH(
            (page.getClientSize().width - stringSize.width) / 2,
            740,
            page.getClientSize().width - 10,
            page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

  static PdfLayoutResult showHeaderSideRect(
      String text1, PdfLayoutResult layoutResult, Size pageSize) {
    PdfTextElement textElement = PdfTextElement(
        text: text1,
        font: PdfStandardFont(PdfFontFamily.helvetica, 14,
            style: PdfFontStyle.bold));

//Draw the paragraph text on page and maintain the position in PdfLayoutResult
    return textElement.draw(
        page: layoutResult.page,
        bounds: Rect.fromLTWH(
            20,
            layoutResult.bounds.bottom,
            layoutResult.page.getClientSize().width - 10,
            layoutResult.page.getClientSize().height - 10))!;

//Assign header text to PdfTextElement
  }

//Draws the invoice header
  static PdfLayoutResult drawHeader(
    PdfPage page,
    Size pageSize,
  ) {
    //Draw rectangle
    /* page.graphics.drawRectangle(
      brush: PdfSolidBrush(PdfColor(91, 126, 215)),
      bounds: Rect.fromLTWH(0, 200, pageSize.width - 115, 90)); */
    //Draw string
    page.graphics.drawString(
        'INVOICE', PdfStandardFont(PdfFontFamily.helvetica, 30),
        brush: PdfBrushes.white,
        bounds: Rect.fromLTWH(25, 200, pageSize.width - 115, 90),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    /*  page.graphics.drawRectangle(
      bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 90),
      brush: PdfSolidBrush(PdfColor(65, 104, 205))); */

    /*  page.graphics.drawString(r'$', PdfStandardFont(PdfFontFamily.helvetica, 18),
      bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 100),
      brush: PdfBrushes.white,
      format: PdfStringFormat(
          alignment: PdfTextAlignment.center,
          lineAlignment: PdfVerticalAlignment.middle)); */

    final PdfFont contentFont = PdfStandardFont(PdfFontFamily.helvetica, 9);
    //Draw string
    page.graphics.drawString('Amount', contentFont,
        brush: PdfBrushes.white,
        bounds: Rect.fromLTWH(400, 0, pageSize.width - 400, 33),
        format: PdfStringFormat(
            alignment: PdfTextAlignment.center,
            lineAlignment: PdfVerticalAlignment.bottom));
    //Create data foramt and convert it to text.
    final DateFormat format = DateFormat.yMMMMd('en_US');
    final String invoiceNumber =
        'Invoice Number: 2058557939\r\n\r\nDate: ${format.format(DateTime.now())}';
    final Size contentSize = contentFont.measureString(invoiceNumber);
    // ignore: leading_newlines_in_multiline_strings
    const String address = '''Bill To: \r\n\r\nAbraham Swearegin, 
        \r\n\r\nUnited States, California, San Mateo, 
        \r\n\r\n9920 BridgePointe Parkway, \r\n\r\n9365550136''';

    PdfTextElement(text: invoiceNumber, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(pageSize.width - (contentSize.width + 30), 120,
            contentSize.width + 30, pageSize.height - 120));

    return PdfTextElement(text: address, font: contentFont).draw(
        page: page,
        bounds: Rect.fromLTWH(30, 120,
            pageSize.width - (contentSize.width + 30), pageSize.height - 120))!;
  }

//Draws the grid
  void drawGrid(PdfPage page, PdfGrid grid, PdfLayoutResult result) {
    Rect? totalPriceCellBounds;
    Rect? quantityCellBounds;
    //Invoke the beginCellLayout event.
    grid.beginCellLayout = (Object sender, PdfGridBeginCellLayoutArgs args) {
      final PdfGrid grid = sender as PdfGrid;
      if (args.cellIndex == grid.columns.count - 1) {
        totalPriceCellBounds = args.bounds;
      } else if (args.cellIndex == grid.columns.count - 2) {
        quantityCellBounds = args.bounds;
      }
    };
    //Draw the PDF grid and get the result.
    result = grid.draw(
        page: page, bounds: Rect.fromLTWH(0, result.bounds.bottom + 40, 0, 0))!;

    //Draw grand total.
    page.graphics.drawString('Grand Total',
        PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
            quantityCellBounds!.left,
            result.bounds.bottom + 10,
            quantityCellBounds!.width,
            quantityCellBounds!.height));
    page.graphics.drawString(getTotalAmount(grid).toString(),
        PdfStandardFont(PdfFontFamily.helvetica, 9, style: PdfFontStyle.bold),
        bounds: Rect.fromLTWH(
            totalPriceCellBounds!.left,
            result.bounds.bottom + 10,
            totalPriceCellBounds!.width,
            totalPriceCellBounds!.height));
  }

//Draw the invoice footer data.
  void drawFooter(PdfPage page, Size pageSize) {
    final PdfPen linePen =
        PdfPen(PdfColor(142, 170, 219), dashStyle: PdfDashStyle.custom);
    linePen.dashPattern = <double>[3, 3];
    //Draw line
    page.graphics.drawLine(linePen, Offset(0, pageSize.height - 100),
        Offset(pageSize.width, pageSize.height - 100));

    const String footerContent =
        // ignore: leading_newlines_in_multiline_strings
        '''800 Interchange Blvd.\r\n\r\nSuite 2501, Austin,
         TX 78721\r\n\r\nAny Questions? support@adventure-works.com''';

    //Added 30 as a margin for the layout
    page.graphics.drawString(
        footerContent, PdfStandardFont(PdfFontFamily.helvetica, 9),
        format: PdfStringFormat(alignment: PdfTextAlignment.right),
        bounds: Rect.fromLTWH(pageSize.width - 30, pageSize.height - 70, 0, 0));
  }

//Create PDF grid and return
  PdfGrid getGrid() {
    //Create a PDF grid
    final PdfGrid grid = PdfGrid();
    //Secify the columns count to the grid.
    grid.columns.add(count: 5);
    //Create the header row of the grid.
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    //Set style
    headerRow.style.backgroundBrush = PdfSolidBrush(PdfColor(68, 114, 196));
    headerRow.style.textBrush = PdfBrushes.white;
    headerRow.cells[0].value = 'Product Id';
    headerRow.cells[0].stringFormat.alignment = PdfTextAlignment.center;
    headerRow.cells[1].value = 'Product Name';
    headerRow.cells[2].value = 'Price';
    headerRow.cells[3].value = 'Quantity';
    headerRow.cells[4].value = 'Total';
    //Add rows
    addProducts('CA-1098', 'AWC Logo Cap', 8.99, 2, 17.98, grid);
    addProducts('LJ-0192', 'Long-Sleeve Logo Jersey,M', 49.99, 3, 149.97, grid);
    addProducts('So-B909-M', 'Mountain Bike Socks,M', 9.5, 2, 19, grid);
    addProducts('LJ-0192', 'Long-Sleeve Logo Jersey,M', 49.99, 4, 199.96, grid);
    addProducts('FK-5136', 'ML Fork', 175.49, 6, 1052.94, grid);
    addProducts('HL-U509', 'Sports-100 Helmet,Black', 34.99, 1, 34.99, grid);
    //Apply the table built-in style
    grid.applyBuiltInStyle(PdfGridBuiltInStyle.listTable4Accent5);
    //Set gird columns width
    grid.columns[1].width = 200;
    for (int i = 0; i < headerRow.cells.count; i++) {
      headerRow.cells[i].style.cellPadding =
          PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
    }
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        if (j == 0) {
          cell.stringFormat.alignment = PdfTextAlignment.center;
        }
        cell.style.cellPadding =
            PdfPaddings(bottom: 5, left: 5, right: 5, top: 5);
      }
    }
    return grid;
  }

//Create and row for the grid.
  void addProducts(String productId, String productName, double price,
      int quantity, double total, PdfGrid grid) {
    final PdfGridRow row = grid.rows.add();
    row.cells[0].value = productId;
    row.cells[1].value = productName;
    row.cells[2].value = price.toString();
    row.cells[3].value = quantity.toString();
    row.cells[4].value = total.toString();
  }

//Get the total amount.
  double getTotalAmount(PdfGrid grid) {
    double total = 0;
    for (int i = 0; i < grid.rows.count; i++) {
      final String value =
          grid.rows[i].cells[grid.columns.count - 1].value as String;
      total += double.parse(value);
    }
    return total;
  }
}
