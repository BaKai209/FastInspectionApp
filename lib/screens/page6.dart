import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/colors.dart';
import '../constants/constant_values.dart';
import '../constants/fonts.dart';
import '../my_widgets.dart/build_ext.dart';
import '../my_widgets.dart/roof_exterior.dart';
import '../my_widgets.dart/roof_interior.dart';
import '../my_widgets.dart/sub_floor.dart';

class Page6 extends HookWidget {
  Page6(this.buidExtRoomListStore, {super.key});
  final List<String> buidExtRoomListStore;
  List<String> exteriorList = [
    'Satisfactory',
    'Minor defect',
    'Major defect',
    'N/A',
    'No access',
  ];
  @override
  Widget build(BuildContext context) {
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
                              imageQuality: 100,
                              maxWidth: 200,
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

    final buildExtRoomNumber = useState(buidExtRoomListStore.length);

    /*  final image1 =
        useState(getStringAsync(k6YardFanceRangePicture, defaultValue: '')); */

    final imageChange = useState(true);
    //propery facade
    final newImageList =
        useState(getStringAsync(k6YardFanceRangePicture, defaultValue: ''));
    List<String> listman = newImageList.value.split('J@^J');
    listman.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList = useState<List<String>>(listman);
    // property

    final drainage = useState(
        getStringAsync(k6YardFanceDrainage, defaultValue: 'Satisfactory'));
    final fences = useState(
        getStringAsync(k6YardFanceFences, defaultValue: 'Satisfactory'));
    final retainWalls = useState(
        getStringAsync(k6YardFanceRetainingWall, defaultValue: 'Satisfactory'));
    final carport = useState(
        getStringAsync(k6YardFanceGarage, defaultValue: 'Satisfactory'));
    final pavement = useState(
        getStringAsync(k6YardFancePavement, defaultValue: 'Satisfactory'));
    final taps =
        useState(getStringAsync(k6YardFanceTaps, defaultValue: 'Satisfactory'));
    final pavers = useState(
        getStringAsync(k6YardFancePavers, defaultValue: 'Satisfactory'));
    final rangehood = useState(
        getStringAsync(k6YardFanceRangeHood, defaultValue: 'Satisfactory'));
    final noteController = useTextEditingController(
        text: getStringAsync(k6YardFanceRangeNote, defaultValue: ''));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        const Text(
          '6. Inspection Results - Exterior',
          style: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.nunitoSansRegular,
              fontWeight: FontWeight.w700),
        ),
        const Gap(20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: double.maxFinite,
          color: const Color(0xff39A78E).withOpacity(0.2),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Text(
                'Yard and fences',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(20),
              const Text(
                'Drainage',
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
                  value: drainage.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Satisfactory',
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
                    drainage.value = value!;
                    setValue(k6YardFanceDrainage, value);
                    /*  setState(() {
                      drainage = value;
                    }); */
                  },
                  items: exteriorList.map<DropdownMenuItem<String>>((value) {
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
                'Fences',
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
                  value: fences.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Satisfactory',
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
                    fences.value = value!;
                    setValue(k6YardFanceFences, value);
                    /* setState(() {
                      fences = value;
                    }); */
                  },
                  items: exteriorList.map<DropdownMenuItem<String>>((value) {
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
                'Retaining walls',
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
                  value: retainWalls.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Satisfactory',
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
                    retainWalls.value = value!;
                    setValue(k6YardFanceRetainingWall, value);
                    /*  setState(() {
                      retainWalls = value;
                    }); */
                  },
                  items: exteriorList.map<DropdownMenuItem<String>>((value) {
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
                'Garage/carport',
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
                  value: carport.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Satisfactory',
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
                    carport.value = value!;
                    setValue(k6YardFanceGarage, value);
                    /*  setState(() {
                      carport = value;
                    }); */
                  },
                  items: exteriorList.map<DropdownMenuItem<String>>((value) {
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
                'Pavement',
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
                  value: pavement.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Satisfactory',
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
                    pavement.value = value!;
                    setValue(k6YardFancePavement, value);
                    /* setState(() {
                      pavement = value;
                    }); */
                  },
                  items: exteriorList.map<DropdownMenuItem<String>>((value) {
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
              /*   const Gap(20),
              const Text(
                'Taps',
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
                  value: taps.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Satisfactory',
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
                    taps.value = value!;
                    setValue(k6YardFanceTaps, value);
                    /*  setState(() {
                      taps = value;
                    }); */
                  },
                  items: exteriorList.map<DropdownMenuItem<String>>((value) {
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
              const Gap(20), */
              const Gap(10),
              const Text(
                'Pavers',
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
                  value: pavers.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Satisfactory',
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
                    pavers.value = value!;
                    setValue(k6YardFancePavers, value);
                    /* setState(() {
                      pavers = value;
                    }); */
                  },
                  items: exteriorList.map<DropdownMenuItem<String>>((value) {
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

              /* const Text(
                'Range hood',
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
                  value: rangehood.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Satisfactory',
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
                    rangehood.value = value!;
                    setValue(k6YardFanceRangeHood, value);
                    /*   setState(() {
                      rangehood = value;
                    }); */
                  },
                  items: exteriorList.map<DropdownMenuItem<String>>((value) {
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
             
              */
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
                        setValue(k6YardFanceRangePicture, image1.value); */

                        List<String> path = await getImage();

                        path.addAll(imageList.value);
                        String addedString = '';
                        for (String vlist in path) {
                          addedString = "${addedString}J@^J$vlist";
                        }

                        imageChange.value = false;
                        imageList.value.clear();
                        imageList.value.addAll(path);

                        setValue(k6YardFanceRangePicture, addedString);
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

                                              setValue(k6YardFanceRangePicture,
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
                  controller: noteController,
                  maxLines: 4,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k6YardFanceRangeNote, value);
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
              //add Building exterior
              const Gap(20),
              const Text(
                'Building exterior',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: buildExtRoomNumber.value,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: BuildExtRoomWidget(
                        index: index + 1,
                        onTapAction: () async {
                          print('i am deleting you');
                          buidExtRoomListStore.removeAt(index);
                          buildExtRoomNumber.value =
                              buidExtRoomListStore.length;
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setStringList(
                              k5LuandryNumberList, buidExtRoomListStore);
                        },
                        listValue: buidExtRoomListStore[index].toInt(),
                      ),
                    );
                  }),
              const Gap(20),
              GestureDetector(
                onTap: () async {
                  int value = buidExtRoomListStore.last.toInt();
                  buidExtRoomListStore.add((value + 1).toString());
                  buildExtRoomNumber.value = buidExtRoomListStore.length;
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setStringList(
                      k5LuandryNumberList, buidExtRoomListStore);
                  // kitchenList2.value.add('1');
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.primaryColor.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      '+ Building exterior',
                      style: TextStyle(
                        fontFamily: AppFonts.nunitoSansRegular,
                      ),
                    ),
                  ),
                ),
              ),
//Building exterior
              const Gap(20),
//sub level
              SubFloorWidget(),
              const Gap(10),
              RoofExteriorWidget(),
              const Gap(10),
              RoofInteriorWidget()
//sub level
            ],
          ),
        ),
      ],
    );
  }
}
