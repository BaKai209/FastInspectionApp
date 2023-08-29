import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../constants/fonts.dart';
import '../constants/long_texts.dart';

class Page4 extends HookWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
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
                '4: Terms and Conditions',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              const Text(
                'PURPOSE OF INSPECTION',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              const Text(
                'The purpose of this inspection is to provide advice to the Client regarding the condition of the Building & Site at the time of inspection.',
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
              const Gap(20),
              const Text(
                'SCOPE OF INSPECTION',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                LongTexts.scope,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
              const Gap(20),
              const Text(
                'NOTE',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                LongTexts.note,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
              const Gap(20),
              const Text(
                'ACCEPTANCE CRITERIA',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                LongTexts.acceptance,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
              const Gap(20),
              const Text(
                'LIMITATIONS',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                LongTexts.limitations,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
              const Gap(20),
              const Text(
                'EXCLUSIONS',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                LongTexts.exclusions,
                style: const TextStyle(
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