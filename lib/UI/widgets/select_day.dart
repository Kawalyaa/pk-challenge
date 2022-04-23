import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pavlok_challenge/model/time_reminder.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'package:provider/provider.dart';

class PickDay extends StatefulWidget {
  const PickDay({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PickDayState();
}

class _PickDayState extends State<PickDay> {
  List<String> values = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  List<bool> picked = List.generate(7, (index) => index < 2);

  pickDay(index) {
    setState(() {
      picked[index] = !picked[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CustomElevation(
          text: 'M',
        )
        // _buildAction(context, 0),
        // _buildAction(context, 1),
        // _buildAction(context, 2),
        // _buildAction(context, 3),
        // _buildAction(context, 4),
        // _buildAction(context, 5),
        // _buildAction(context, 6),
      ],
    );
  }

  Widget _buildAction(context, index) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      child: NeumorphicButton(
        onPressed: () => pickDay(index),
        child: Text(
          values[index],
          style: Theme.of(context).textTheme.headline2?.copyWith(
              fontSize: 16.0,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              color: picked[index] ? Colors.white : Colors.black),
        ),
        style: NeumorphicStyle(
          shape: NeumorphicShape.convex,
          boxShape: const NeumorphicBoxShape.circle(),
          depth: 0,
          intensity: .25,
          color:
              picked[index] ? const Color(0xFF8338EC) : const Color(0xffF6F7FB),
        ),
      ),
    );
  }
}

class CustomElevation extends StatelessWidget {
  final String text;

  const CustomElevation({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 18.5, right: 18.5, top: 15, bottom: 15),
            child: Text(
              text,
              style:
                  Theme.of(context).textTheme.headline5?.copyWith(fontSize: 16),
            ),
          )),
    );
  }
}

// class ExampleState extends State<ExampleWidget> {
//   // We start with all days selected.
//   final values = List.filled(7, true);
//
//   @override
//   Widget build(BuildContext context) {
//     return WeekdaySelector(
//       onChanged: (int day) {
//         setState(() {
//           // Use module % 7 as Sunday's index in the array is 0 and
//           // DateTime.sunday constant integer value is 7.
//           final index = day % 7;
//           // We "flip" the value in this example, but you may also
//           // perform validation, a DB write, an HTTP call or anything
//           // else before you actually flip the value,
//           // it's up to your app's needs.
//           values[index] = !values[index];
//         });
//       },
//       values: values,
//     );
//   }
// }

class WeekDaySelector extends StatefulWidget {
  const WeekDaySelector({Key? key}) : super(key: key);

  @override
  _WeekDaySelectorState createState() => _WeekDaySelectorState();
}

class _WeekDaySelectorState extends State<WeekDaySelector> {
  final values = List.filled(7, true);
  final values1 = List.generate(7, (index) => index == 1 || index == 6);

  @override
  Widget build(BuildContext context) {
    return WeekdaySelector(
      selectedTextStyle: const TextStyle(color: Colors.white),
      selectedFillColor: const Color(0xFF8338EC),
      disabledFillColor: const Color(0xffF6F7FB),
      onChanged: (int day) {
        setState(() {
          // Use module % 7 as Sunday's index in the array is 0 and
          // DateTime.sunday constant integer value is 7.
          final index = day % 7;

          // We "flip" the value in this example, but you may also
          // perform validation, a DB write, an HTTP call or anything
          // else before you actually flip the value,
          // it's up to your app's needs.
          values1[index] = !values1[index];
        });
      },
      values: values1,
    );
  }
}

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
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                    width: double.infinity,
                  ),
                  Container(
                    width: 30,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[400]),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Text(
                    'Reminder',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontSize: 23),
                  ),
                  const SizedBox(
                    height: 66,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
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
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: text('min'),
                      )
                    ],
                  ),
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
