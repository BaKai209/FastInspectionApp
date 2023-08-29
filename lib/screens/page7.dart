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
import 'home_screen.dart';

class Page7 extends HookWidget {
  const Page7({super.key});

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

  /*   final image1 =
        useState(getStringAsync(k7TimberPestPicture, defaultValue: ''));
    final image2 =
        useState(getStringAsync(k7TimberPestTypePicture, defaultValue: ''));

 */

//1

 final imageChange1 = useState(true);
    //propery facade
    final newImageList1 =
        useState(getStringAsync(k7TimberPestPicture, defaultValue: ''));
    List<String> listman1 = newImageList1.value.split('J@^J');
    listman1.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList1 = useState<List<String>>(listman1);
    // property



//2

 final imageChange2 = useState(true);
    //propery facade
    final newImageList2 =
        useState(getStringAsync(k7TimberPestTypePicture, defaultValue: ''));
    List<String> listman2 = newImageList2.value.split('J@^J');
    listman2.removeWhere(
        (element) => element == 'J@^J' || element.trim().isEmptyOrNull);
    final imageList2 = useState<List<String>>(listman2);



    final nextInspection =
        useState(getStringAsync(k7TimberPestDuration, defaultValue: 'ASAP'));
    final nextInspection1 =
        useState(getStringAsync(k7TimberPestPriority, defaultValue: 'Low'));
    final nextInspection2 =
        useState(getStringAsync(k7TimberPestPriority1, defaultValue: 'Low'));
    
    final cupboards = useState(
        getBoolAsync(k7TimberPestTypeObstruction1, defaultValue: false));
    final covering = useState(
        getBoolAsync(k7TimberPestTypeObstruction2, defaultValue: false));
    final furniture = useState(
        getBoolAsync(k7TimberPestTypeObstruction3, defaultValue: false));
    final items = useState(
        getBoolAsync(k7TimberPestTypeObstruction4, defaultValue: false));
    final vegetation = useState(
        getBoolAsync(k7TimberPestTypeObstruction5, defaultValue: false));
    final ac = useState(
        getBoolAsync(k7TimberPestTypeObstruction6, defaultValue: false));
    final insulation = useState(
        getBoolAsync(k7TimberPestTypeObstruction7, defaultValue: false));
    final val1 = useState(
        getBoolAsync(k7TimberPestTypeObstruction8, defaultValue: false));
    final val2 = useState(
        getBoolAsync(k7TimberPestTypeObstruction9, defaultValue: false));
    //String? nextInspection1;
    //final active = useState<EvidenceActive>(EvidenceActive.yes);
    final active2 = useState<EvidenceActive>(EvidenceActive.values.byName(
      getStringAsync(k7TimberPest1, defaultValue: EvidenceActive.no.name),
    ));
    final termite = useState<EvidenceTermite>(EvidenceTermite.values.byName(
        getStringAsync(k7TimberPest2, defaultValue: EvidenceTermite.no.name)));
    final previous = useState<EvidencePrevious>(EvidencePrevious.values.byName(
        getStringAsync(k7TimberPest3,
            defaultValue: EvidencePrevious.no.name)));
    final chemical = useState<EvidenceChemical>(EvidenceChemical.values.byName(
        getStringAsync(k7TimberPest4,
            defaultValue: EvidenceChemical.no.name)));
    final fungal = useState<EvidenceFungal>(EvidenceFungal.values.byName(
        getStringAsync(k7TimberPest5, defaultValue: EvidenceFungal.no.name)));
    final wood = useState<EvidenceWood>(EvidenceWood.values.byName(
        getStringAsync(k7TimberPest6, defaultValue: EvidenceWood.no.name)));
    final conducive = useState<EvidenceConducive>(EvidenceConducive.values
        .byName(getStringAsync(k7TimberPest7,
            defaultValue: EvidenceConducive.no.name)));
    final hazards = useState<EvidenceHazards>(EvidenceHazards.values.byName(
        getStringAsync(k7TimberPest8, defaultValue: EvidenceHazards.no.name)));
    final note1Controller = useTextEditingController(
        text: getStringAsync(k7TimberPestNote, defaultValue: ''));
    final note2Controller = useTextEditingController(
        text: getStringAsync(k7TimberPestTypeNote, defaultValue: ''));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        const Text(
          '7. Timber Pest Report',
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
                'Results of inspection - Summary',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                LongTexts.resultInspection,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
              const Gap(10),
              const Text(
                'Evidence of active (live) termites was found?',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<EvidenceActive>(
                      title: const Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceActive.yes,
                      groupValue: active2.value,
                      onChanged: (EvidenceActive? value) {
                        active2.value = value!;
                        print(value.name);
                        setValue(k7TimberPest1, 'yes');
                        /*  setState(() {
                          _active = value;
                        }); */
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<EvidenceActive>(
                      title: const Text(
                        'No',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceActive.no,
                      groupValue: active2.value,
                      onChanged: (EvidenceActive? value) {
                        active2.value = value!;
                        setValue(k7TimberPest1, 'no');
                        /* setState(() {
                          _active = value;
                        }); */
                      },
                    ),
                  ),
                ],
              ),
              const Gap(10),
              const Text(
                'Evidence of termite activity (including workings) and/or damage was found?',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<EvidenceTermite>(
                      title: const Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceTermite.yes,
                      groupValue: termite.value,
                      onChanged: (EvidenceTermite? value) {
                        // setState(() {
                        termite.value = value!;
                        setValue(k7TimberPest2, 'yes');
                        // });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<EvidenceTermite>(
                      title: const Text(
                        'No',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceTermite.no,
                      groupValue: termite.value,
                      onChanged: (EvidenceTermite? value) {
                        termite.value = value!;
                        setValue(k7TimberPest2, 'no');
                        /* setState(() {
                          _termite = value;
                        }); */
                      },
                    ),
                  ),
                ],
              ),
              const Gap(10),
              const Text(
                'Evidence of a possible previous termite management program was found?',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<EvidencePrevious>(
                      title: const Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidencePrevious.yes,
                      groupValue: previous.value,
                      onChanged: (EvidencePrevious? value) {
                        previous.value = value!;
                        setValue(k7TimberPest3, 'yes');
                        /*  setState(() {
                          _previous = value;
                        }); */
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<EvidencePrevious>(
                      title: const Text(
                        'No',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidencePrevious.no,
                      groupValue: previous.value,
                      onChanged: (EvidencePrevious? value) {
                        previous.value = value!;
                        setValue(k7TimberPest3, 'no');
                        /* setState(() {
                          _previous = value;
                        }); */
                      },
                    ),
                  ),
                ],
              ),
              const Gap(10),
              const Text(
                'The next inspection to help detect any future termite attack is recommended within:',
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
                  value: nextInspection.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'ASAP',
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
                    nextInspection.value = value!;
                    setValue(k7TimberPestDuration, value);
                    /*   setState(() {
                      nextInspection = value;
                    }); */
                  },
                  items: ['ASAP', '6 Months', '12 Months']
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
                'Evidence of chemical delignification damage was found',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<EvidenceChemical>(
                      title: const Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceChemical.yes,
                      groupValue: chemical.value,
                      onChanged: (EvidenceChemical? value) {
                        chemical.value = value!;
                        setValue(k7TimberPest4, 'yes');
                        /*  setState(() {
                          _chemical = value;
                        }); */
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<EvidenceChemical>(
                      title: const Text(
                        'No',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceChemical.no,
                      groupValue: chemical.value,
                      onChanged: (EvidenceChemical? value) {
                        chemical.value = value!;
                        setValue(k7TimberPest4, 'no');
                        /*  setState(() {
                          _chemical = value;
                        }); */
                      },
                    ),
                  ),
                ],
              ),
              const Gap(10),
              const Text(
                'Evidence of fungal decay (timber rot) and/or damage was found?',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<EvidenceFungal>(
                      title: const Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceFungal.yes,
                      groupValue: fungal.value,
                      onChanged: (EvidenceFungal? value) {
                        fungal.value = value!;
                        setValue(k7TimberPest5, 'yes');
                        /* setState(() {
                          _fungal = value;
                        }); */
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<EvidenceFungal>(
                      title: const Text(
                        'No',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceFungal.no,
                      groupValue: fungal.value,
                      onChanged: (EvidenceFungal? value) {
                        fungal.value = value!;
                        setValue(k7TimberPest5, 'no');
                        /*  setState(() {
                          _fungal = value;
                        }); */
                      },
                    ),
                  ),
                ],
              ),
              const Gap(10),
              const Text(
                'Evidence of wood borer activity and/or damage was found?',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<EvidenceWood>(
                      title: const Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceWood.yes,
                      groupValue: wood.value,
                      onChanged: (EvidenceWood? value) {
                        wood.value = value!;
                        setValue(k7TimberPest6, 'yes');
                        /*  setState(() {
                          _wood = value;
                        }); */
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<EvidenceWood>(
                      title: const Text(
                        'No',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceWood.no,
                      groupValue: wood.value,
                      onChanged: (EvidenceWood? value) {
                        wood.value = value!;
                        setValue(k7TimberPest6, 'no');
                        /*  setState(() {
                          _wood = value;
                        }); */
                      },
                    ),
                  ),
                ],
              ),
              const Gap(10),
              const Text(
                'Evidence of conditions conducive to timber pest attack was found?',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<EvidenceConducive>(
                      title: const Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceConducive.yes,
                      groupValue: conducive.value,
                      onChanged: (EvidenceConducive? value) {
                        conducive.value = value!;
                        setValue(k7TimberPest7, 'yes');
                        /*  setState(() {
                          _conducive = value;
                        }); */
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<EvidenceConducive>(
                      title: const Text(
                        'No',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceConducive.no,
                      groupValue: conducive.value,
                      onChanged: (EvidenceConducive? value) {
                        conducive.value = value!;
                        setValue(k7TimberPest7, 'no');
                        /*  setState(() {
                          _conducive = value;
                        }); */
                      },
                    ),
                  ),
                ],
              ),
              const Gap(10),
              const Text(
                'Evidence of major safety hazards was found?',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<EvidenceHazards>(
                      title: const Text(
                        'Yes',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceHazards.yes,
                      groupValue: hazards.value,
                      onChanged: (EvidenceHazards? value) {
                        hazards.value = value!;
                        setValue(k7TimberPest8, 'yes');
                        /*  setState(() {
                          _hazards = value;
                        }); */
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<EvidenceHazards>(
                      title: const Text(
                        'No',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontWeight: FontWeight.w700),
                      ),
                      value: EvidenceHazards.no,
                      groupValue: hazards.value,
                      onChanged: (EvidenceHazards? value) {
                        hazards.value = value!;
                        setValue(k7TimberPest8, 'no');
                        /*  setState(() {
                          _hazards = value;
                        }); */
                      },
                    ),
                  ),
                ],
              ),
              const Gap(10),
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
                      /*   image1.value = await getImage() ?? '';
                        setValue(k7TimberPestPicture, image1.value); */

                         List<String> path = await getImage();

                        path.addAll(imageList1.value);
                        String addedString = '';
                        for (String vlist in path) {
                          addedString = "${addedString}J@^J$vlist";
                        }

                        imageChange1.value = false;
                        imageList1.value.clear();
                        imageList1.value.addAll(path);

                        setValue(k7TimberPestPicture, addedString);
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

                                              imageList1.value = imageList1.value;

                                              setValue(
                                                  k7TimberPestPicture, addedString);
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
                    //color: Colors.white,
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
                    setValue(k7TimberPestNote, value);
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
                'Due to the level of accessibility for inspection including the '
                'presence of obstructions, the overall degree of risk of '
                'undetected timber pest attack and conditions conducive to timber pest attack was considered:',
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
                  value: nextInspection1.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Low',
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
                    nextInspection1.value = value!;
                    setValue(k7TimberPestPriority, value);
                    /*  setState(() {
                      nextInspection1 = value;
                    }); */
                  },
                  items: ['Low', 'Moderate', 'Moderate high', 'High']
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
            /*   const Text(
                'Undetected timber pest risk assessment',
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
                  value: nextInspection2.value,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                  dropdownColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  hint: const Text(
                    'Low',
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
                    nextInspection2.value = value!;
                    setValue(k7TimberPestPriority1, value);
                    /*  setState(() {
                      nextInspection1 = value;
                    }); */
                  },
                  items: ['Low', 'Moderate', 'Moderate high', 'High']
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
              const Gap(20), */
              Text(
                LongTexts.removed,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
              const Gap(20),
              const Text(
               // 'Which items obstructed visual inspection of building elements',
                'Which items are conducive to termite activity',
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
                          'Garden against building',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: cupboards.value,
                        onChanged: (value) {
                          cupboards.value = value!;
                          setValue(k7TimberPestTypeObstruction1, value);
                          /* setState(() {
                            cupboards = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Tap(s) without drain under',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: covering.value,
                        onChanged: (value) {
                          covering.value = value!;
                          setValue(k7TimberPestTypeObstruction2, value);
                          /*  setState(() {
                            covering = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Hot water system outlet draining to ground',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: furniture.value,
                        onChanged: (value) {
                          furniture.value = value!;
                          setValue(k7TimberPestTypeObstruction3, value);
                          /*  setState(() {
                            furniture = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Air conditioner unit outlet draining to ground',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: items.value,
                        onChanged: (value) {
                          items.value = value!;
                          setValue(k7TimberPestTypeObstruction4, value);
                          /*  setState(() {

                            items = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'No ant caps installed on sub floor piers',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: vegetation.value,
                        onChanged: (value) {
                          vegetation.value = value!;
                          setValue(k7TimberPestTypeObstruction5, value);
                          /*  setState(() {
                            vegetation = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Termite treatment label missing in meter box',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: ac.value,
                        onChanged: (value) {
                          ac.value = value!;
                          setValue(k7TimberPestTypeObstruction6, value);
                          /*  setState(() {
                            ac = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Ground level above slab height',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: insulation.value,
                        onChanged: (value) {
                          insulation.value = value!;
                          setValue(k7TimberPestTypeObstruction7, value);
                          /*  setState(() {
                            insulation = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Lack of sub floor ventilation',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: val1.value,
                        onChanged: (value) {
                          val1.value = value!;
                          setValue(k7TimberPestTypeObstruction8, value);
                          /* setState(() {
                            val1 = value!;
                          }); */
                        }),
                    CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'Bridging or breaching of termite management systems and/or inspection zones',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppFonts.nunitoSansRegular,
                              color: Colors.grey),
                        ),
                        value: val2.value,
                        onChanged: (value) {
                          val2.value = value!;
                          setValue(k7TimberPestTypeObstruction9, value);
                          /* setState(() {
                            val2 = value!;
                          }); */
                        }),
                    const Gap(10),
                  ],
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
                      /*   image2.value = await getImage() ?? '';
                        setValue(k7TimberPestTypePicture, image2.value); */

                         List<String> path = await getImage();

                        path.addAll(imageList2.value);
                        String addedString = '';
                        for (String vlist in path) {
                          addedString = "${addedString}J@^J$vlist";
                        }

                        imageChange2.value = false;
                        imageList2.value.clear();
                        imageList2.value.addAll(path);

                        setValue(k7TimberPestTypePicture, addedString);
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

                                              imageList2.value = imageList2.value;

                                              setValue(
                                                  k1PropertyList, addedString);
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
                  controller: note2Controller,
                  maxLines: 4,
                  keyboardType: TextInputType.name,
                  //controller: _firstName,
                  //textInputAction: TextInputType.emailAddress,
                  cursorWidth: 0.5,
                  cursorColor: AppColors.primaryColor.withOpacity(0.1),
                  onChanged: (value) {
                    setValue(k7TimberPestTypeNote, value);
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
