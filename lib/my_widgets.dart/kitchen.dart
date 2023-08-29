import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';

class KitchenWidget extends HookWidget {
  KitchenWidget(
      {super.key,
      required this.index,
      required this.onTapAction,
      required this.listValue});
  final int index;
  final int listValue;
  final Function onTapAction;
  List<String> kitchenList = [
    'Satisfactory',
    'Minor defect',
    'Major defect',
    'N/A',
    'No access',
  ];

  @override
  Widget build(BuildContext context) {
    /* Future<String> getImage() async {
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

    final kitchFloor = useState(getStringAsync('k5Kitchen1Floor$listValue',
        defaultValue: 'Satisfactory'));
    final kitchWall = useState(getStringAsync('k5Kitchen1Wall$listValue',
        defaultValue: 'Satisfactory'));
    final kitchDoors = useState(getStringAsync(
        'k5Kitchen1DoorsWindows$listValue',
        defaultValue: 'Satisfactory'));
    final kitchCeiling = useState(getStringAsync('k5Kitchen1Ceiling$listValue',
        defaultValue: 'Satisfactory'));
    final kitchBenchTop = useState(getStringAsync(
        'k5Kitchen1BenchTop$listValue',
        defaultValue: 'Satisfactory'));
    final kitchTaps = useState(getStringAsync('k5Kitchen1Taps$listValue',
        defaultValue: 'Satisfactory'));
    final kitchCup = useState(getStringAsync('k5Kitchen1Cupboard$listValue',
        defaultValue: 'Satisfactory'));
    final kitchHood = useState(getStringAsync('k5Kitchen1RangeHood$listValue',
        defaultValue: 'Satisfactory'));

    /*  final image1 = useState(
        getStringAsync('k5Kitchen1Picture$listValue', defaultValue: '')); */
    final image2 = useState(
        getStringAsync('k5Bathroom1Picture$listValue', defaultValue: ''));
    final noteKitchen = useTextEditingController(
        text: getStringAsync('k5NoteKitchen1$listValue', defaultValue: ''));

    final imageChange = useState(true);
    //propery present
    final newImageList = useState(
        getStringAsync('k5Kitchen1Picture$listValue', defaultValue: ''));
    List<String> listman = newImageList.value.split('J@^J');
    listman.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList = useState<List<String>>(listman);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: double.maxFinite,
      color: const Color(0xff39A78E).withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (index != 1)
            GestureDetector(
              onTap: () => showConfirmDialog(context, 'Delete kitchen $index',
                  positiveText: 'Delete', negativeText: 'Cancel', onAccept: () {
                onTapAction();
              }),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                ),
              ),
            ),
          Text(
            'Kitchen $index',
            style: const TextStyle(
                fontSize: 16,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(20),
          const Text(
            'Floor',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                color: const Color(0xff96C8A2).withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              value: kitchFloor.value,
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
                kitchFloor.value = value!;
                setValue('k5Kitchen1Floor$listValue', value);
                /* setState(() {
                      kitchFloor = value;
                    }); */
              },
              items: kitchenList.map<DropdownMenuItem<String>>((value) {
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
            'Walls',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                color: const Color(0xff96C8A2).withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              value: kitchWall.value,
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
                kitchWall.value = value!;
                setValue('k5Kitchen1Wall$listValue', value);
                /* setState(() {
                      kitchWall = value;
                    }); */
              },
              items: kitchenList.map<DropdownMenuItem<String>>((value) {
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
            'Doors and windows',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                color: const Color(0xff96C8A2).withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              value: kitchDoors.value,
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
                kitchDoors.value = value!;
                setValue('k5Kitchen1DoorsWindows$listValue', value);
                /* setState(() {
                      kitchDoors = value;
                    }); */
              },
              items: kitchenList.map<DropdownMenuItem<String>>((value) {
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
            'Ceiling',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                color: const Color(0xff96C8A2).withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              value: kitchCeiling.value,
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
                kitchCeiling.value = value!;
                setValue('k5Kitchen1Ceiling$listValue', value);
                /* setState(() {
                      kitchCeiling = value;
                    }); */
              },
              items: kitchenList.map<DropdownMenuItem<String>>((value) {
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
            'Benchtop',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                color: const Color(0xff96C8A2).withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              value: kitchBenchTop.value,
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
                kitchBenchTop.value = value!;
                setValue('k5Kitchen1BenchTop$listValue', value);
                /* setState(() {
                      kitchBenchTop = value;
                    }); */
              },
              items: kitchenList.map<DropdownMenuItem<String>>((value) {
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
            'Taps',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                color: const Color(0xff96C8A2).withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              value: kitchTaps.value,
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
                kitchTaps.value = value!;

                setValue('k5Kitchen1Taps$listValue', value);
                /*  setState(() {
                      kitchTaps = value;
                    }); */
              },
              items: kitchenList.map<DropdownMenuItem<String>>((value) {
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
            'Cupboards',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                color: const Color(0xff96C8A2).withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              value: kitchCup.value,
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
                kitchCup.value = value!;
                setValue('k5Kitchen1Cupboard$listValue', value);
                /* setState(() {
                      kitchCup = value;
                    }); */
              },
              items: kitchenList.map<DropdownMenuItem<String>>((value) {
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
            'Range hood',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                color: const Color(0xff96C8A2).withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: DropdownButton<String>(
              value: kitchHood.value,
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
                kitchHood.value = value!;
                setValue('k5Kitchen1RangeHood$listValue', value);
                /* setState(() {
                      kitchHood = value;
                    }); */
              },
              items: kitchenList.map<DropdownMenuItem<String>>((value) {
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    /*  image1.value = await getImage() ?? '';
                    setValue('k5Kitchen1Picture$listValue', image1.value); */

                    List<String> path = await getImage();

                    path.addAll(imageList.value);
                    String addedString = '';
                    for (String vlist in path) {
                      addedString = "${addedString}J@^J$vlist";
                    }

                    imageChange.value = false;
                    imageList.value.clear();
                    imageList.value.addAll(path);

                    setValue('k5Kitchen1Picture$listValue', addedString);
                    imageChange.value = true;
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
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

                                          setValue(
                                              'k5Kitchen1Picture$listValue',
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
              controller: noteKitchen,
              maxLines: 4,
              keyboardType: TextInputType.name,
              //controller: _firstName,
              //textInputAction: TextInputType.emailAddress,
              cursorWidth: 0.5,
              cursorColor: AppColors.primaryColor.withOpacity(0.1),
              onChanged: (value) {
                setValue('k5NoteKitchen1$listValue', value);
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
