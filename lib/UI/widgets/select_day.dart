import 'package:flutter/widgets.dart';
import 'package:weekday_selector/weekday_selector.dart';

class WeekDaySelector extends StatefulWidget {
  const WeekDaySelector({Key? key}) : super(key: key);

  @override
  _WeekDaySelectorState createState() => _WeekDaySelectorState();
}

class _WeekDaySelectorState extends State<WeekDaySelector> {
  // final values = List.filled(7, true);
  final values = List.generate(7, (index) => index == 1 || index == 6);

  @override
  Widget build(BuildContext context) {
    return WeekdaySelector(
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
          values[index] = !values[index];
        });
      },
      values: values,
    );
  }
}
