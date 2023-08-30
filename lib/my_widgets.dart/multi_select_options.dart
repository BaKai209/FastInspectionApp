import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultiSelectOptions extends StatefulWidget {
  final List<String> optionList;
  final String prefKey;
  const MultiSelectOptions(
      {required this.optionList, required this.prefKey, super.key});

  @override
  State<MultiSelectOptions> createState() => _MultiSelectOptionsState();
}

class _MultiSelectOptionsState extends State<MultiSelectOptions> {
  List<String> selectedOptions = [];
  bool opened = false;

  @override
  void initState() {
    super.initState();
    onLoadPref();
  }

  onLoadPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedOptions = prefs.getStringList(widget.prefKey) ?? [];
  }

  onUpdatePref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(widget.prefKey, selectedOptions);
  }

  List<Widget> getOptionWidget() {
    List<Widget> array = [];
    for (int i = 0; i < widget.optionList.length; i++) {
      array.add(Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          children: [
            Checkbox(
                value: selectedOptions.contains(widget.optionList[i]),
                onChanged: (value) {
                  if (value != null && value) {
                    selectedOptions.add(widget.optionList[i]);
                  } else {
                    selectedOptions.remove(widget.optionList[i]);
                  }
                  setState(() {});
                  onUpdatePref();
                }),
            Expanded(
                child: InkWell(
                    onTap: () {
                      if (selectedOptions.contains(widget.optionList[i])) {
                        selectedOptions.remove(widget.optionList[i]);
                      } else {
                        selectedOptions.add(widget.optionList[i]);
                      }
                      setState(() {});
                      onUpdatePref();
                    },
                    child: Text(widget.optionList[i]))),
          ],
        ),
      ));
    }
    return array;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
          color: const Color(0xff96C8A2).withOpacity(0.5),
          borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () {
          setState(() {
            opened = !opened;
          });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  if (selectedOptions.isNotEmpty && !opened)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(selectedOptions.join(", ")),
                    ),
                  if (opened) ...getOptionWidget(),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Icon(opened ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
