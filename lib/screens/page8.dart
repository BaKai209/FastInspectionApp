import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../constants/fonts.dart';
import '../constants/long_texts.dart';

class Page8 extends HookWidget {
  const Page8({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        const Text(
          'Timber pest definitions to help you better understand this report:',
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
                'Timber Pest Attack” Timber Pest Activity and/or Timber Pest Damage.',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                LongTexts.pageText,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
              const Gap(10),
              const Text(
                'Terms on which this report was prepared:',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                LongTexts.termsText,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
              const Gap(10),
              const Text(
                'LIMITATIONS:',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                LongTexts.limitText,
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
              const Gap(20),
              const Text(
                'EXCLUSIONS:',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Text(
                LongTexts.exclusionText,
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
    );
  }
}
/* 
 layoutResult100 = showHeader(
      '',
      layoutResult100);
  layoutResult100 = showTextLarge(
    layoutResult100,''''''
  );
 */