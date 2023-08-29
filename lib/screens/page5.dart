import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/colors.dart';
import '../constants/constant_values.dart';
import '../constants/fonts.dart';
import '../my_widgets.dart/bathroom.dart';
import '../my_widgets.dart/hallway.dart';
import '../my_widgets.dart/kitchen.dart';
import '../my_widgets.dart/laundry.dart';
import '../my_widgets.dart/livingroom.dart';

class Page5 extends HookWidget {
  Page5(this.kitchenListStore, this.bathRoomListStore, this.livingRoomListStore,
      this.buildingRoomListStore, this.laundryRoomListStore,
      {super.key});
  List<String> kitchenListStore;
  List<String> bathRoomListStore;
  List<String> livingRoomListStore;
  List<String> buildingRoomListStore;
  List<String> laundryRoomListStore;
  List<String> kitchenList = [
    'Building and pest',
    'Building, pest & electrical',
    'Building, pest, electrical and thermal imaging',
    'N/A',
    'Pest only',
  ];

  @override
  Widget build(BuildContext context) {
    Future<String> getImage() async {
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
                              imageQuality: 100, source: ImageSource.camera);
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

    List<String> kitchenItems = [];

    //getPref();
    useEffect(() {
      return null;
    });
    print('i eeee');
    print(kitchenItems);
    print('i eeee');

    final kitchenNumber = useState(kitchenListStore.length);
    final bedRoomNumber = useState(bathRoomListStore.length);
    final livingRoomNumber = useState(livingRoomListStore.length);
    final laundryRoomNumber = useState(laundryRoomListStore.length);
/*     var kitchenList2 = getJSONAsync(
      k5KitchenNumberList,
    ); */

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Gap(20),
        const Text(
          '5. Inspection Results - Interior',
          style: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.nunitoSansRegular,
              fontWeight: FontWeight.w700),
        ),
        const Gap(20),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: kitchenNumber.value,
            itemBuilder: (BuildContext ctxt, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: KitchenWidget(
                  index: index + 1,
                  onTapAction: () async {
                    print('i am deleting you');
                    kitchenListStore.removeAt(index);
                    kitchenNumber.value = kitchenListStore.length;
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setStringList(
                        k5KitchenNumberList, kitchenListStore);
                  },
                  listValue: kitchenListStore[index].toInt(),
                ),
              );
            }),

        const Gap(20),
        GestureDetector(
          onTap: () async {
            int value = kitchenListStore.last.toInt();
            kitchenListStore.add((value + 1).toString());
            kitchenNumber.value = kitchenListStore.length;
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setStringList(k5KitchenNumberList, kitchenListStore);
            // kitchenList2.value.add('1');
          },
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.primaryColor.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                '+ Add Kitchen',
                style: TextStyle(
                  fontFamily: AppFonts.nunitoSansRegular,
                ),
              ),
            ),
          ),
        ),

        const Gap(20),
        //for bathroom
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bedRoomNumber.value,
            itemBuilder: (BuildContext ctxt, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: BathRoomWidget(
                  index: index + 1,
                  onTapAction: () async {
                    print('i am deleting you');
                    bathRoomListStore.removeAt(index);
                    bedRoomNumber.value = bathRoomListStore.length;
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setStringList(
                        k5BathroomNumberList, bathRoomListStore);
                  },
                  listValue: bathRoomListStore[index].toInt(),
                ),
              );
            }),
        const Gap(20),
        GestureDetector(
          onTap: () async {
            int value = bathRoomListStore.last.toInt();
            bathRoomListStore.add((value + 1).toString());
            bedRoomNumber.value = bathRoomListStore.length;
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setStringList(k5BathroomNumberList, bathRoomListStore);
            // kitchenList2.value.add('1');
          },
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.primaryColor.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                '+ Add Bathroom',
                style: TextStyle(
                  fontFamily: AppFonts.nunitoSansRegular,
                ),
              ),
            ),
          ),
        ),

        //for bathroom
        //for living room

        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: livingRoomNumber.value,
            itemBuilder: (BuildContext ctxt, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: LivingRoomWidget(
                  index: index + 1,
                  onTapAction: () async {
                    print('i am deleting you');
                    livingRoomListStore.removeAt(index);
                    livingRoomNumber.value = livingRoomListStore.length;
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setStringList(
                        k5LivingRoomNumberList, livingRoomListStore);
                  },
                  listValue: livingRoomListStore[index].toInt(),
                ),
              );
            }),
        const Gap(20),
        GestureDetector(
          onTap: () async {
            int value = livingRoomListStore.last.toInt();
            livingRoomListStore.add((value + 1).toString());
            livingRoomNumber.value = livingRoomListStore.length;
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setStringList(
                k5LivingRoomNumberList, livingRoomListStore);
            // kitchenList2.value.add('1');
          },
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.primaryColor.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                '+ Add Living/dining area',
                style: TextStyle(
                  fontFamily: AppFonts.nunitoSansRegular,
                ),
              ),
            ),
          ),
        ),

        //for living room
        //for luandary
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: laundryRoomNumber.value,
            itemBuilder: (BuildContext ctxt, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: LaundryRoomWidget(
                  index: index + 1,
                  onTapAction: () async {
                    print('i am deleting you');
                    laundryRoomListStore.removeAt(index);
                    laundryRoomNumber.value = laundryRoomListStore.length;
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setStringList(
                        k5LuandryNumberList, laundryRoomListStore);
                  },
                  listValue: laundryRoomListStore[index].toInt(),
                ),
              );
            }),
        const Gap(20),
        GestureDetector(
          onTap: () async {
            int value = laundryRoomListStore.last.toInt();
            laundryRoomListStore.add((value + 1).toString());
            laundryRoomNumber.value = laundryRoomListStore.length;
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setStringList(
                k5LuandryNumberList, laundryRoomListStore);
            // kitchenList2.value.add('1');
          },
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.primaryColor.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                '+ Add Laundry',
                style: TextStyle(
                  fontFamily: AppFonts.nunitoSansRegular,
                ),
              ),
            ),
          ),
        ),

        //for luandary
        //Hallway
        HallwayRoomWidget()
      ],
    );
  }
}
/* 
  PdfLayoutResult layoutResultsp = showHeader2('      ', layoutResult60);
   
   final newPagepnj12w = document.pages.add();
  PdfLayoutResult layoutResultpageplkloq =
      showHeaderNewPage('  ', newPagepnj12w);
 */