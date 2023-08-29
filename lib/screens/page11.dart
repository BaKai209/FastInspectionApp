import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';

import '../constants/colors.dart';
import '../constants/constant_values.dart';
import '../constants/fonts.dart';
import '../constants/long_texts.dart';
import '../controller/page10_controller.dart';
import '../models/my_points.dart';

class Page11 extends HookConsumerWidget {
  Page11({super.key});
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<Uint8List> testCompressFile(Uint8List file) async {
      var result = await FlutterImageCompress.compressWithList(
        file,
        minWidth: 200,
        minHeight: 200,
        format: CompressFormat.png,
        quality: 50,
      );
      //  print(file!.lengthSync());
      print(result.length);
      return result;
    }

    Future<String?> selectDate(BuildContext context) async {
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

    final isLoading = useState(false);

    final dateController = useTextEditingController(
        text: getStringAsync(k10Date, defaultValue: ''));
    SignatureController controller = SignatureController(
      points: ref.read(pointProvider.notifier).state,
      penStrokeWidth: 3,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );

    //ScreenshotController screenshotController = ScreenshotController();

    /*  useEffect(() {
      print('jagunnnn dd');
      controller = SignatureController(
        
        penStrokeWidth: 5,
        penColor: Colors.black,
        exportBackgroundColor: Colors.white,
      );
      return null;
    }); */

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        const Text(
          '10. Conclusion',
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
              Text(
                LongTexts.conclusionPage,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
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
                  controller: dateController,
                  readOnly: true,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.nunitoSansLight,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  cursorColor: Colors.grey,
                  onChanged: (value) {
                    setValue(k10Date, value);
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
                        String? date = await selectDate(context);
                        date != null ? dateController.text = date : '';
                        setValue(k10Date, date);
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
                'Signature',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Signature(
                controller: controller,
                width: 200,
                height: 200,
                backgroundColor: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10),
                        child: GestureDetector(
                          onTap: () async {
                            if (controller.isNotEmpty) {
                              Uint8List? imageInUnit8List =
                                  await controller.toPngBytes();
                              /*  final newUnit =
                                  await testCompressFile(imageInUnit8List!);
 */
                              ref.read(pointProvider.notifier).state =
                                  controller.points;
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              final directory =
                                  await getApplicationDocumentsDirectory();
                              final imagePath =
                                  await File('${directory.path}/image.png')
                                      .create();
                              await imagePath.writeAsBytes(imageInUnit8List!);

                              /*  Uint8List? imageInUnit8List678 =
                                  await controller.toPngBytes(); */

                              /* final tempDir = await getTemporaryDirectory();
                              File file = await File(
                                      '${tempDir.path}/image${TimeOfDay.now()}.png')
                                  .create();
                              file.writeAsBytesSync(imageInUnit8List!); */
                              /*  final directory =
                                  (await getApplicationDocumentsDirectory())
                                      .path; //from path_provide package
                              String fileName =
                                  DateTime.now().toIso8601String();
                              String path = directory;
                              String? origpath =
                                  await screenshotController.captureAndSave(
                                      path, //set path where screenshot will be saved
                                      fileName: fileName); */
                              setValue('sigImage', imagePath.absolute.path);

                              List<Point> exportedPoints = controller.points;
                              List<MyPoint> listMy = [];
                              for (Point point in exportedPoints) {
                                var newPoint = MyPoint(
                                    offsetx: point.offset.dx,
                                    offsety: point.offset.dy,
                                    type: point.type,
                                    pressure: point.pressure);
                                listMy.add(newPoint);
                              }
                              String encodedData = MyPoint.encode(listMy);

                              await prefs.setString('signature', encodedData);
                              print('ppp here');
                              // isLoading.value = false;
                              snackBar(context,
                                  title: 'Signature saved',
                                  backgroundColor: Colors.green);
                            } else {
                              snackBar(context,
                                  title: 'please sign your signature',
                                  backgroundColor: Colors.red);
                            }
                          },
                          child: isLoading.value
                              ? const SizedBox(
                                  child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                              : const Text(
                                  'Accept',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppFonts.nunitoSansRegular,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10),
                        child: GestureDetector(
                          onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            setValue('sigImage', '');

                            await prefs.setString('signature', jsonEncode([]));
                            ref.read(pointProvider.notifier).state = [];
                            controller.clear();
                          },
                          child: const Text(
                            'Clear',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFonts.nunitoSansRegular,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              /*  Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  //controller: dateController,
                  maxLines: 4,
                  keyboardType: TextInputType.name,
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
                    hintText: '',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                  ),
                ),
              ),
            */
            ],
          ),
        ),
      ],
    );
  }
}
