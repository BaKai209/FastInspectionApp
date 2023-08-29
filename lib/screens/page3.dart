import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/colors.dart';
import '../constants/constant_values.dart';
import '../constants/fonts.dart';
import '../constants/tab_options.dart';
import 'home_screen.dart';

class Page3 extends HookConsumerWidget {
  Page3({super.key});
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
      return formatter.format(picked);
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*   Future<String> getImage() async {
      final ImagePicker picker = ImagePicker();
      XFile? image;
      await showInDialog(context,
          contentPadding: const EdgeInsets.all(0),
          builder: (context) => SizedBox(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Container(
                    height: 190,
                    width: 500,
                    color: AppColors.primaryColor.withOpacity(0.3),
                    child: const Icon(
                      Icons.image_outlined,
                      size: 100,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Please pick where you want to pick the image',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          image = await picker.pickImage(
                              source: ImageSource.gallery);
                          context.pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10), // radius of 10
                              color: AppColors
                                  .primaryColor // green as background color
                              ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.camera_alt_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                              5.width,
                              const Text(
                                'Gallery',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          image = await picker.pickImage(
                              source: ImageSource.camera);
                          context.pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10), // radius of 10
                              color: AppColors
                                  .primaryColor // green as background color
                              ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.camera,
                                size: 25,
                                color: Colors.white,
                              ),
                              5.width,
                              const Text(
                                'Camera',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
          dialogAnimation: DialogAnimation.SLIDE_BOTTOM_TOP);
      print(image?.path ?? "");
      return image?.path ?? "";
    }
 */
    // final age = useState(0);
    Future<List<String>> getImage() async {
      final ImagePicker picker = ImagePicker();
      XFile? image;
      List<XFile?> images;
      List<String> listPath = [];
      await showInDialog(context,
          contentPadding: const EdgeInsets.all(0),
          builder: (context) => SizedBox(
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Container(
                    height: 190,
                    width: 500,
                    color: AppColors.primaryColor.withOpacity(0.3),
                    child: const Icon(
                      Icons.image_outlined,
                      size: 100,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Please pick where you want to pick the image',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          images = await picker.pickMultiImage();
                          for (XFile? value in images) {
                            if (value != null) {
                              listPath.add(value.path);
                            }
                          }
                          context.pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10), // radius of 10
                              color: AppColors
                                  .primaryColor // green as background color
                              ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.camera_alt_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                              5.width,
                              const Text(
                                'Gallery',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          image = await picker.pickImage(
                              maxHeight: 200,
                              maxWidth: 200,
                              imageQuality: 100,
                              source: ImageSource.camera);
                          if (image != null) {
                            listPath.add(image!.path);
                          }

                          context.pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10), // radius of 10
                              color: AppColors
                                  .primaryColor // green as background color
                              ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.camera,
                                size: 25,
                                color: Colors.white,
                              ),
                              5.width,
                              const Text(
                                'Camera',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
          dialogAnimation: DialogAnimation.SLIDE_BOTTOM_TOP);
      // print(image?.path ?? "");
      return listPath;
    }

    final inspection = useState(
        getStringAsync(k3TypeInspection, defaultValue: 'Building and pest'));
    final weather =
        useState(getStringAsync(k3Weatherspection, defaultValue: 'Fine'));
    final image1 =
        useState(getStringAsync(k3PropertyConditionImage, defaultValue: ''));

    final exterior =
        useState(getBoolAsync(k3InaccessibleAreaRoofExt, defaultValue: false));
    final roof = useState(
        getBoolAsync(k3InaccessibleAreaPartRoofExt, defaultValue: false));

    final interior = useState(
        getBoolAsync(k3InaccessibleAreaRoofInterior, defaultValue: false));
    final partInterior = useState(
        getBoolAsync(k3InaccessibleAreaPartRoofInt, defaultValue: false));
    final subfloor =
        useState(getBoolAsync(k3InaccessibleAreaSubFloor, defaultValue: false));
    final partsubfloor = useState(
        getBoolAsync(k3InaccessibleAreaPartSubFloor, defaultValue: false));
    final locked = useState(
        getBoolAsync(k3InaccessibleAreaLockedRoom, defaultValue: false));
    final garage = useState(
        getBoolAsync(k3InaccessibleAreaLockedGar, defaultValue: false));
    final granny = useState(
        getBoolAsync(k3InaccessibleAreaGrannyFLat, defaultValue: false));
    final cupboards =
        useState(getBoolAsync(k3buildCupboard, defaultValue: false));
    final covering =
        useState(getBoolAsync(k3buildFloorCovering, defaultValue: false));
    final furniture =
        useState(getBoolAsync(k3buildFurniture, defaultValue: false));
    final items =
        useState(getBoolAsync(k3buildStoredItem, defaultValue: false));
    final vegetation =
        useState(getBoolAsync(k3buildExteriorVegetation, defaultValue: false));
    final ac = useState(getBoolAsync(k3buildACRoof, defaultValue: false));
    final insulation =
        useState(getBoolAsync(k3buildInsulationRoof, defaultValue: false));

    final storedGood =
        useState(getBoolAsync(k3buildstoredGoodRoof, defaultValue: false));
    final character1 =
        useState<SingingCharacter>(SingingCharacter.values.byName(
      getStringAsync(k3StructuralDefects,
          defaultValue: SingingCharacter.yes.name),
    ));
    final character2 =
        useState<SingingCharacter>(SingingCharacter.values.byName(
      getStringAsync(k3StructuralMinorDefects,
          defaultValue: SingingCharacter.yes.name),
    ));

    final character3 =
        useState<SingingCharacter>(SingingCharacter.values.byName(
      getStringAsync(k3StructuralMinorHazards,
          defaultValue: SingingCharacter.yes.name),
    ));

    final condition =
        useState(getStringAsync(k3PropertyCondition, defaultValue: 'Poor'));
    final dateInspectionController = useTextEditingController(
        text: getStringAsync(k3DateInspection, defaultValue: ''));
    final nameInspectionController = useTextEditingController(
        text: getStringAsync(k3InspectorsName, defaultValue: ''));
    final dateReportController = useTextEditingController(
        text: getStringAsync(k3DateReport, defaultValue: ''));
    final description1Controller = useTextEditingController(
        text: getStringAsync(k3NoteInaccessibleArea, defaultValue: ''));
    final description2Controller = useTextEditingController(
        text: getStringAsync(k3NoteInaccessibleArea2, defaultValue: ''));
    final description3Controller = useTextEditingController(
        text: getStringAsync(k3NoteStructuralDefects, defaultValue: ''));
    final description3MinorController = useTextEditingController(
        text: getStringAsync(k3NoteStructuralMinorDefects, defaultValue: ''));
    final description4Controller = useTextEditingController(
        text: getStringAsync(k3NotePropertyConditionImage, defaultValue: ''));

    final description5Controller = useTextEditingController(
        text: getStringAsync(k3NoteStructuralSafetyHarzard, defaultValue: ''));

    final imageChange = useState(true);
    //propery present
    final newImageList =
        useState(getStringAsync(k3PropertyConditionImage, defaultValue: ''));
    List<String> listman = newImageList.value.split('J@^J');
    listman.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList = useState<List<String>>(listman);

    return Column(
      children: [
        const Gap(20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: double.maxFinite,
          color: const Color(0xff39A78E).withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '3: Inspection Details',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              const Text(
                'Date of inspection',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        width: 1),
                    borderRadius: BorderRadius.circular(0)),
                child: TextFormField(
                  controller: dateInspectionController,
                  readOnly: true,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.nunitoSansLight,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  cursorColor: Colors.grey,
                  onChanged: (value) {
                    setValue(k3DateInspection, value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        String? date = await _selectDate(context);
                        if (date != null) {
                          dateInspectionController.text = date;
                          setValue(k3DateInspection, date);
                        }
                      },
                      child: const Padding(
                          padding: EdgeInsets.only(right: 10.0, left: 15),
                          child: Icon(
                            Icons.calendar_month,
                            color: AppColors.primaryColor,
                          )),
                    ),
                    hintStyle: const TextStyle(
                        fontFamily: AppFonts.nunitoSansLight,
                        fontSize: 16,
                        color: Colors.grey),
                    hintText: '',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Gap(20),
              const Text(
                'Date of report',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        width: 1),
                    borderRadius: BorderRadius.circular(0)),
                child: TextFormField(
                  controller: dateReportController,
                  readOnly: true,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.nunitoSansLight,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  cursorColor: Colors.grey,
                  onChanged: (value) {
                    setValue(k3DateReport, value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        String? date = await _selectDate(context);
                        if (date != null) {
                          dateReportController.text = date;
                          setValue(k3DateReport, date);
                        }
                      },
                      child: const Padding(
                          padding: EdgeInsets.only(right: 10.0, left: 15),
                          child: Icon(
                            Icons.calendar_month,
                            color: AppColors.primaryColor,
                          )),
                    ),
                    hintStyle: const TextStyle(
                        fontFamily: AppFonts.nunitoSansLight,
                        fontSize: 16,
                        color: Colors.grey),
                    hintText: '',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Gap(20),
              const Text(
                'Type of inspection',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                decoration: BoxDecoration(
                    color: const Color(0xff96C8A2).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  value: inspection.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Building and pest',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.nunitoSansLight,
                      color: Colors.black,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  underline: const SizedBox(),
                  onChanged: (value) {
                    inspection.value = value!;
                    setValue(k3TypeInspection, value);

                    if (value == 'Building, pest & electrical') {
                      setValue(k3TypeInspectionChoose, '2');
                      ref.read(tabProvider.notifier).state = [
                        const TabOptions(id: 0, title: 'Page 1'),
                        const TabOptions(id: 1, title: 'Page 2'),
                        const TabOptions(id: 2, title: 'Page 3'),
                        const TabOptions(id: 3, title: 'Page 4'),
                        const TabOptions(id: 4, title: 'Page 5'),
                        const TabOptions(id: 5, title: 'Page 6'),
                        const TabOptions(id: 6, title: 'Page 7'),
                        const TabOptions(id: 7, title: 'Page 8'),
                        const TabOptions(id: 8, title: 'Page 9'),
                        const TabOptions(id: 9, title: 'Page 10'),
                        const TabOptions(id: 10, title: 'Page 11'),
                        const TabOptions(id: 12, title: 'Page 13'),
                      ];
                    } else if (value ==
                        'Building, pest, electrical and thermal imaging') {
                      setValue(k3TypeInspectionChoose, '3');
                      ref.read(tabProvider.notifier).state = [
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
                        const TabOptions(id: 11, title: 'Page 12'),
                        const TabOptions(id: 12, title: 'Page 13'),
                      ];
                    } else {
                      setValue(k3TypeInspectionChoose, '1');

                      ref.read(tabProvider.notifier).state = [
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
                    }
                    /*  setState(() {
                      inspection = value;
                    }); */
                  },
                  items: [
                    'Building and pest',
                    'Building, pest & electrical',
                    'Building, pest, electrical and thermal imaging',
                    'Building only',
                    'Electrical only',
                    'Pest only'
                  ].map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoSansLight,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Gap(20),
              const Text(
                'Weather at time of inspection',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                decoration: BoxDecoration(
                    color: const Color(0xff96C8A2).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  value: weather.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Poor',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.nunitoSansLight,
                      color: Colors.black,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  underline: const SizedBox(),
                  onChanged: (value) {
                    weather.value = value!;
                    setValue(k3Weatherspection, value);
                    /*  setState(() {
                      weather = value;
                    }); */
                  },
                  items: ['Fine', 'Overcast', 'Light rain', 'Heavy rain']
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoSansLight,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Gap(20),
              const Text(
                'Inspectors name',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameInspectionController,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k3InspectorsName, value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email field cannot be empty';
                    }
                    return null;
                  },

                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: AppFonts.nunitoSansRegular,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintStyle: const TextStyle(
                        fontFamily: AppFonts.nunitoSansRegular,
                        fontSize: 14,
                        color: Color(0xff4E4E4E)),
                    hintText: 'Name',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Gap(20),
              const Text(
                'Inaccessible areas',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Roof exterior',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: exterior.value,
                        onChanged: (value) {
                          exterior.value = value!;
                          setValue(k3InaccessibleAreaRoofExt, value);
                          /* setState(() {
                            exterior = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Part roof exterior',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: roof.value,
                        onChanged: (value) {
                          roof.value = value!;
                          setValue(k3InaccessibleAreaPartRoofExt, value);
                          /* setState(() {
                            roof = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Roof interior',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: interior.value,
                        onChanged: (value) {
                          interior.value = value!;
                          setValue(k3InaccessibleAreaRoofInterior, value);
                          /*  setState(() {
                            interior = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Part roof interior',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: partInterior.value,
                        onChanged: (value) {
                          partInterior.value = value!;
                          setValue(k3InaccessibleAreaPartRoofInt, value);
                          /* setState(() {
                            partInterior = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Sub floor',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: subfloor.value,
                        onChanged: (value) {
                          subfloor.value = value!;
                          setValue(k3InaccessibleAreaSubFloor, value);
                          /* setState(() {
                            subfloor = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Part sub floor',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: partsubfloor.value,
                        onChanged: (value) {
                          partsubfloor.value = value!;
                          setValue(k3InaccessibleAreaPartSubFloor, value);
                          /*   setState(() {
                            partsubfloor = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Locked room',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: locked.value,
                        onChanged: (value) {
                          locked.value = value!;
                          setValue(k3InaccessibleAreaLockedRoom, value);
                          /*  setState(() {
                            locked = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Locked garage',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: garage.value,
                        onChanged: (value) {
                          garage.value = value!;
                          setValue(k3InaccessibleAreaLockedGar, value);
                          /*  setState(() {
                            garage = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Locked granny flat',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: granny.value,
                        onChanged: (value) {
                          granny.value = value!;
                          setValue(k3InaccessibleAreaGrannyFLat, value);
                          /*  setState(() {
                            granny = value!;
                          }); */
                        }),
                  ],
                ),
              ),
              const Gap(20),
              const Text(
                'Notes on inaccessible areas',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: description1Controller,
                  maxLines: 4,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k3NoteInaccessibleArea, value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email field cannot be empty';
                    }
                    return null;
                  },

                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: AppFonts.nunitoSansRegular,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintStyle: const TextStyle(
                        fontFamily: AppFonts.nunitoSansRegular,
                        fontSize: 14,
                        color: Color(0xff4E4E4E)),
                    hintText: 'Type something',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),

              const Gap(20),
              const Text(
                'Which items obstructed visual inspection of building elements',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Built in cupboards',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: cupboards.value,
                        onChanged: (value) {
                          cupboards.value = value!;
                          setValue(k3buildCupboard, value);
                          /*  setState(() {
                            cupboards = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Floor coverings',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: covering.value,
                        onChanged: (value) {
                          covering.value = value!;
                          setValue(k3buildFloorCovering, value);
                          /* setState(() {
                            covering = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Furniture',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: furniture.value,
                        onChanged: (value) {
                          furniture.value = value!;
                          setValue(k3buildFurniture, value);
                          /*   setState(() {
                            furniture = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Stored items',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: items.value,
                        onChanged: (value) {
                          items.value = value!;
                          setValue(k3buildStoredItem, value);
                          /* setState(() {
                            items = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Exterior vegetation',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: vegetation.value,
                        onChanged: (value) {
                          vegetation.value = value!;
                          setValue(k3buildExteriorVegetation, value);
                          /*  setState(() {
                            vegetation = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'A/C in roof interior',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: ac.value,
                        onChanged: (value) {
                          ac.value = value!;
                          setValue(k3buildACRoof, value);
                          /*   setState(() {
                            ac = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Insulation in roof interior',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: insulation.value,
                        onChanged: (value) {
                          insulation.value = value!;
                          setValue(k3buildInsulationRoof, value);
                          /*  setState(() {
                            insulation = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Stored goods in roof interior',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: storedGood.value,
                        onChanged: (value) {
                          storedGood.value = value!;
                          setValue(k3buildstoredGoodRoof, value);
                          /*  setState(() {
                            insulation = value!;
                          }); */
                        }),
                  ],
                ),
              ),
              const Gap(20),
              const Text(
                'Notes on inaccessible areas',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: description2Controller,
                  maxLines: 4,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k3NoteInaccessibleArea2, value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email field cannot be empty';
                    }
                    return null;
                  },

                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: AppFonts.nunitoSansRegular,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintStyle: const TextStyle(
                        fontFamily: AppFonts.nunitoSansRegular,
                        fontSize: 14,
                        color: Color(0xff4E4E4E)),
                    hintText: 'Type something',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Gap(20),
              const Text(
                'Was there evidence of major or structural defects',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: SingingCharacter.yes,
                      groupValue: character1.value,
                      onChanged: (SingingCharacter? value) {
                        character1.value = value!;
                        setValue(k3StructuralDefects, 'yes');
                        /*  setState(() {
                          _character = value;
                        }); */
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text(
                        'No',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: SingingCharacter.no,
                      groupValue: character1.value,
                      onChanged: (SingingCharacter? value) {
                        character1.value = value!;
                        setValue(k3StructuralDefects, 'no');
                        /*  setState(() {
                          _character = value;
                        }); */
                      },
                    ),
                  ),
                ],
              ),
              const Gap(20),
              const Text(
                'What were the major or structural defects',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: description3Controller,
                  maxLines: 4,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k3NoteStructuralDefects, value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email field cannot be empty';
                    }
                    return null;
                  },

                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: AppFonts.nunitoSansRegular,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintStyle: const TextStyle(
                        fontFamily: AppFonts.nunitoSansRegular,
                        fontSize: 14,
                        color: Color(0xff4E4E4E)),
                    hintText: 'Type something',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              //new
              const Gap(20),
              const Text(
                'Was there evidence of minor defects',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: SingingCharacter.yes,
                      groupValue: character2.value,
                      onChanged: (SingingCharacter? value) {
                        character2.value = value!;
                        setValue(k3StructuralMinorDefects, 'yes');
                        /*  setState(() {
                          _character = value;
                        }); */
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text(
                        'No',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: SingingCharacter.no,
                      groupValue: character2.value,
                      onChanged: (SingingCharacter? value) {
                        character2.value = value!;
                        setValue(k3StructuralMinorDefects, 'no');
                        /*  setState(() {
                          _character = value;
                        }); */
                      },
                    ),
                  ),
                ],
              ),
              const Gap(20),
              const Text(
                'For minor defects see below',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: description3MinorController,
                  maxLines: 4,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k3NoteStructuralMinorDefects, value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email field cannot be empty';
                    }
                    return null;
                  },

                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: AppFonts.nunitoSansRegular,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintStyle: const TextStyle(
                        fontFamily: AppFonts.nunitoSansRegular,
                        fontSize: 14,
                        color: Color(0xff4E4E4E)),
                    hintText: 'Type something',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),

              //new
              //new
              const Gap(20),
              const Text(
                'Were any major saftey hazards detected',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: SingingCharacter.yes,
                      groupValue: character3.value,
                      onChanged: (SingingCharacter? value) {
                        character3.value = value!;
                        setValue(k3StructuralMinorHazards, 'yes');
                        /*  setState(() {
                          _character = value;
                        }); */
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text(
                        'No',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: SingingCharacter.no,
                      groupValue: character3.value,
                      onChanged: (SingingCharacter? value) {
                        character3.value = value!;
                        setValue(k3StructuralMinorHazards, 'no');
                        /*  setState(() {
                          _character = value;
                        }); */
                      },
                    ),
                  ),
                ],
              ),
              const Gap(20),
              const Text(
                'What were the major safety hazards',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: description5Controller,
                  maxLines: 4,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k3NoteStructuralSafetyHarzard, value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email field cannot be empty';
                    }
                    return null;
                  },

                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: AppFonts.nunitoSansRegular,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintStyle: const TextStyle(
                        fontFamily: AppFonts.nunitoSansRegular,
                        fontSize: 14,
                        color: Color(0xff4E4E4E)),
                    hintText: 'Type something',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),

              //new

              const Gap(20),
              const Text(
                'The property presents in condition',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                decoration: BoxDecoration(
                    color: const Color(0xff96C8A2).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  value: condition.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Below average',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFonts.nunitoSansLight,
                      color: Colors.black,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  underline: const SizedBox(),
                  onChanged: (value) {
                    condition.value = value!;
                    setValue(k3PropertyCondition, value);
                    /*  setState(() {
                      condition = value;
                    }); */
                  },
                  items: [
                    'Poor',
                    'Below average',
                    'Average',
                    'Above average',
                    'Excellent'
                  ].map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: AppFonts.nunitoSansLight,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Gap(20),
              const Text(
                'Pictures',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: const Color(0xff96C8A2).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        /*  image1.value = await getImage() ?? '';
                        setValue(k3PropertyConditionImage, image1.value); */

                        List<String> path = await getImage();

                        path.addAll(imageList.value);
                        String addedString = '';
                        for (String vlist in path) {
                          addedString = "${addedString}J@^J$vlist";
                        }

                        imageChange.value = false;
                        imageList.value.clear();
                        imageList.value.addAll(path);

                        setValue(k3PropertyConditionImage, addedString);
                        imageChange.value = true;
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15),
                          child: Text(
                            'Upload',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: AppFonts.nunitoSansRegular),
                          ),
                        ),
                      ),
                    ),
                    if (imageList.value.isNotEmpty && imageChange.value)
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ...imageList.value.map((e) {
                              print(e);
                              print(e);
                              return e == 'J@^J'.trim() || e.trim().isEmpty
                                  ? Container()
                                  : Column(
                                      children: [
                                        ListTile(
                                          leading: SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Image.file(
                                              File(e),
                                              height: 100,
                                              width: 100,
                                            ),
                                          ),
                                          trailing: GestureDetector(
                                            onTap: () {
                                              imageList.value.remove(e);
                                              String addedString = '';
                                              for (String vlist
                                                  in imageList.value) {
                                                addedString =
                                                    "${addedString}J@^J$vlist";
                                              }

                                              imageList.value = imageList.value;

                                              setValue(k3PropertyConditionImage,
                                                  addedString);
                                              imageChange.value = false;
                                              imageChange.value = true;
                                            },
                                            child: const Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        const Divider()
                                      ],
                                    );
                            })
                          ],
                        ),
                      )

                    /*  if (!image1.value.trim().isEmptyOrNull)
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.file(
                          File(image1.value),
                          height: 100,
                          width: 100,
                        ),
                      ) */
                  ],
                ),
              ),
              const Gap(20),
              const Text(
                'Notes',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: description4Controller,
                  maxLines: 4,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k3NotePropertyConditionImage, value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email field cannot be empty';
                    }
                    return null;
                  },

                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: AppFonts.nunitoSansRegular,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintStyle: const TextStyle(
                        fontFamily: AppFonts.nunitoSansRegular,
                        fontSize: 14,
                        color: Color(0xff4E4E4E)),
                    hintText: 'Type something',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
