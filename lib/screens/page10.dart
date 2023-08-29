import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/colors.dart';
import '../constants/constant_values.dart';
import '../constants/fonts.dart';

class Page10 extends HookConsumerWidget {
  Page10({super.key});
  DateTime selectedDate = DateTime.now();
  List<String> kitchenList = [
    'Satisfactory',
    'Minor defect',
    'Major defect',
    'No access',
    'Limited access',
    'Note',
    'N/A',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    final imageChange = useState(true);
    //propery facade
    final newImageList =
        useState(getStringAsync(k10NewPicture, defaultValue: ''));
    List<String> listman = newImageList.value.split('J@^J');
    listman.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList = useState<List<String>>(listman);
    // property

    final meterbox =
        useState(getStringAsync(k10NewMeterBox, defaultValue: 'Satisfactory'));

    final wire =
        useState(getStringAsync(k10NewWire, defaultValue: 'Satisfactory'));
    final powerOutlet = useState(
        getStringAsync(k10NewPowerOutlet, defaultValue: 'Satisfactory'));

    final lightFit =
        useState(getStringAsync(k10NewLightFit, defaultValue: 'Satisfactory'));

    final hotWater =
        useState(getStringAsync(k10NewHotWater, defaultValue: 'Satisfactory'));

    final smokedectector = useState(
        getStringAsync(k10NewSmokeDectector, defaultValue: 'Satisfactory'));

    final earthingSystem = useState(
        getStringAsync(k10NewEarthingSystem, defaultValue: 'Satisfactory'));

    final noteController = useTextEditingController(
        text: getStringAsync(k10NewNote, defaultValue: ''));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        const Text(
          '8. Electrical Inspection Report',
          style: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.nunitoSansRegular,
              fontWeight: FontWeight.w700),
        ),
        const Gap(10),
        const Text(
          'Use this section only if required',
          style: TextStyle(
              fontSize: 12,
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
                'Terms and Conditions for Electrical Inspection ',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              const Text(
                '''1. Scope of Inspection: The electrical inspection will encompass visible electrical systems and components within the property, including but not limited to: electrical panels, circuits, wiring, fixtures, switches and outlets.

2. Inspection Process: The inspection will be performed by a licensed and qualified electrician, who will conduct a visual inspection of electrical systems and components. Any necessary testing or measurements will be conducted to ensure the electrical systems and components are in compliance with the relevant Australian standards and codes.

3. Limitations of Inspection: The inspection will be limited to readily accessible areas and systems. The inspector will not move any furniture or personal belongings, nor will they disassemble any electrical systems or components. The inspector will not provide an evaluation of the performance or efficiency of the electrical systems or components.

4. Report and Recommendations: Upon completion of the inspection, the inspector will provide a written report detailing their findings and any recommendations for repairs or rectification.The report will not include any warranties or guarantees, and it is the responsibility of the property owner to ensure that any necessary repairs or upgrades are performed by a licensed and qualified electrician.

5. Payment Terms: Payment for the inspection services is due upon completion of the inspection and receipt of the report. The inspector reserves the right to withhold the report until payment has been received in full.

6. Liability and Indemnification: The inspector assumes no liability for any damages or losses arising from the inspection or any repairs or upgrades recommended in the report. The property owner agrees to indemnify and hold harmless the inspector for any claims, damages, or losses arising from the inspection or any repairs or upgrades recommended in the report.

7. Governing Law: These terms and conditions shall be governed by and construed in accordance with the laws of the state in which the inspection is performed.

8. Entire Agreement: These terms and conditions constitute the entire agreement between the inspector and the property owner, and supersede all prior negotiations, understandings, and agreements between the parties.

9. Amendments: These terms and conditions may only be amended in writing and signed by both the inspector and the property owner. ''',
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              const Text(
                'Electrical results',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              buildItem('Meter box/meter panel', meterbox, k10NewMeterBox),
              const Gap(10),
              buildItem('Wiring', wire, k10NewWire),
              const Gap(10),
              buildItem(
                  'Power outlets & switches', powerOutlet, k10NewPowerOutlet),
              const Gap(10),
              buildItem('Light fittings', lightFit, k10NewLightFit),
              const Gap(10),
              buildItem('Hot water system', hotWater, k10NewHotWater),
              const Gap(10),
              buildItem('Smoke detectors (not tested)', smokedectector,
                  k10NewSmokeDectector),
              const Gap(10),
              buildItem(
                  'Earthing system', earthingSystem, k10NewEarthingSystem),
              const Gap(10),
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

                        setValue(k10NewPicture, addedString);
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
                                                  k10NewPicture, addedString);
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
              const Gap(10),
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
                    setValue(k10NewNote, value);
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

  Widget buildItem(String name, ValueNotifier listen, String sherfRef) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
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
            value: listen.value,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
            //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
            dropdownColor: Colors.white,
            elevation: 16,
            isExpanded: true,
            hint: Text(
              name,
              style: const TextStyle(
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
              listen.value = value!;
              setValue(sherfRef, value);
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
      ],
    );
  }
}
