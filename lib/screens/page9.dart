import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../constants/fonts.dart';

class Page9 extends HookWidget {
  const Page9({super.key});

  @override
  Widget build(BuildContext context) {
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        const Text(
          'Risk management options for timber pests',
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
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             /*  const Text(
                'Risk management options for timber pests',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              const Gap(10), */
              Text(
                '''To help protect against financial loss, it is essential that the building owner immediately control or rectify any evidence of destructive timber pest activity or damage identified in this Report.

The Client should further investigate any high-risk area where access was not gained. It is strongly advised that appropriate steps be taken to remove, rectify or monitor any evidence of conditions conducive to timber pest attack.

It is recommended that the client act on the following advice to further protect their investment against timber pest infestation:

Undertake thorough regular inspections at intervals not exceeding twelve months or more frequent inspections where the risk of timber pest attack is high or the building type is susceptible to attack. To further reduce the risk of subterranean termite attack, implement a management program in accordance with Australian Standard AS 3660.

This may include the installation of a monitoring and/or baiting system, or chemical and/or physical management system. However, AS 3660 stresses that subterranean termites can bridge or breach management systems and inspection zones and that thorough regular inspections of the building are necessary.

If the Client has any queries or concerns regarding this Report, or the Client requires further information on a risk management program, please do not hesitate to contact the person who carried out this Inspection. ''',
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: AppFonts.nunitoSansLight,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff515151)),
              ),
              Gap(10),
            ],
          ),
        ),
      ],
    );
  
  }
}