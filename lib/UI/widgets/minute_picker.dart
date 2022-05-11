import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pavlok_challenge/UI/widgets/pav_button.dart';
import 'package:provider/provider.dart';

import '../../model/time_reminder.dart';

class MinutesPicker extends StatelessWidget {
  const MinutesPicker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var timeManager = Provider.of<TimeReminder>(context);
    return Stack(
      children: [
        Container(
          height: 437,
          decoration: BoxDecoration(color: Colors.grey[600]),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            height: 437,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // const SizedBox(
                  //   height: 1,
                  //   width: double.infinity,
                  // ),
                  Container(
                    width: 30,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[400]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Reminder',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontSize: 23),
                  ),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 170,
                        width: 100,
                        child: NumberPicker(
                          itemCount: 4,
                          selectedTextStyle: const TextStyle(
                              color: Colors.black, fontSize: 30),
                          textStyle: const TextStyle(
                              color: Colors.black54, fontSize: 22),
                          value: timeManager.pickedTime,
                          maxValue: 50,
                          minValue: 10,
                          onChanged: (value) {
                            timeManager.getTime(value);
                            // setState(() {
                            //   min = value;
                            // });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: text('min'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: PavButton(
                      text: 'Done',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Text text(String text) => Text(
        text,
        style: const TextStyle(fontSize: 30, color: Colors.black87),
      );
}
