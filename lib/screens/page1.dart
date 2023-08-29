import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import 'package:nb_utils/nb_utils.dart';

import '../constants/colors.dart';
import '../constants/constant_values.dart';
import '../constants/fonts.dart';
import '../local_db/business_db_provider.dart';
import '../models/business.dart';

class Page1 extends HookWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final controlllerBusinessName = useTextEditingController();
    final businessAddressController = useTextEditingController();
    final businessPhoneController = useTextEditingController();
    final businessEmailController = useTextEditingController();
    final businessWebsiteController = useTextEditingController();
    var imagePath = useState('');
    useEffect(() {
      BusinessDbProvider.getBusinesses().then((value) {
        if (value != null) {
          controlllerBusinessName.text = value.businessName;
          businessAddressController.text = value.businessAddress;
          businessPhoneController.text = value.businessPhone;
          businessEmailController.text = value.businessEmail;
          businessWebsiteController.text = value.businessWebsite;
          imagePath.value = value.imagePath;
        }

        return;
      });
      return null;
    });
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
                              maxHeight: 500,
                              maxWidth: 500,
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

    Future<String> getSingleImage() async {
      XFile? image;
      final ImagePicker picker = ImagePicker();
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
                              maxHeight: 500,
                              maxWidth: 500,
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
                              maxHeight: 500,
                              maxWidth: 500,
                              imageQuality: 100,
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
      // print(image?.path ?? "");
      return image?.path ?? "";
    }

    final imageChange = useState(true);
    //propery facade
    final newImageList =
        useState(getStringAsync(k1PropertyList, defaultValue: ''));
    List<String> listman = newImageList.value.split('J@^J');
    listman.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList = useState<List<String>>(listman);
    // property

    final imagebus =
        useState(getStringAsync(k1PropertyFacade, defaultValue: ''));
    final image = useState(getStringAsync(k1PropertyFacade, defaultValue: ''));
    final controllerAddressline1 = useTextEditingController(
        text: getStringAsync(k1IAAddressLine1, defaultValue: ''));
    final controlllerCity = useTextEditingController(
        text: getStringAsync(k1IACity, defaultValue: ''));
    final controlllerState = useTextEditingController(
        text: getStringAsync(k1IAState, defaultValue: ''));
    final controlllerPostal = useTextEditingController(
        text: getStringAsync(k1IAPostal, defaultValue: ''));
    final controlllerReportNumber = useTextEditingController(
        text: getStringAsync(k1IAReport_number, defaultValue: ''));

    return Column(
      children: [
        const Gap(20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: double.maxFinite,
          color: const Color(0xff39A78E).withOpacity(0.2),
          child: const Text(
            'PO Box 573 Newtown NSW 2042\nPh: 0492 961 622\nEmail: info@innerwestpropertyinspections.com.au\nwww.innerwestpropertyinspections.com.au',
            style: TextStyle(
                fontSize: 13,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
        ),
        const Gap(20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: double.maxFinite,
          color: const Color(0xff39A78E).withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*  const Text(
                'Business',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10), */
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: controlllerBusinessName,
                  keyboardType: TextInputType.name,

                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k1PropertyBusinessName, value);
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
                    hintText: 'Business Name',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: businessAddressController,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k1PropertyBusinessName, value);
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
                    hintText: 'Business Address',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: businessPhoneController,
                  keyboardType: TextInputType.phone,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k1PropertyBusinessName, value);
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
                    hintText: 'Business Phone No',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: businessEmailController,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k1PropertyBusinessName, value);
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
                    hintText: 'Business Email',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: businessWebsiteController,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k1PropertyBusinessName, value);
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
                    hintText: 'Business Website',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Gap(10),
              const Text(
                'Business logo',
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
                        image.value = await getSingleImage();
                        setValue(k1PropertyFacade, image.value);
                        //imageChange.value = false;
                        // imageChange.value = true;
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
                    if (!image.value.trim().isEmptyOrNull)
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.file(
                          File(image.value),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    if (!imagePath.value.trim().isEmptyOrNull &&
                        image.value.trim().isEmptyOrNull)
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.file(
                          File(imagePath.value),
                          height: 100,
                          width: 100,
                        ),
                      ),
                  ],
                ),
              ),
              const Gap(10),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      Business business = Business(
                          id: 1,
                          businessName: controlllerBusinessName.text,
                          businessAddress: businessAddressController.text,
                          businessPhone: businessPhoneController.text,
                          businessEmail: businessEmailController.text,
                          businessWebsite: businessWebsiteController.text,
                          imagePath: image.value);
                      BusinessDbProvider.insertBusiness(business);
                      snackBar(context,
                          content: const Text(
                            'Business details saved!',
                          ),
                          backgroundColor: Colors.green);
                      // Business business1 =
                      //     await BusinessDbProvider.getBusinesses();
                      // print(business1.toString());
                    },
                    child: const Text('Save Business Details')),
              ),
            ],
          ),
        ),
        const Gap(10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: double.maxFinite,
          color: const Color(0xff39A78E).withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Property facade',
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
                        List<String> path = await getImage();

                        path.addAll(imageList.value);
                        String addedString = '';
                        for (String vlist in path) {
                          addedString = "${addedString}J@^J$vlist";
                        }

                        imageChange.value = false;
                        imageList.value.clear();
                        imageList.value.addAll(path);

                        setValue(k1PropertyList, addedString);
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

                                              setValue(
                                                  k1PropertyList, addedString);
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
              )
            ],
          ),
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
                'Inspection Address',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: controllerAddressline1,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k1IAAddressLine1, value);
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
                    hintText: 'Address Line 1',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: controlllerCity,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k1IACity, value);
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
                    hintText: 'City',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: controlllerState,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k1IAState, value);
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
                    hintText: 'State / Province / Region',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: controlllerPostal,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k1IAPostal, value);
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
                    hintText: 'Postal / Zip Code',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
            ],
          ),
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
                'Report number',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: controlllerReportNumber,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k1IAReport_number, value);
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
                    hintText: '#123456',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          width: double.maxFinite,
          color: const Color(0xff39A78E).withOpacity(0.2),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "As requested and agreed with the Client, "
                "the inspection carried out by the Building"
                "Consultant and Timber Pest Detection Consultant is a Standard Property & Timber"
                " Pest Report comprising a Property Report and Timber Pest Report.\n\n"
                '"Client" means the person or persons, for whom the Repost was carried out or their Principal '
                '(i.e. the person or persons for whom the report is being obtained).\n\n'
                '"Building Consultant" means a person, business or company who is qualified and experienced'
                ' to undertake a pre-purchase inspection in accordance with Australian Standard AS '
                '4349.1-2007 Inspection of Buildings. Part 1: Pre-Purchase Inspections - Residential Buildings. '
                'The Consultant must also meet any Government licencing requirement, where applicable\n\n'
                '"Timber Pest Detection Consultant" means person who meets the minimum skills requirement set out in the '
                'current Australian Standard As 4349.3 Inspections of Buildings. Part 3: Timber Pest Inspection Reports '
                'or state/territory legislation requirements beyond this Standard, where applicable.\n\n'
                'This Standard Property & Timber Pest Report was produced for the exclusive use of the Client. '
                'The Consultant, their company or firm is not liable for any reliance placed on this repost by any third party.',
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
