import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pavlok_challenge/UI/widgets/pav_button.dart';
import 'package:pavlok_challenge/model/time_reminder.dart';
import 'package:provider/provider.dart';

import 'package:time_range_picker/time_range_picker.dart';

import '../widgets/clock_painter.dart';
import '../widgets/minute_picker.dart';
import '../widgets/select_day.dart';
import 'package:numberpicker/numberpicker.dart';

class SleepOnboarding extends StatefulWidget {
  const SleepOnboarding({Key? key}) : super(key: key);

  @override
  _SleepOnboardingState createState() => _SleepOnboardingState();
}

class _SleepOnboardingState extends State<SleepOnboarding> {
  final TimeOfDay _disabledStartTime = const TimeOfDay(hour: 11, minute: 01);
  final TimeOfDay __disabledEndTime = const TimeOfDay(hour: 23, minute: 59);
  final TimeOfDay _startTime = const TimeOfDay(hour: 00, minute: 00);
  final TimeOfDay _sleepGaol = const TimeOfDay(hour: 08, minute: 00);
  var _selectedTime = const TimeOfDay(hour: 06, minute: 00);

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<TimeReminder>(context);
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Text(
                  'Set bedtime and wakeup',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24),
                      child: TimeRangePicker(
                        autoAdjustLabels: false,
                        minDuration: const Duration(hours: 5),
                        onEndChange: (value) {
                          setState(() {
                            _selectedTime = value;
                          });
                        },
                        backgroundColor: Colors.grey[300],
                        disabledColor: Colors.grey[300],
                        disabledTime: TimeRange(
                            startTime: _disabledStartTime,
                            endTime: __disabledEndTime),
                        hideTimes: true,
                        clockRotation: 180,
                        start: _startTime,
                        end: _selectedTime,
                        use24HourFormat: false,
                        selectedColor: Colors.purple,
                        strokeColor: Colors.purple,
                        handlerColor: Colors.purple,
                        hideButtons: true,
                        strokeWidth: 28,
                        handlerRadius: 10,
                        backgroundWidget: Center(
                          child: SizedBox(
                            width: 216,
                            height: 216,
                            child: Stack(
                              children: [
                                _buildClock(context, DateTime.now()),
                                Positioned(
                                  right: 78,
                                  left: 78,
                                  top: 74,
                                  bottom: 68,
                                  child: Column(
                                    children: [
                                      Text(
                                        '${_selectedTime.hour}hrs',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                          '${_selectedTime.minute.toString().padLeft(2, "0")}min',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    _selectedTime.hour < _sleepGaol.hour
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/sleep_icons/union.png',
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Under your sleep gaol (${_sleepGaol.hour}hrs)',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          )
                        : Container(),
                    _selectedTime.hour > _sleepGaol.hour
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/sleep_icons/union.png',
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'Over your sleep gaol (${_sleepGaol.hour}hrs)',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          )
                        : Container(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildSleepTime(
                                context,
                                _startTime
                                    .format(context)
                                    .toString()
                                    .padLeft(2, '0'),
                                'Bedtime',
                                Image.asset(
                                  'assets/sleep_icons/bedtime.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              _buildSleepTime(
                                context,
                                _selectedTime.format(context),
                                'Wakeup',
                                Image.asset(
                                  'assets/sleep_icons/wakeup.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8, bottom: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Repeat days',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const WeekDaySelector(),
                                ],
                              ),
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Remind me before bedtime',
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const MinutesPicker();
                                        },
                                      );
                                    },
                                    child: Text(
                                      '${manager.pickedTime} min',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                PavButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MinutesPicker()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectMinutes({int current = 30}) => NumberPicker(
        itemCount: 4,
        selectedTextStyle: const TextStyle(color: Colors.black, fontSize: 30),
        textStyle: const TextStyle(color: Colors.black54, fontSize: 22),
        value: current,
        maxValue: 50,
        minValue: 10,
        onChanged: (value) {
          setState(() {
            current = value;
          });
        },
      );

  Text text(String text) => Text(
        text,
        style: const TextStyle(fontSize: 30, color: Colors.black87),
      );

  Widget _buildSleepTime(context, time, title, image) {
    return Row(
      children: [
        image,
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black54),
            ),
            const SizedBox(height: 5.0),
            Text(
              time,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.w800, fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildClock(context, dateTime) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: Colors.black45.withOpacity(0.14),
              blurRadius: 64,
            ),
          ],
        ),
        child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: IosClockPainter(context, dateTime),
          ),
        ),
      ),
    );
  }
}
