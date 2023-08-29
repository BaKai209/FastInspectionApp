import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:nb_utils/nb_utils.dart';

import '../constants/colors.dart';
import '../constants/constant_values.dart';
import '../constants/fonts.dart';
import 'home_screen.dart';

class Page2 extends HookWidget {
  Page2({super.key});

  List<String> noRooms = [
    '1',
    '2',
    '3',
    '4',
    '5 or more',
  ];

  List<String> faces2 = ['N', 'S', 'E', 'W', 'SE', 'SW', 'NE', 'NW'];
  List<String> propertyType = [
    'Free Standing house',
    'Unit',
    'Terrace',
    'Semi/Duplex',
    'Townhouse',
    'Other'
  ];

  List<String> occupancy = [
    'Occupied and furnished',
    'Unoccupied and furnished',
    'Unoccupied and unfurnished',
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

  @override
  Widget build(BuildContext context) {
    final character = useState<SingingCharacter>(SingingCharacter.values.byName(
      getStringAsync(k2PDTypePropertyStrata,
          defaultValue: SingingCharacter.yes.name),
    ));
    // final character2 = useState<SingingCharacter>(SingingCharacter.yes);
    // final active = useState<EvidenceActive>(EvidenceActive.yes);
    final age = useState(getStringAsync(k2PDAge, defaultValue: '0'));
    final livingrooms =
        useState(getStringAsync(k2ONolivingroom, defaultValue: '1'));
    final kitchens = useState(getStringAsync(k2ONoKitchen, defaultValue: '1'));
    final bathrooms =
        useState(getStringAsync(k2ONobathroom, defaultValue: '1'));
    final toilets = useState(getStringAsync(k2ONotoilet, defaultValue: '1'));
    final laundries =
        useState(getStringAsync(k2ONolaundries, defaultValue: '1'));
    final bedrooms = useState(getStringAsync(k2ONoBedroom, defaultValue: '1'));
    final facadeFace =
        useState(getStringAsync(k2PDPropertyFacadeF, defaultValue: 'N'));
    print(facadeFace.value);
    final typeProperty = useState(
        getStringAsync(k2PDTypeProperty, defaultValue: 'Free Standing house'));
    final occupancyStatus = useState(getStringAsync(k2Occupation_status,
        defaultValue: 'Occupied and furnished'));
    final brick =
        useState(getBoolAsync(k2OWallConstructionBrick, defaultValue: false));
    final full = useState(
        getBoolAsync(k2OWallConstructionFullBrick, defaultValue: false));
    final frame =
        useState(getBoolAsync(k2OWallConstructionTimber, defaultValue: false));
    final clad =
        useState(getBoolAsync(k2OWallConstructionClad, defaultValue: false));
    final sheet =
        useState(getBoolAsync(k2OWallConstructionSheet, defaultValue: false));
    final combination1 = useState(
        getBoolAsync(k2OWallConstructionCombination, defaultValue: false));
    final metal1 =
        useState(getBoolAsync(k2ORoofConstructionMetal, defaultValue: false));
    final concrete = useState(
        getBoolAsync(k2ORoofConstructionConcrete, defaultValue: false));
    final asbestos = useState(
        getBoolAsync(k2ORoofConstructionAsbestos, defaultValue: false));
    final tarracota = useState(
        getBoolAsync(k2ORoofConstructionTerracotta, defaultValue: false));
    final flat =
        useState(getBoolAsync(k2ORoofConstructionFlat, defaultValue: false));
    final pitched =
        useState(getBoolAsync(k2ORoofConstructionPitched, defaultValue: false));
    final combination2 = useState(
        getBoolAsync(k2ORoofConstructionCombination, defaultValue: false));
    final other1 =
        useState(getBoolAsync(k2ORoofConstructionOther, defaultValue: false));

    final timber = useState(
        getBoolAsync(k2OfloorConstructionTimberBrick, defaultValue: false));
    final sandstone = useState(
        getBoolAsync(k2OfloorConstructionTimberSand, defaultValue: false));
    final concrete2 = useState(
        getBoolAsync(k2OfloorConstructionConcrete, defaultValue: false));
    final combination3 = useState(
        getBoolAsync(k2OfloorConstructionCombination, defaultValue: false));
    final other2 =
        useState(getBoolAsync(k2OfloorConstructionOther, defaultValue: false));

    final firstnameController = useTextEditingController(
        text: getStringAsync(k2CDFirstName, defaultValue: ''));
    final lastNameController = useTextEditingController(
        text: getStringAsync(k2CDLastName, defaultValue: ''));
    final clientAddress1Controller = useTextEditingController(
        text: getStringAsync(k2CDAddressLine1, defaultValue: ''));
    final clientAddress2Controller = useTextEditingController(
        text: getStringAsync(k2CDAddressLine2, defaultValue: ''));
    final stateController = useTextEditingController(
        text: getStringAsync(k2CDState, defaultValue: ''));
    final postalController = useTextEditingController(
        text: getStringAsync(k2CDPostal, defaultValue: ''));
    final phoneController = useTextEditingController(
        text: getStringAsync(k2CDPhone, defaultValue: ''));
    final emailController = useTextEditingController(
        text: getStringAsync(k2CDEmail, defaultValue: ''));
    final ageController = useTextEditingController(
        text: getStringAsync(k2PDAge, defaultValue: ''));
    final clientCityController = useTextEditingController(
        text: getStringAsync(k2CDCity, defaultValue: ''));
            final noteController = useTextEditingController(
        text: getStringAsync(k2ONoNote, defaultValue: ''));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: double.maxFinite,
      color: const Color(0xff39A78E).withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          const Text(
            '1: Client Details',
            style: TextStyle(
                fontSize: 16,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          const Text(
            'Client name',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              controller: firstnameController,
              keyboardType: TextInputType.name,
              //controller: _firstName,
              //textInputAction: TextInputType.emailAddress,
              cursorWidth: 0.5,
              cursorColor: AppColors.primaryColor.withOpacity(0.1),
              onChanged: (value) {
                setValue(k2CDFirstName, value);
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
                hintText: 'First Name',
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
          const Gap(10),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              controller: lastNameController,
              keyboardType: TextInputType.name,
              //controller: _firstName,
              //textInputAction: TextInputType.emailAddress,
              cursorWidth: 0.5,
              cursorColor: AppColors.primaryColor.withOpacity(0.1),

              onChanged: (value) {
                setValue(k2CDLastName, value);
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
                hintText: 'Last Name',
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
          const Gap(20),
          const Text(
            'Client Address',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              controller: clientAddress1Controller,
              keyboardType: TextInputType.name,
              //controller: _firstName,
              //textInputAction: TextInputType.emailAddress,
              cursorWidth: 0.5,
              cursorColor: AppColors.primaryColor.withOpacity(0.1),
              onChanged: (value) {
                setValue(k2CDAddressLine1, value);
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
          const Gap(10),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              controller: clientAddress2Controller,
              keyboardType: TextInputType.name,
              //controller: _firstName,
              //textInputAction: TextInputType.emailAddress,
              cursorWidth: 0.5,
              cursorColor: AppColors.primaryColor.withOpacity(0.1),
              onChanged: (value) {
                setValue(k2CDAddressLine2, value);
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
                hintText: 'Address Line 2',
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
          const Gap(10),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              controller: clientCityController,
              keyboardType: TextInputType.name,
              //controller: _firstName,
              //textInputAction: TextInputType.emailAddress,
              cursorWidth: 0.5,
              cursorColor: AppColors.primaryColor.withOpacity(0.1),
              onChanged: (value) {
                setValue(k2CDCity, value);
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
          const Gap(10),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              controller: stateController,
              keyboardType: TextInputType.name,
              //controller: _firstName,
              //textInputAction: TextInputType.emailAddress,
              cursorWidth: 0.5,
              cursorColor: AppColors.primaryColor.withOpacity(0.1),
              onChanged: (value) {
                setValue(k2CDState, value);
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
          const Gap(10),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              controller: postalController,
              keyboardType: TextInputType.name,
              //controller: _firstName,
              //textInputAction: TextInputType.emailAddress,
              cursorWidth: 0.5,
              cursorColor: AppColors.primaryColor.withOpacity(0.1),
              onChanged: (value) {
                setValue(k2CDPostal, value);
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
          const Gap(20),
          const Text(
            'Client Phone',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.name,
              //controller: _firstName,
              //textInputAction: TextInputType.emailAddress,
              cursorWidth: 0.5,
              cursorColor: AppColors.primaryColor.withOpacity(0.1),
              onChanged: (value) {
                setValue(k2CDPhone, value);
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
                hintText: 'Phone',
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
          const Gap(20),
          const Text(
            'Client Email',
            style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.nunitoSansRegular,
                fontWeight: FontWeight.w700),
          ),
          const Gap(10),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.name,
              //controller: _firstName,
              //textInputAction: TextInputType.emailAddress,
              cursorWidth: 0.5,
              cursorColor: AppColors.primaryColor.withOpacity(0.1),
              onChanged: (value) {
                setValue(k2CDEmail, value);
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
                hintText: 'Email',
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
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
                  '1: Property Details',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.nunitoSansRegular,
                      fontWeight: FontWeight.w700),
                ),
                const Gap(10),
                const Text(
                  'Approx age of property - years',
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
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    //controller: _firstName,
                    //textInputAction: TextInputType.emailAddress,
                    cursorWidth: 0.5,
                    cursorColor: AppColors.primaryColor.withOpacity(0.1),
                    onChanged: (value) {
                      setValue(k2PDAge, value);
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
                      hintText: 'Age',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                ),

                /*  Container(
            width: 150,
            decoration: BoxDecoration(
                color: const Color(0xff96C8A2).withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (age.value != 0) {
                      age.value--;
                    } else {
                      age.value = 0;
                    }
                    setValue(k2PDAge, age.value);
                    /* setState(() {
                      if (age != 0) {
                        age--;
                      } else {
                        age = 0;
                      }
                    }); */
                  },
                  child: Container(
                    width: 40,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 15),
                      child: Center(
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontFamily: AppFonts.nunitoSansRegular,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                      //color: AppColors.primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          width: 0.5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 9.0, horizontal: 15),
                    child: Center(
                      child: Text(
                        '${age.value}',
                        style: const TextStyle(
                            fontFamily: AppFonts.nunitoSansRegular,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    age.value++;
                    setValue(k2PDAge, age.value);
                    /*  setState(() {
                      age++;
                    }); */
                  },
                  child: Container(
                    width: 40,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 15),
                      child: Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                              fontFamily: AppFonts.nunitoSansRegular,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          */
                const Gap(10),
                const Text(
                  'Property facade faces',
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
                    value: facadeFace.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                    dropdownColor: Colors.white,
                    elevation: 16,
                    isExpanded: true,
                    hint: const Text(
                      'Select Property faces',
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
                      facadeFace.value = value!;
                      print(value);

                      setValue(k2PDPropertyFacadeF, value);
                      /*  setState(() {
                  facadeFace = value;
                }); */
                    },
                    items: faces2.map<DropdownMenuItem<String>>((value) {
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
                const Gap(10),
                const Text(
                  'Type of Property',
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
                    value: typeProperty.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                    dropdownColor: Colors.white,
                    elevation: 16,
                    isExpanded: true,
                    hint: const Text(
                      'Select Property Type',
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
                      typeProperty.value = value!;
                      setValue(k2PDTypeProperty, value);
                      /*   setState(() {
                  typeProperty = value;
                }); */
                    },
                    items: propertyType.map<DropdownMenuItem<String>>((value) {
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
                const Gap(10),
                const Text(
                  'Is the property strata or company title? (if the property is under strata or company title only the unit and the '
                  'immediate surrounds were inspected. No inspection of common areas was carried out)',
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
                        groupValue: character.value,
                        onChanged: (SingingCharacter? value) {
                          character.value = value!;
                          setValue(k2PDTypePropertyStrata, 'yes');
                          /* setState(() {
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
                        groupValue: character.value,
                        onChanged: (SingingCharacter? value) {
                          character.value = value!;
                          setValue(k2PDTypePropertyStrata, 'no');
                          /*  setState(() {
                      _character = value;
                    }); */
                        },
                      ),
                    ),
                  ],
                ),
                const Gap(10),
                const Text(
                  'Occupancy Status',
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
                    value: occupancyStatus.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                    dropdownColor: Colors.white,
                    elevation: 16,
                    isExpanded: true,
                    hint: const Text(
                      'Select Occupancy Status',
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
                      occupancyStatus.value = value!;
                      setValue(k2Occupation_status, value);
                      /*  setState(() {
                  occupancyStatus = value;
                }); */
                    },
                    items: occupancy.map<DropdownMenuItem<String>>((value) {
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
                  'Wall construction',
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
                            'Brick veneer',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: brick.value,
                          onChanged: (value) {
                            brick.value = value!;
                            setValue(k2OWallConstructionBrick, value);
                            /*  setState(() {
                        brick = value!;
                      }); */
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Full brick',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: full.value,
                          onChanged: (value) {
                            full.value = value!;
                            setValue(k2OWallConstructionFullBrick, value);
                            /*  setState(() {
                        full = value!;
                      }); */
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Timber frame',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: frame.value,
                          onChanged: (value) {
                            frame.value = value!;
                            setValue(k2OWallConstructionTimber, value);
                            /* setState(() {
                        frame = value!;
                      }); */
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Clad',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: clad.value,
                          onChanged: (value) {
                            clad.value = value!;
                            setValue(k2OWallConstructionClad, value);
                            /*  setState(() {
                        clad = value!;
                      }); */
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Sheet',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: sheet.value,
                          onChanged: (value) {
                            sheet.value = value!;
                            setValue(k2OWallConstructionSheet, value);
                            /* setState(() {
                        sheet = value!;
                      }); */
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Combination',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: combination1.value,
                          onChanged: (value) {
                            combination1.value = value!;
                            setValue(k2OWallConstructionCombination, value);
                            /*  setState(() {
                        combination = value!;
                      }); */
                          }),
                    ],
                  ),
                ),
                const Gap(20),
                const Text(
                  'Roof construction',
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
                            'Metal corrugated',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: metal1.value,
                          onChanged: (value) {
                            metal1.value = value!;
                            setValue(k2ORoofConstructionMetal, value);
                            /*  setState(() {
                        meal = value!;
                      }); */
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Concrete tile',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: concrete.value,
                          onChanged: (value) {
                            concrete.value = value!;
                            setValue(k2ORoofConstructionConcrete, value);
                            /* setState(() {
                        concrete = value!;
                      }); */
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Asbestos',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: asbestos.value,
                          onChanged: (value) {
                            asbestos.value = value!;
                            setValue(k2ORoofConstructionAsbestos, value);
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Terracotta tile',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: tarracota.value,
                          onChanged: (value) {
                            tarracota.value = value!;
                            setValue(k2ORoofConstructionTerracotta, value);
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Flat',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: flat.value,
                          onChanged: (value) {
                            flat.value = value!;
                            setValue(k2ORoofConstructionFlat, value);
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Pitched',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: pitched.value,
                          onChanged: (value) {
                            pitched.value = value!;
                            setValue(k2ORoofConstructionPitched, value);
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Combination',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: combination2.value,
                          onChanged: (value) {
                            combination2.value = value!;
                            setValue(k2ORoofConstructionCombination, value);
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Other',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: other1.value,
                          onChanged: (value) {
                            other1.value = value!;
                            setValue(k2ORoofConstructionOther, value);
                          }),
                    ],
                  ),
                ),
                const Gap(20),
                const Text(
                  'Floor construction',
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
                            'Timber on brick piers',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: timber.value,
                          onChanged: (value) {
                            timber.value = value!;
                            setValue(k2OfloorConstructionTimberBrick, value);
                            /*  setState(() {
                        timber = value!;
                      }); */
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Timber on sandstone piers',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: sandstone.value,
                          onChanged: (value) {
                            sandstone.value = value!;
                            setValue(k2OfloorConstructionTimberSand, value);
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Concrete Slab',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: concrete2.value,
                          onChanged: (value) {
                            concrete2.value = value!;
                            setValue(k2OfloorConstructionConcrete, value);
                            // setValue(k2OfloorConstruction, 'Concrete Slab');
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Combination',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: combination3.value,
                          onChanged: (value) {
                            combination3.value = value!;
                            setValue(k2OfloorConstructionCombination, value);
                          }),
                      CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            'Other',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppFonts.nunitoSansRegular,
                                color: Colors.grey),
                          ),
                          value: other2.value,
                          onChanged: (value) {
                            other2.value = value!;
                            setValue(k2OfloorConstructionOther, value);
                          }),
                    ],
                  ),
                ),
                const Gap(20),
                const Text(
                  'No of bedrooms',
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
                    value: bedrooms.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                    dropdownColor: Colors.white,
                    elevation: 16,
                    isExpanded: true,
                    hint: const Text(
                      '1',
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
                      bedrooms.value = value!;
                      setValue(k2ONoBedroom, value);
                      /*  setState(() {
                  bedrooms = value;
                }); */
                    },
                    items: noRooms.map<DropdownMenuItem<String>>((value) {
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
                const Gap(10),
                const Gap(20),
                const Text(
                  'No of living rooms',
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
                    value: livingrooms.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                    dropdownColor: Colors.white,
                    elevation: 16,
                    isExpanded: true,
                    hint: const Text(
                      '1',
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
                      livingrooms.value = value!;
                      setValue(k2ONolivingroom, value);
                      /*  setState(() {
                  livingrooms = value;
                }); */
                    },
                    items: noRooms.map<DropdownMenuItem<String>>((value) {
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
                const Gap(10),
                const Gap(20),
                const Text(
                  'No of kitchens',
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
                    value: kitchens.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                    dropdownColor: Colors.white,
                    elevation: 16,
                    isExpanded: true,
                    hint: const Text(
                      '1',
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
                      kitchens.value = value!;
                      setValue(k2ONoKitchen, value);
                      /*  setState(() {
                  kitchens = value;
                }); */
                    },
                    items: noRooms.map<DropdownMenuItem<String>>((value) {
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
                const Gap(10),
                const Gap(20),
                const Text(
                  'No of bathrooms',
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
                    value: bathrooms.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                    dropdownColor: Colors.white,
                    elevation: 16,
                    isExpanded: true,
                    hint: const Text(
                      '1',
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
                      bathrooms.value = value!;
                      setValue(k2ONobathroom, value);
                      /*  setState(() {
                  bathrooms = value;
                }); */
                    },
                    items: noRooms.map<DropdownMenuItem<String>>((value) {
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
                const Gap(10),
                const Gap(20),
                const Text(
                  'No of toilets',
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
                    value: toilets.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                    dropdownColor: Colors.white,
                    elevation: 16,
                    isExpanded: true,
                    hint: const Text(
                      '1',
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
                      toilets.value = value!;
                      setValue(k2ONotoilet, value);
                      /*  setState(() {
                  toilets = value;
                }); */
                    },
                    items: noRooms.map<DropdownMenuItem<String>>((value) {
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
                const Gap(10),
                const Gap(20),
                const Text(
                  'No of laundries',
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
                    value: laundries.value,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    //SvgPicture.asset(AppAsset.arrowDown, color: const Color(0xff000000),),
                    dropdownColor: Colors.white,
                    elevation: 16,
                    isExpanded: true,
                    hint: const Text(
                      '1',
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
                      laundries.value = value!;
                      setValue(k2ONolaundries, value);
                      /*   setState(() {
                  laundries = value;
                }); */
                    },
                    items: noRooms.map<DropdownMenuItem<String>>((value) {
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
                      setValue(k2ONoNote, value);
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
      ),
    );
  }
}
