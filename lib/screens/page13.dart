import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/colors.dart';
import '../constants/constant_values.dart';
import '../constants/fonts.dart';
import '../constants/long_texts.dart';

class Page13 extends HookWidget {
  const Page13({super.key});

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

    final note1Controller = useTextEditingController(
        text: getStringAsync(k11ThermalNote1, defaultValue: ''));
    final note2Controller = useTextEditingController(
        text: getStringAsync(k11ThermalNote2, defaultValue: ''));
    final note3Controller = useTextEditingController(
        text: getStringAsync(k11ThermalNote3, defaultValue: ''));
    final note4Controller = useTextEditingController(
        text: getStringAsync(k11ThermalNote4, defaultValue: ''));
    final note5Controller = useTextEditingController(
        text: getStringAsync(k11ThermalNote5, defaultValue: ''));

    final note6Controller = useTextEditingController(
        text: getStringAsync(k11ThermalNote6, defaultValue: ''));
    final note7Controller = useTextEditingController(
        text: getStringAsync(k11ThermalNote7, defaultValue: ''));
    final note8Controller = useTextEditingController(
        text: getStringAsync(k11ThermalNote8, defaultValue: ''));
    final note9Controller = useTextEditingController(
        text: getStringAsync(k11ThermalNote9, defaultValue: ''));
    final note10Controller = useTextEditingController(
        text: getStringAsync(k11ThermalNote10, defaultValue: ''));

    // final image1 = useState(getStringAsync(k11ThermalPic1, defaultValue: ''));
    final image2 = useState(getStringAsync(k11ThermalPic2, defaultValue: ''));
    final image3 = useState(getStringAsync(k11ThermalPic3, defaultValue: ''));
    final image4 = useState(getStringAsync(k11ThermalPic4, defaultValue: ''));
    final image5 = useState(getStringAsync(k11ThermalPic5, defaultValue: ''));

    final image6 = useState(getStringAsync(k11ThermalPic6, defaultValue: ''));
    final image7 = useState(getStringAsync(k11ThermalPic7, defaultValue: ''));
    final image8 = useState(getStringAsync(k11ThermalPic8, defaultValue: ''));
    final image9 = useState(getStringAsync(k11ThermalPic9, defaultValue: ''));
    final image10 = useState(getStringAsync(k11ThermalPic10, defaultValue: ''));

    final imageChange1 = useState(true);
    //propery facade
    final newImageList1 =
        useState(getStringAsync(k11ThermalPic1, defaultValue: ''));
    List<String> listman1 = newImageList1.value.split('J@^J');
    listman1.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList1 = useState<List<String>>(listman1);
    // property
//2
    final imageChange2 = useState(true);
    //propery facade
    final newImageList2 =
        useState(getStringAsync(k11ThermalPic2, defaultValue: ''));
    List<String> listman2 = newImageList2.value.split('J@^J');
    listman2.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList2 = useState<List<String>>(listman2);
    // property
//3
    final imageChange3 = useState(true);
    //propery facade
    final newImageList3 =
        useState(getStringAsync(k11ThermalPic3, defaultValue: ''));
    List<String> listman3 = newImageList3.value.split('J@^J');
    listman3.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList3 = useState<List<String>>(listman3);
    // property
//4
    final imageChange4 = useState(true);
    //propery facade
    final newImageList4 =
        useState(getStringAsync(k11ThermalPic4, defaultValue: ''));
    List<String> listman4 = newImageList4.value.split('J@^J');
    listman4.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList4 = useState<List<String>>(listman4);
    // property
//5
    final imageChange5 = useState(true);
    //propery facade
    final newImageList5 =
        useState(getStringAsync(k11ThermalPic5, defaultValue: ''));
    List<String> listman5 = newImageList5.value.split('J@^J');
    listman5.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList5 = useState<List<String>>(listman5);
    // property

//6
    final imageChange6 = useState(true);
    //propery facade
    final newImageList6 =
        useState(getStringAsync(k11ThermalPic6, defaultValue: ''));
    List<String> listman6 = newImageList6.value.split('J@^J');
    listman6.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList6 = useState<List<String>>(listman6);
    // property

    //7
    final imageChange7 = useState(true);
    //propery facade
    final newImageList7 =
        useState(getStringAsync(k11ThermalPic7, defaultValue: ''));
    List<String> listman7 = newImageList7.value.split('J@^J');
    listman7.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList7 = useState<List<String>>(listman7);
    // property
    //8
    final imageChange8 = useState(true);
    //propery facade
    final newImageList8 =
        useState(getStringAsync(k11ThermalPic8, defaultValue: ''));
    List<String> listman8 = newImageList8.value.split('J@^J');
    listman8.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList8 = useState<List<String>>(listman8);
    // property

//9
    final imageChange9 = useState(true);
    //propery facade
    final newImageList9 =
        useState(getStringAsync(k11ThermalPic9, defaultValue: ''));
    List<String> listman9 = newImageList9.value.split('J@^J');
    listman8.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList9 = useState<List<String>>(listman9);
    // property
//10
    final imageChange10 = useState(true);
    //propery facade
    final newImageList10 =
        useState(getStringAsync(k11ThermalPic10, defaultValue: ''));
    List<String> listman10 = newImageList10.value.split('J@^J');
    listman10.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList10 = useState<List<String>>(listman10);
    // property

    return Visibility(
      visible: getStringAsync(k3TypeInspectionChoose, defaultValue: '1') == '3',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          const Text(
            'Thermal Imaging Pictures',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Untitled',
                  style: TextStyle(
                      fontSize: 12,
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
                          /* image1.value = await getImage() ?? '';
                          setValue(k11ThermalPic1, image1.value); */
                          List<String> path = await getImage();

                          path.addAll(imageList1.value);
                          String addedString = '';
                          for (String vlist in path) {
                            addedString = "${addedString}J@^J$vlist";
                          }

                          imageChange1.value = false;
                          imageList1.value.clear();
                          imageList1.value.addAll(path);

                          setValue(k11ThermalPic1, addedString);
                          imageChange1.value = true;
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
                      /*   if (!image1.value.trim().isEmptyOrNull)
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(
                            File(image1.value),
                            height: 100,
                            width: 100,
                          ),
                        ) */
                      if (imageList1.value.isNotEmpty && imageChange1.value)
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...imageList1.value.map((e) {
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
                                                imageList1.value.remove(e);
                                                String addedString = '';
                                                for (String vlist
                                                    in imageList1.value) {
                                                  addedString =
                                                      "${addedString}J@^J$vlist";
                                                }

                                                imageList1.value =
                                                    imageList1.value;

                                                setValue(k11ThermalPic1,
                                                    addedString);
                                                imageChange1.value = false;
                                                imageChange1.value = true;
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: note1Controller,
                    maxLines: 4,
                    keyboardType: TextInputType.name,
                    //controller: _firstName,
                    //textInputAction: TextInputType.emailAddress,
                    cursorWidth: 0.5,
                    cursorColor: AppColors.primaryColor.withOpacity(0.1),
                    onChanged: (value) {
                      setValue(k11ThermalNote1, value);
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
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintStyle: const TextStyle(
                          fontFamily: AppFonts.nunitoSansRegular,
                          fontSize: 14,
                          color: Color(0xff4E4E4E)),
                      hintText: 'Type Something',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),
                const Gap(20),
                const Text(
                  'Untitled',
                  style: TextStyle(
                      fontSize: 12,
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
                  child: Column(children: [
                    GestureDetector(
                      onTap: () async {
                        /*   image2.value = await getImage() ?? '';
                        setValue(k11ThermalPic2, image2.value); */

                        List<String> path = await getImage();

                        path.addAll(imageList2.value);
                        String addedString = '';
                        for (String vlist in path) {
                          addedString = "${addedString}J@^J$vlist";
                        }

                        imageChange2.value = false;
                        imageList2.value.clear();
                        imageList2.value.addAll(path);

                        setValue(k11ThermalPic2, addedString);
                        imageChange2.value = true;
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
                    /*  if (!image2.value.trim().isEmptyOrNull)
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.file(
                          File(image2.value),
                          height: 100,
                          width: 100,
                        ),
                      ) */
                    if (imageList2.value.isNotEmpty && imageChange2.value)
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ...imageList2.value.map((e) {
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
                                              imageList2.value.remove(e);
                                              String addedString = '';
                                              for (String vlist
                                                  in imageList2.value) {
                                                addedString =
                                                    "${addedString}J@^J$vlist";
                                              }

                                              imageList2.value =
                                                  imageList2.value;

                                              setValue(
                                                  k11ThermalPic2, addedString);
                                              imageChange2.value = false;
                                              imageChange2.value = true;
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
                  ]),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: note2Controller,
                    maxLines: 4,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setValue(k11ThermalNote2, value);
                    },
                    //controller: _firstName,
                    //textInputAction: TextInputType.emailAddress,
                    cursorWidth: 0.5,
                    cursorColor: AppColors.primaryColor.withOpacity(0.1),
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
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintStyle: const TextStyle(
                          fontFamily: AppFonts.nunitoSansRegular,
                          fontSize: 14,
                          color: Color(0xff4E4E4E)),
                      hintText: 'Type Something',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),
                const Gap(20),
                const Text(
                  'Untitled',
                  style: TextStyle(
                      fontSize: 12,
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
                          /* image3.value = await getImage() ?? '';
                          setValue(k11ThermalPic3, image3.value); */
                          List<String> path = await getImage();

                          path.addAll(imageList3.value);
                          String addedString = '';
                          for (String vlist in path) {
                            addedString = "${addedString}J@^J$vlist";
                          }

                          imageChange3.value = false;
                          imageList3.value.clear();
                          imageList3.value.addAll(path);

                          setValue(k11ThermalPic3, addedString);
                          imageChange3.value = true;
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
                      /*  if (!image3.value.trim().isEmptyOrNull)
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(
                            File(image3.value),
                            height: 100,
                            width: 100,
                          ),
                        ) */
                      if (imageList3.value.isNotEmpty && imageChange3.value)
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...imageList3.value.map((e) {
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
                                                imageList3.value.remove(e);
                                                String addedString = '';
                                                for (String vlist
                                                    in imageList3.value) {
                                                  addedString =
                                                      "${addedString}J@^J$vlist";
                                                }

                                                imageList3.value =
                                                    imageList3.value;

                                                setValue(k11ThermalPic3,
                                                    addedString);
                                                imageChange3.value = false;
                                                imageChange3.value = true;
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: note3Controller,
                    maxLines: 4,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setValue(k11ThermalNote3, value);
                    },
                    //controller: _firstName,
                    //textInputAction: TextInputType.emailAddress,
                    cursorWidth: 0.5,
                    cursorColor: AppColors.primaryColor.withOpacity(0.1),
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
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintStyle: const TextStyle(
                          fontFamily: AppFonts.nunitoSansRegular,
                          fontSize: 14,
                          color: Color(0xff4E4E4E)),
                      hintText: 'Type Something',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),
                const Gap(20),
                const Text(
                  'Untitled',
                  style: TextStyle(
                      fontSize: 12,
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
                          /*  image4.value = await getImage() ?? '';
                          setValue(k11ThermalPic4, image4.value); */
                          List<String> path = await getImage();

                          path.addAll(imageList4.value);
                          String addedString = '';
                          for (String vlist in path) {
                            addedString = "${addedString}J@^J$vlist";
                          }

                          imageChange4.value = false;
                          imageList4.value.clear();
                          imageList4.value.addAll(path);

                          setValue(k11ThermalPic4, addedString);
                          imageChange4.value = true;
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
                      /*  if (!image4.value.trim().isEmptyOrNull)
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(
                            File(image4.value),
                            height: 100,
                            width: 100,
                          ),
                        ) */
                      if (imageList4.value.isNotEmpty && imageChange4.value)
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...imageList4.value.map((e) {
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
                                                imageList4.value.remove(e);
                                                String addedString = '';
                                                for (String vlist
                                                    in imageList4.value) {
                                                  addedString =
                                                      "${addedString}J@^J$vlist";
                                                }

                                                imageList4.value =
                                                    imageList4.value;

                                                setValue(k11ThermalPic4,
                                                    addedString);
                                                imageChange4.value = false;
                                                imageChange4.value = true;
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: note4Controller,
                    maxLines: 4,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setValue(k11ThermalNote4, value);
                    },
                    //controller: _firstName,
                    //textInputAction: TextInputType.emailAddress,
                    cursorWidth: 0.5,
                    cursorColor: AppColors.primaryColor.withOpacity(0.1),
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
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintStyle: const TextStyle(
                          fontFamily: AppFonts.nunitoSansRegular,
                          fontSize: 14,
                          color: Color(0xff4E4E4E)),
                      hintText: 'Type Something',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),
                const Gap(20),
                const Text(
                  'Untitled',
                  style: TextStyle(
                      fontSize: 12,
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
                          /*  image5.value = await getImage() ?? '';
                          setValue(k11ThermalPic5, image5.value); */
                          List<String> path = await getImage();

                          path.addAll(imageList5.value);
                          String addedString = '';
                          for (String vlist in path) {
                            addedString = "${addedString}J@^J$vlist";
                          }

                          imageChange5.value = false;
                          imageList5.value.clear();
                          imageList5.value.addAll(path);

                          setValue(k11ThermalPic5, addedString);
                          imageChange5.value = true;
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
                      /* if (!image5.value.trim().isEmptyOrNull)
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(
                            File(image5.value),
                            height: 100,
                            width: 100,
                          ),
                        ) */
                      if (imageList5.value.isNotEmpty && imageChange5.value)
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...imageList5.value.map((e) {
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
                                                imageList5.value.remove(e);
                                                String addedString = '';
                                                for (String vlist
                                                    in imageList5.value) {
                                                  addedString =
                                                      "${addedString}J@^J$vlist";
                                                }

                                                imageList5.value =
                                                    imageList5.value;

                                                setValue(k11ThermalPic5,
                                                    addedString);
                                                imageChange5.value = false;
                                                imageChange5.value = true;
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: note5Controller,
                    maxLines: 4,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setValue(k11ThermalNote5, value);
                    },
                    //controller: _firstName,
                    //textInputAction: TextInputType.emailAddress,
                    cursorWidth: 0.5,
                    cursorColor: AppColors.primaryColor.withOpacity(0.1),
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
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintStyle: const TextStyle(
                          fontFamily: AppFonts.nunitoSansRegular,
                          fontSize: 14,
                          color: Color(0xff4E4E4E)),
                      hintText: 'Type Something',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),
                //6
                const Gap(20),
                const Text(
                  'Untitled',
                  style: TextStyle(
                      fontSize: 12,
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
                          /*  image6.value = await getImage() ?? '';
                          setValue(k11ThermalPic6, image6.value); */
                          List<String> path = await getImage();

                          path.addAll(imageList6.value);
                          String addedString = '';
                          for (String vlist in path) {
                            addedString = "${addedString}J@^J$vlist";
                          }

                          imageChange6.value = false;
                          imageList6.value.clear();
                          imageList6.value.addAll(path);

                          setValue(k11ThermalPic6, addedString);
                          imageChange6.value = true;
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
                      /*  if (!image6.value.trim().isEmptyOrNull)
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(
                            File(image6.value),
                            height: 100,
                            width: 100,
                          ),
                        ) */
                      if (imageList6.value.isNotEmpty && imageChange6.value)
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...imageList6.value.map((e) {
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
                                                imageList6.value.remove(e);
                                                String addedString = '';
                                                for (String vlist
                                                    in imageList6.value) {
                                                  addedString =
                                                      "${addedString}J@^J$vlist";
                                                }

                                                imageList6.value =
                                                    imageList6.value;

                                                setValue(k11ThermalPic6,
                                                    addedString);
                                                imageChange6.value = false;
                                                imageChange6.value = true;
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: note6Controller,
                    maxLines: 4,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setValue(k11ThermalNote6, value);
                    },
                    //controller: _firstName,
                    //textInputAction: TextInputType.emailAddress,
                    cursorWidth: 0.5,
                    cursorColor: AppColors.primaryColor.withOpacity(0.1),
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
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintStyle: const TextStyle(
                          fontFamily: AppFonts.nunitoSansRegular,
                          fontSize: 14,
                          color: Color(0xff4E4E4E)),
                      hintText: 'Type Something',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),
                //7
                const Gap(20),
                const Text(
                  'Untitled',
                  style: TextStyle(
                      fontSize: 12,
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
                          /* image7.value = await getImage() ?? '';
                          setValue(k11ThermalPic7, image7.value); */

                          List<String> path = await getImage();

                          path.addAll(imageList7.value);
                          String addedString = '';
                          for (String vlist in path) {
                            addedString = "${addedString}J@^J$vlist";
                          }

                          imageChange7.value = false;
                          imageList7.value.clear();
                          imageList7.value.addAll(path);

                          setValue(k11ThermalPic7, addedString);
                          imageChange7.value = true;
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
                      /*  if (!image7.value.trim().isEmptyOrNull)
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(
                            File(image7.value),
                            height: 100,
                            width: 100,
                          ),
                        ) */
                      if (imageList7.value.isNotEmpty && imageChange7.value)
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...imageList7.value.map((e) {
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
                                                imageList7.value.remove(e);
                                                String addedString = '';
                                                for (String vlist
                                                    in imageList7.value) {
                                                  addedString =
                                                      "${addedString}J@^J$vlist";
                                                }

                                                imageList7.value =
                                                    imageList7.value;

                                                setValue(k11ThermalPic7,
                                                    addedString);
                                                imageChange7.value = false;
                                                imageChange7.value = true;
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: note7Controller,
                    maxLines: 4,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setValue(k11ThermalNote7, value);
                    },
                    //controller: _firstName,
                    //textInputAction: TextInputType.emailAddress,
                    cursorWidth: 0.5,
                    cursorColor: AppColors.primaryColor.withOpacity(0.1),
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
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintStyle: const TextStyle(
                          fontFamily: AppFonts.nunitoSansRegular,
                          fontSize: 14,
                          color: Color(0xff4E4E4E)),
                      hintText: 'Type Something',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),
                //8
                const Gap(20),
                const Text(
                  'Untitled',
                  style: TextStyle(
                      fontSize: 12,
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
                          /*  image8.value = await getImage() ?? '';
                          setValue(k11ThermalPic8, image8.value); */
                          List<String> path = await getImage();

                          path.addAll(imageList8.value);
                          String addedString = '';
                          for (String vlist in path) {
                            addedString = "${addedString}J@^J$vlist";
                          }

                          imageChange8.value = false;
                          imageList8.value.clear();
                          imageList8.value.addAll(path);

                          setValue(k11ThermalPic8, addedString);
                          imageChange8.value = true;
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
                      /*   if (!image8.value.trim().isEmptyOrNull)
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(
                            File(image8.value),
                            height: 100,
                            width: 100,
                          ),
                        ) */
                      if (imageList8.value.isNotEmpty && imageChange8.value)
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...imageList8.value.map((e) {
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
                                                imageList8.value.remove(e);
                                                String addedString = '';
                                                for (String vlist
                                                    in imageList8.value) {
                                                  addedString =
                                                      "${addedString}J@^J$vlist";
                                                }

                                                imageList8.value =
                                                    imageList8.value;

                                                setValue(k11ThermalPic8,
                                                    addedString);
                                                imageChange8.value = false;
                                                imageChange8.value = true;
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: note8Controller,
                    maxLines: 4,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setValue(k11ThermalNote8, value);
                    },
                    //controller: _firstName,
                    //textInputAction: TextInputType.emailAddress,
                    cursorWidth: 0.5,
                    cursorColor: AppColors.primaryColor.withOpacity(0.1),
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
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintStyle: const TextStyle(
                          fontFamily: AppFonts.nunitoSansRegular,
                          fontSize: 14,
                          color: Color(0xff4E4E4E)),
                      hintText: 'Type Something',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),
                //9
                const Gap(20),
                const Text(
                  'Untitled',
                  style: TextStyle(
                      fontSize: 12,
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
                          /* image9.value = await getImage() ?? '';
                          setValue(k11ThermalPic9, image9.value); */
                          List<String> path = await getImage();

                          path.addAll(imageList9.value);
                          String addedString = '';
                          for (String vlist in path) {
                            addedString = "${addedString}J@^J$vlist";
                          }

                          imageChange9.value = false;
                          imageList9.value.clear();
                          imageList9.value.addAll(path);

                          setValue(k11ThermalPic9, addedString);
                          imageChange9.value = true;
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
                      /*  if (!image9.value.trim().isEmptyOrNull)
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(
                            File(image9.value),
                            height: 100,
                            width: 100,
                          ),
                        ) */
                      if (imageList9.value.isNotEmpty && imageChange9.value)
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...imageList9.value.map((e) {
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
                                                imageList9.value.remove(e);
                                                String addedString = '';
                                                for (String vlist
                                                    in imageList9.value) {
                                                  addedString =
                                                      "${addedString}J@^J$vlist";
                                                }

                                                imageList9.value =
                                                    imageList9.value;

                                                setValue(k1PropertyList,
                                                    addedString);
                                                imageChange9.value = false;
                                                imageChange9.value = true;
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: note9Controller,
                    maxLines: 4,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setValue(k11ThermalNote9, value);
                    },
                    //controller: _firstName,
                    //textInputAction: TextInputType.emailAddress,
                    cursorWidth: 0.5,
                    cursorColor: AppColors.primaryColor.withOpacity(0.1),
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
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintStyle: const TextStyle(
                          fontFamily: AppFonts.nunitoSansRegular,
                          fontSize: 14,
                          color: Color(0xff4E4E4E)),
                      hintText: 'Type Something',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),
                //10
                const Gap(20),
                const Text(
                  'Untitled',
                  style: TextStyle(
                      fontSize: 12,
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
                          /*  image10.value = await getImage() ?? '';
                          setValue(k11ThermalPic10, image10.value); */
                          List<String> path = await getImage();

                          path.addAll(imageList10.value);
                          String addedString = '';
                          for (String vlist in path) {
                            addedString = "${addedString}J@^J$vlist";
                          }

                          imageChange10.value = false;
                          imageList10.value.clear();
                          imageList10.value.addAll(path);

                          setValue(k11ThermalPic10, addedString);
                          imageChange10.value = true;
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
                      /*  if (!image10.value.trim().isEmptyOrNull)
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.file(
                            File(image10.value),
                            height: 100,
                            width: 100,
                          ),
                        ) */
                      if (imageList10.value.isNotEmpty && imageChange10.value)
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              ...imageList10.value.map((e) {
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
                                                imageList10.value.remove(e);
                                                String addedString = '';
                                                for (String vlist
                                                    in imageList10.value) {
                                                  addedString =
                                                      "${addedString}J@^J$vlist";
                                                }

                                                imageList10.value =
                                                    imageList10.value;

                                                setValue(k11ThermalPic10,
                                                    addedString);
                                                imageChange10.value = false;
                                                imageChange10.value = true;
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: note10Controller,
                    maxLines: 4,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      setValue(k11ThermalNote10, value);
                    },
                    //controller: _firstName,
                    //textInputAction: TextInputType.emailAddress,
                    cursorWidth: 0.5,
                    cursorColor: AppColors.primaryColor.withOpacity(0.1),
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
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintStyle: const TextStyle(
                          fontFamily: AppFonts.nunitoSansRegular,
                          fontSize: 14,
                          color: Color(0xff4E4E4E)),
                      hintText: 'Type Something',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),

                const Gap(20),
                const Text(
                  'Terms and Conditions of Thermal Imaging Photography Report',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: AppFonts.nunitoSansRegular,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(20),
                const Text(
                  'Orders:',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: AppFonts.nunitoSansRegular,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                const Text(
                  'Order for Inspections and reports can be made by telephone by email or by fax',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppFonts.nunitoSansLight,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff515151)),
                ),
                const Gap(20),
                const Text(
                  'Access:',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: AppFonts.nunitoSansRegular,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                const Text(
                  'We will organise access to the property using the information you provide',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppFonts.nunitoSansLight,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff515151)),
                ),
                const Gap(20),
                const Text(
                  'Payment:',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: AppFonts.nunitoSansRegular,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                const Text(
                  'Payment is required at the time that the inspection is ordered',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppFonts.nunitoSansLight,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff515151)),
                ),
                const Gap(20),
                const Text(
                  'Payment Method:',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: AppFonts.nunitoSansRegular,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                const Text(
                  'Payment can be made by credit card or internet banking',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppFonts.nunitoSansLight,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff515151)),
                ),
                const Gap(20),
                const Text(
                  'Cancellations:',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: AppFonts.nunitoSansRegular,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                const Text(
                  'We require 2h hours notice for the cancellation or you will be charged the full inspection fee',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppFonts.nunitoSansLight,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff515151)),
                ),
                const Gap(20),
                const Text(
                  'Cancellation Method:',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: AppFonts.nunitoSansRegular,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                const Text(
                  'Cancellation can be made by telephone, text or email.',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppFonts.nunitoSansLight,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff515151)),
                ),
                const Gap(20),
                const Text(
                  'Purpose of Report:',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: AppFonts.nunitoSansRegular,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                Text(
                  LongTexts.reportPurpose,
                  style: const TextStyle(
                      fontSize: 13,
                      fontFamily: AppFonts.nunitoSansLight,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff515151)),
                ),
                const Gap(20),
                const Text(
                  'Not a Guarantee:',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: AppFonts.nunitoSansRegular,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                Text(
                  LongTexts.guarantee,
                  style: const TextStyle(
                      fontSize: 13,
                      fontFamily: AppFonts.nunitoSansLight,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff515151)),
                ),
                const Gap(20),
                const Text(
                  'Sample Report:',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: AppFonts.nunitoSansRegular,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                Text(
                  LongTexts.sampleReport,
                  style: const TextStyle(
                      fontSize: 13,
                      fontFamily: AppFonts.nunitoSansLight,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff515151)),
                ),
                const Gap(20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
