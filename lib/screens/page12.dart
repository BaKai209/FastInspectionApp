import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../constants/fonts.dart';

class Page12 extends HookWidget {
  const Page12({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        const Text(
          '9. Thermal Imaging Photography Report',
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
              Text(
                'Introduction: What is Thermal Imaging?',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: AppFonts.nunitoSansRegular,
                    fontWeight: FontWeight.w600),
              ),
              Gap(10),
              Text(
                '''Thermal imaging is the non-contact detection and measurement of temperature differences and the assignment of colours based on temperature.

 

Any object that has a temperature above absolute zero (-273°C) emits infrared radiation. Thermography is a technique that uses thermal imaging cameras to visually represent the infrared energy emitted from a surface, transforming infrared measurements to construct a radiometric image.

 

The thermal imaging services offered by Roscon Property Services are an effective and efficient way of testing, some advantages are listed below:

 

• Minimises the downtime and labour costs associated with the more traditional forms of testing.

• Detect anomalies often invisible to the naked eye and allow corrective action to be taken before costly

system failures occur.

• Infrared scans are non-intrusive eliminating lengthy downtime, causing loss in production to your business.

• Infrared thermography has become one of the most valuable diagnostic tools for predictive maintenance.

• Large areas can be scanned faster.

• Efficiently and accurately identify and target hot spots.

• Can assist in detecting areas of moisture or thermal inconsistencies.

• Energy efficiency.

 

How it works:

 

Thermal imaging does not "see" inside walls unlike an X-ray, CAT scan or MRI although you may have seen thermal images showing the framing inside walls.

 

This can be misleading as the darker lines of the frame are visible because the frame acts as a heat sink draining heat from the wall sheet and appearing as a dark spot.

 

The frame lines on the image are actually colder sections of wall sheeting as a result of the heat being drained away from the surface of the wall sheet and not the frame itself being "seen" through the sheet.

 

Thermal imaging simply provides a temperature reading across a surface, building up a picture from thousands of

temperature measurements in its field of view.

 

It's also useful in displaying patterns of moisture which evaporates and cools surrounding material.

 

Conversely, as termites maintain a constant temperature between 28 and 32 degrees

Celsius in their workings, if there are enough of them and the ambient temperature is cooler, termite activity presents as a hot spot.

 

Using thermal imaging is not a simple process and requires knowledge, skill, experience, and training.

 

The process must take into account the climate, the current weather, the structure's use and occupancy, the time of day,

the type of construction, heating and air conditioning, plumbing, wiring, construction materials, surface finish, and even colour.

 

Other supporting technology includes Moisture Meters and Bore scope.

 

Heat:

 

To fully understand infrared thermography, its applications, qualities and limitations, it is necessary to be familiar with the laws of physics that govern heat, heat transfer and the principles of infrared radiation. Heat is the transfer of energy from one material or substance to another.

 

Heat is energy in transit; it always flows from the material at a higher temperature to that at a lower temperature until thermal equilibrium is reached.

 

Heat may be transferred from one

object or place to another by three modes; conduction, convection and radiation. It is the radiation mode that infrared thermography can detect.

 

There are several basic factors that affect the accuracy of measurements using this technique and must all be taken into consideration for reproducible results. They are: surface emissivity, reflected temperature

and ambient temperature.

 

Temperature:

 

Temperature is arguably the most widely measured physical parameter in science and engineering and is a reliable

indicator of an objects condition.

 

Infrared cameras:

 

Characteristics of Infrared Thermography Camera

 

• It captures as a temperature distribution on a surface, and it can display as visible information.

• Temperature can be measured from a distance without contacting an object.

• Temperature can be measured in real time.

Merits of Infrared Thermography Camera

• Relative comparison of distribution of surface temperature can be made over a wide area.

• Temperature can be measured easily for a moving object or an object which is dangerous to get close to.

• Temperature of small object can be measured without confusing the temperature.

• Temperature of food, medicine or chemicals can be measured in a sanitary fashion.

• Temperature of an object with drastic temperature change or a phenomenon during a short period of time can be

measured.

 

Applications:

 

• Moisture inspection

• Heat or cooling loss

• Water/ Steam leaks

• Construction quality

• Electrical installation

• Repair validation

• Termites and pests

• Electrical power distribution systems: Three-phase systems, distribution panels, fuses, wiring and connections,

substations, electrical vaults

• Electro-mechanical equipment: Motors, pumps, fans, compressors, bearings, windings, gear boxes, and conveyors

• Process instrumentation: Process control equipment, pipes, valves, steam traps and tanks/vessels

• Facility maintenance: HVAC systems, buildings, roofs, insulation

  

Limitations:

 

• Building construction materials can inhibit the use of the thermal imaging camera.

• Thermal imaging cameras do not see through walls & cannot determine the extent of any structural damage. It

basically only detects the surface temperature of whatever is being scanned.

• Images can be difficult to interpret accurately when based upon certain objects, specifically objects with erratic

temperatures, although this problem is reduced in active thermal imaging.

• Accurate temperature measurements are hindered by differing emissivity’s and reflections from other surfaces.

• Most cameras have ±2% accuracy or worse in measurement of temperature and are not as accurate as contact methods

• Only able to directly detect surface temperatures.

• Condition of work, depending of the case, can be drastic: 10°C of difference between internal/external, 10km/h of wind maximum, no direct sun, and no recent rain.

 

Inspection method/criteria:

 

Thermal intrusion testing is normally done by performing thermal imaging of the envelope components.

 

When using a thermal imaging camera to find missing insulation or energy losses, the difference in temperature between the inside of the building and the outside should be preferably at least 10 °C.

 

These images will indicate areas of excess thermal intrusion in wall or roof areas and can indicate the presence of thermal bridging of structural elements and also the presence of air leaks when the building is under testing pressure.

 

Any thermographic survey can show differences in apparent temperature of areas within the field of view.

 

To be useful, a thermographic survey must systematically detect all the apparent defects and assess them against criteria agreed

between Inner West Property Inspections and the client. It must reliably discount those anomalies that are not real defects, evaluate those that are real defects and report the results to the client.

 

On that count, the process generally consists of the following key steps.

 

• Step-1 Selecting the critical temperature parameter

 

• Step-2 Selecting maximum acceptable defect area

 

• Step-3 Measuring surface temperature difference caused by the defect

 

• Step-4 Measuring area of the defects

 

Thermal anomalies will only present themselves to the thermographer where temperature differences exist and

environmental phenomena are accounted for.

 

Generally, the below mentioned parameters may be considered as recommended prerequisite for the environmental conditions before proceeding with the thermal imaging for building.

 

• Temperature difference across the building fabric to be greater than 10°C.

• Internal air to ambient air temperature difference to be greater than 5°C for the last twenty four hours before

• External air temperature to be within +/- 3°C for duration of survey and for the previous hour External air

temperature to be within +/- 10°C for the preceding twenty-four hours.

• In addition, external surveys should also comply with the following

• Necessary surfaces free from direct solar radiation for at least one hour prior to survey. No precipitation either

just prior to or during the survey.

• Ensure that all building surfaces to be inspected are dry.

• Wind speed to be less than 10 metres / second during the operation.

 

Besides temperature, there are other environmental conditions that should be duly taken cognizance of when planning

a thermographic building survey.

 

External inspections for example, may be influenced by radiation emissions and reflections from adjacent buildings or a cold clear sky.

 

Sun may also have a significant influence on surface.

 

Additionally, where background temperatures differ from air temperatures either internally or externally by more than 5K, then background temperatures should be measured on all effected surfaces to allow surface temperature to be compared.''',
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
