import 'dart:io';
import 'dart:isolate';

//import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:cr_file_saver/file_saver.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fast_inspection/constants/colors.dart';
import 'package:fast_inspection/constants/fonts.dart';
import 'package:fast_inspection/my_widgets.dart/dialoge.dart';
import 'package:fast_inspection/screens/all_pages_pdf.dart';
import 'package:fast_inspection/screens/page1.dart';
import 'package:fast_inspection/screens/page10.dart';
import 'package:fast_inspection/screens/page11.dart';
import 'package:fast_inspection/screens/page12.dart';
import 'package:fast_inspection/screens/page13.dart';
import 'package:fast_inspection/screens/page2.dart';
import 'package:fast_inspection/screens/page3.dart';
import 'package:fast_inspection/screens/page4.dart';
import 'package:fast_inspection/screens/page5.dart';
import 'package:fast_inspection/screens/page6.dart';
import 'package:fast_inspection/screens/page7.dart';
import 'package:fast_inspection/screens/page8.dart';
import 'package:fast_inspection/screens/page9.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signature/signature.dart';

import '../constants/constant_values.dart';
import '../constants/loader.dart';
import '../constants/tab_options.dart';
import '../controller/page10_controller.dart';
import '../models/my_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabProvider = StateProvider<List<TabOptions>>((ref) {
  return [
    const TabOptions(id: 0, title: 'Page 1'),
    const TabOptions(id: 1, title: 'Page 2'),
    const TabOptions(id: 2, title: 'Page 3'),
    const TabOptions(id: 3, title: 'Page 4'),
    const TabOptions(id: 4, title: 'Page 5'),
    const TabOptions(id: 5, title: 'Page 6'),
    const TabOptions(id: 6, title: 'Page 7'),
    const TabOptions(id: 7, title: 'Page 8'),
    const TabOptions(id: 8, title: 'Page 9'),
    //const TabOptions(id: 9, title: 'Page 10'),
    const TabOptions(id: 10, title: 'Page 11'),
    // const TabOptions(id: 11, title: 'Page 12'),
    const TabOptions(id: 12, title: 'Page 13'),
  ];
});

final selectedProvider = StateProvider<TabOptions>((ref) {
  return const TabOptions(id: 0, title: 'Page 1');
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

enum SingingCharacter { yes, no }

enum EvidenceActive { yes, no }

enum EvidenceTermite { yes, no }

enum EvidencePrevious { yes, no }

enum EvidenceChemical { yes, no }

enum EvidenceFungal { yes, no }

enum EvidenceWood { yes, no }

enum EvidenceConducive { yes, no }

enum EvidenceHazards { yes, no }

class _HomeScreenState extends ConsumerState<HomeScreen> {
  /*  List<TabOptions> options = [
   
  ]; */
  final SingingCharacter _character = SingingCharacter.yes;
  final EvidenceActive _active = EvidenceActive.yes;
  final EvidenceTermite _termite = EvidenceTermite.yes;
  final EvidencePrevious _previous = EvidencePrevious.yes;
  final EvidenceChemical _chemical = EvidenceChemical.yes;
  final EvidenceFungal _fungal = EvidenceFungal.yes;
  final EvidenceWood _wood = EvidenceWood.yes;
  final EvidenceConducive _conducive = EvidenceConducive.yes;
  final EvidenceHazards _hazards = EvidenceHazards.yes;

  int selectedPage = 0;
  bool isLoading = false;

  List<String> faces = [
    'North',
    'East',
    'South',
    'West',
    'North East',
  ];

  List<String> propertyType = [
    'Free Standing house',
    'Unit',
    'Terrace',
    'Semi Duplex',
    'Townhouse',
  ];

  List<String> occupancy = [
    'Occupied and furnished',
    'Unoccupied and furnished',
    'Unoccupied and unfurnished',
  ];

  List<String> noRooms = [
    '1',
    '2',
    '3',
    '4',
    '5 or more',
  ];

  List<String> kitchenList = [
    'Building and pest',
    'Building, pest & electrical',
    'Building, pest, electrical and thermal imaging',
    'N/A',
    'Pest only',
  ];

  List<String> exteriorList = [
    'Satisfactory',
    'Minor defect',
    'Major defect',
    'N/A',
    'No access',
  ];

  var imagevalue;
  // File? file;
  String status = '';
  String? base64Image;
  File? _image;

  Future<String?> getImage() async {
    /*  var image = await ImagePickerGC.pickImage(
      barrierDismissible: true,
      context: context,
      source: source,
      maxHeight: 400,
      maxWidth: 300,
      cameraIcon: const Icon(
        Icons.add,
        color: Colors.red,
      ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
    );
    return image.value; */
    Future<String> getImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      /*  var image = await ImagePickerGC.pickImage(
        barrierDismissible: true,
        context: context,
        source: source,
        maxHeight: 400,
        maxWidth: 300,
        cameraIcon: const Icon(
          Icons.add,
          color: Colors.red,
        ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
      ); */
      return image?.path ?? "";
    }

    return null;

    /* setState(() {
      _image = File(image.path);
    });
    Uint8List imageBytes = await _image!.readAsBytes();
    base64Image = base64.encode(imageBytes);
    imagevalue = base64Image;
    print(base64Image); */
  }

  bool brick = false;
  bool full = false;
  bool frame = false;
  bool clad = false;
  bool sheet = false;
  bool combination = false;
  bool meal = false;
  bool concrete = false;
  bool asbestos = false;
  bool tarracota = false;
  bool flat = false;
  bool pitched = false;
  bool come = false;
  bool other = false;
  bool timber = false;
  bool sandstone = false;
  bool slab = false;
  bool other2 = false;
  bool roof = false;
  bool exterior = false;
  bool interior = false;
  bool partInterior = false;
  bool subfloor = false;
  bool partsubfloor = false;
  bool locked = false;
  bool garage = false;
  bool granny = false;
  bool cupboards = false;
  bool covering = false;
  bool furniture = false;
  bool items = false;
  bool vegetation = false;
  bool ac = false;
  bool insulation = false;
  bool val1 = false;
  bool val2 = false;

  String? facadeFace;
  String? typeProperty;
  String? occupancyStatus;
  String? bedrooms;
  String? toilets;
  String? laundries;
  String? livingrooms;
  String? kitchens;
  String? bathrooms;
  String? inspection;
  String? weather;
  String? condition;
  String? kitchFloor;
  String? kitchWall;
  String? kitchDoors;
  String? kitchCeiling;
  String? kitchBenchTop;
  String? kitchTaps;
  String? kitchCup;
  String? kitchHood;
  String? bathFloor;
  String? bathTiles;
  String? bathVanity;
  String? bathShower;
  String? bathWaste;
  String? bathDoor;
  String? bathWindow;
  String? drainage;
  String? fences;
  String? retainWalls;
  String? carport;
  String? pavement;
  String? taps;
  String? pavers;
  String? rangehood;

  String doi = '';
  String dor = '';
  DateTime selectedDate = DateTime.now();

  Future<String?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      /* setState(() {
        selectedDate = picked;
      }); */
      var formatter = DateFormat('dd-MM-yyyy');
      return formatter.format(selectedDate);
    }
    return null;
  }

  /*  Future<void> _selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      var formatter = DateFormat('dd-MM-yyyy');
      String formatted = formatter.format(selectedDate);
      setState(() {
        dor = formatted;
      });
    }
  } */
  List<String> kitchenListStore = [];
  List<String> bathRoomListStore = [];
  List<String> livingRoomListStore = [];
  List<String> buildingRoomListStore = [];
  List<String> laundryRoomListStore = [];
  List<String> buidExtRoomListStore = [];
  List<Point> listSignature = [];
  late ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    getPref();

    super.initState();
  }

  getPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    /* const String k5KitchenNumberList = 'k5KitchenNumberList';
const String k5BathroomNumberList = 'k5BathroomNumberList';
const String k5LivingRoomNumberList = 'k5LivingRoomNumberList';
const String k5BuilldingNumberList = 'k5BuilldingNumberList'; */
    kitchenListStore = prefs.getStringList(k5KitchenNumberList) ?? ['1'];
    bathRoomListStore = prefs.getStringList(k5BathroomNumberList) ?? ['1'];
    livingRoomListStore = prefs.getStringList(k5LivingRoomNumberList) ?? ['1'];
    buildingRoomListStore = prefs.getStringList(k5BuilldingNumberList) ?? ['1'];
    laundryRoomListStore = prefs.getStringList(k5LuandryNumberList) ?? ['1'];
    buidExtRoomListStore = prefs.getStringList(k5BuidExtNumberList) ?? ['1'];

    final String? musicsString = prefs.getString('signature');

    if (musicsString != null) {
      //List<String> stringList =
      List<MyPoint> pointList = MyPoint.decode(musicsString);

      for (MyPoint point in pointList) {
        var newPoint =
            Point(Offset(point.offsetx, point.offsety), point.type, 10);
        listSignature.add(newPoint);
      }
      ref.read(pointProvider.notifier).state = listSignature;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(
            MediaQuery.of(context).size.height * .08,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Inner West Property Inspections Pty Ltd\n- Property Report',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: AppFonts.nunitoSansRegular,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ],
          ),
          const Gap(20),
          Expanded(
              child: Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _controller,
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              height: 110,
                            ),
                            const Gap(20),
                            const Text(
                              'This inspection and report meet Australian Standard AS 4349.1-2007 Pre-Purchase Inspections - Residential Buildings and Austrialian Standard AS 4349.3 Inspections of Buildings - Timber Pest Inspections.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: AppFonts.nunitoSansRegular,
                                  fontSize: 16,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      )),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: AppColors.primaryColor, width: 0.3)),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 10,
                              direction: Axis.horizontal,
                              children: List.generate(
                                  ref.watch(tabProvider).length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    ref.read(selectedProvider.notifier).state =
                                        ref.read(tabProvider)[index];

                                    setState(() {
                                      selectedPage = index;
                                    });

                                    _controller.animToTop(milliseconds: 400);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: selectedPage == index
                                            ? AppColors.primaryColor
                                            : const Color(0xff707070)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 10),
                                      child: Text(
                                        ref.watch(tabProvider)[index].title,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily:
                                                AppFonts.nunitoSansRegular,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          ref.watch(selectedProvider) ==
                                  const TabOptions(id: 0, title: 'Page 1')
                              ? const Page1()
                              : ref.watch(selectedProvider) ==
                                      const TabOptions(id: 1, title: 'Page 2')
                                  ? Page2()
                                  : ref.watch(selectedProvider) ==
                                          const TabOptions(
                                              id: 2, title: 'Page 3')
                                      ? Page3()
                                      : ref.watch(selectedProvider) ==
                                              const TabOptions(
                                                  id: 3, title: 'Page 4')
                                          ? const Page4()
                                          : ref.watch(selectedProvider) ==
                                                  const TabOptions(
                                                      id: 4, title: 'Page 5')
                                              ? Page5(
                                                  kitchenListStore,
                                                  bathRoomListStore,
                                                  livingRoomListStore,
                                                  buildingRoomListStore,
                                                  laundryRoomListStore)
                                              : ref.watch(selectedProvider) ==
                                                      const TabOptions(
                                                          id: 5,
                                                          title: 'Page 6')
                                                  ? Page6(buidExtRoomListStore)
                                                  : ref.watch(selectedProvider) ==
                                                          const TabOptions(
                                                              id: 6,
                                                              title: 'Page 7')
                                                      ? const Page7()
                                                      : ref.watch(selectedProvider) ==
                                                              const TabOptions(
                                                                  id: 7,
                                                                  title:
                                                                      'Page 8')
                                                          ? const Page8()
                                                          : ref.watch(selectedProvider) ==
                                                                  const TabOptions(
                                                                      id: 8,
                                                                      title:
                                                                          'Page 9')
                                                              ? const Page9()
                                                              : ref.watch(selectedProvider) ==
                                                                      const TabOptions(
                                                                          id: 9,
                                                                          title:
                                                                              'Page 10')
                                                                  ? Page10()
                                                                  : ref.watch(selectedProvider) ==
                                                                          const TabOptions(id: 10, title: 'Page 11')
                                                                      ? Page11()
                                                                      : ref.watch(selectedProvider) == const TabOptions(id: 11, title: 'Page 12')
                                                                          ? const Page12()
                                                                          : const Page13(),
                          const Gap(20),
                          isLoading
                              ? const Text(
                                  'Generating pdf...',
                                  style: TextStyle(
                                      fontFamily: AppFonts.nunitoSansRegular,
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                )
                              : Container(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Visibility(
                                visible: selectedPage == 0 ? false : true,
                                child: GestureDetector(
                                  onTap: () {
                                    selectedPage = ref
                                        .read(tabProvider)
                                        .indexWhere((element) =>
                                            element ==
                                            ref
                                                .read(selectedProvider.notifier)
                                                .state);
                                    selectedPage = selectedPage - 1;
                                    ref.read(selectedProvider.notifier).state =
                                        ref.read(tabProvider)[selectedPage];

                                    setState(() {
                                      selectedPage;
                                    });
                                    _controller.animToBottom(milliseconds: 400);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: const Color(0xff707070)),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 18.0, vertical: 12),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          Gap(5),
                                          Text(
                                            'Back',
                                            style: TextStyle(
                                                fontFamily:
                                                    AppFonts.nunitoSansRegular,
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  print('i am here $selectedPage');
                                  TabOptions tabOptions =
                                      ref.read(selectedProvider.notifier).state;
                                  print(
                                      'the value of provider = ${tabOptions.title}');
                                  if (ref
                                          .read(selectedProvider.notifier)
                                          .state ==
                                      const TabOptions(
                                          id: 12, title: 'Page 13')) {
                                    final android =
                                        await DeviceInfoPlugin().androidInfo;

                                    if (await Permission.storage
                                            .request()
                                            .isGranted &&
                                        android.version.sdkInt < 33) {
                                      print('i am here eeerrrrrr');
                                      showLoader(context);
                                      setState(() {
                                        isLoading = false;
                                        isLoading = true;
                                      });
                                      await Future.delayed(
                                          const Duration(seconds: 2));

                                      print('i am here');
                                      String path =
                                          await PdfClass.generateInvoice('');
                                      print('i am here r22222');
                                      showDialog(
                                        context: context,
                                        builder: (context) => MyDialoge(
                                          path: path,
                                        ),
                                      );

                                      print('i am here wwwwww');
                                      setState(() {
                                        isLoading = true;
                                        isLoading = false;
                                      });
                                      hideLoader();
                                      return;
                                    } else if (android.version.sdkInt > 32) {
                                      showLoader(context);
                                      setState(() {
                                        isLoading = false;
                                        isLoading = true;
                                      });
                                      await Future.delayed(
                                          const Duration(seconds: 2));

                                      print('i am here');
                                      String path =
                                          await PdfClass.generateInvoice('');
                                      print('i am here r22222');
                                      showDialog(
                                        context: context,
                                        builder: (context) => MyDialoge(
                                          path: path,
                                        ),
                                      );

                                      print('i am here wwwwww');
                                      setState(() {
                                        isLoading = true;
                                        isLoading = false;
                                      });
                                      hideLoader();
                                      return;
                                    }
                                  }

                                  if (ref
                                          .read(selectedProvider.notifier)
                                          .state !=
                                      const TabOptions(
                                          id: 12, title: 'Page 13')) {
                                    selectedPage = ref
                                        .read(tabProvider)
                                        .indexWhere((element) =>
                                            element ==
                                            ref
                                                .read(selectedProvider.notifier)
                                                .state);
                                    selectedPage = selectedPage + 1;
                                    ref.read(selectedProvider.notifier).state =
                                        ref.read(tabProvider)[selectedPage];

                                    setState(() {
                                      selectedPage;
                                    });

                                    /* setState(() {
                                      selectedPage++;
                                    }); */
                                    _controller.animToTop(milliseconds: 400);
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: AppColors.primaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0, vertical: 12),
                                    child: Row(
                                      children: [
                                        Text(
                                          ref
                                                      .read(selectedProvider
                                                          .notifier)
                                                      .state ==
                                                  const TabOptions(
                                                      id: 12, title: 'Page 13')
                                              ? 'Share'
                                              : 'Next',
                                          style: const TextStyle(
                                              fontFamily:
                                                  AppFonts.nunitoSansRegular,
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Gap(5),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: selectedPage ==
                                        ref
                                                .watch(tabProvider.notifier)
                                                .state
                                                .length -
                                            1
                                    ? true
                                    : false,
                                child: GestureDetector(
                                  onTap: () async {
                                    final android =
                                        await DeviceInfoPlugin().androidInfo;

                                    if (await Permission.storage
                                            .request()
                                            .isGranted &&
                                        android.version.sdkInt < 33) {
                                      showLoader(context);
                                      setState(() {
                                        isLoading = false;
                                        isLoading = true;
                                      });
                                      await Future.delayed(
                                          const Duration(seconds: 2));

                                      String path =
                                          await PdfClass.generateInvoice('');
                                      final file = File(path);
                                      Uint8List data = file.readAsBytesSync();
                                      await FileSaver.instance.saveFile(
                                          name:
                                              'fastinspection_${getStringAsync(k1PropertyBusinessName, defaultValue: '')}',
                                          filePath: path,
                                          mimeType: MimeType.pdf,
                                          ext: '.pdf');
                                      setState(() {
                                        isLoading = true;
                                        isLoading = false;
                                      });
                                      hideLoader();

                                      snackBar(context,
                                          title: "Download complete",
                                          backgroundColor: Colors.green);
                                    } else if (android.version.sdkInt > 32) {
                                      showLoader(context);
                                      setState(() {
                                        isLoading = false;
                                        isLoading = true;
                                      });
                                      await Future.delayed(
                                          const Duration(seconds: 2));

                                      String path =
                                          await PdfClass.generateInvoice('');
                                      final file = File(path);
                                      Uint8List data = file.readAsBytesSync();
                                      await CRFileSaver.saveFile(path,
                                          destinationFileName:
                                              'fastinspection_${getStringAsync(k1PropertyBusinessName, defaultValue: '')}');
                                      setState(() {
                                        isLoading = true;
                                        isLoading = false;
                                      });
                                      hideLoader();
                                      snackBar(context,
                                          title: "Download complete",
                                          backgroundColor: Colors.green);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.primaryColor),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 18.0, vertical: 12),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Download pdf',
                                            style: TextStyle(
                                                fontFamily:
                                                    AppFonts.nunitoSansRegular,
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          //   Gap(5),
                                          /*  Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 16,
                                          ), */
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              20.height,
                              Visibility(
                                visible: selectedPage ==
                                        ref
                                                .watch(tabProvider.notifier)
                                                .state
                                                .length -
                                            1
                                    ? true
                                    : false,
                                child: GestureDetector(
                                  onTap: () async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    prefs.clear();
                                    snackBar(context,
                                        title: "All data cleared",
                                        backgroundColor: Colors.green);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: AppColors.primaryColor),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 18.0, vertical: 12),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Clear all data',
                                            style: TextStyle(
                                                fontFamily:
                                                    AppFonts.nunitoSansRegular,
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          //   Gap(5),
                                          /*  Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 16,
                                          ), */
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Future sendReceive(SendPort send, message) {
    ReceivePort receivePort = ReceivePort();
    send.send([message, receivePort.sendPort]);
    return receivePort.first;
  }
}
