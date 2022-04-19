import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pavlok_challenge/UI/widgets/pav_button.dart';
import 'package:time_range_picker/time_range_picker.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../widgets/clock_painter.dart';
import '../widgets/select_day.dart';

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: PavButton(
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              'Set bedtime and wakeup',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 35.0, right: 35.0, top: 2, bottom: 10),
                  child: TimeRangePicker(
                    minDuration: const Duration(hours: 5),
                    // onStartChange: (value) {
                    //   selectedTime = value;
                    // },
                    onEndChange: (value) {
                      setState(() {
                        _selectedTime = value;
                      });
                    },
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
                            '${_startTime.hour.toString().padLeft(2, '0')}:${_startTime.minute.toString().padLeft(2, '0')} AM',
                            'Bedtime',
                            Image.asset(
                              'assets/sleep_icons/bedtime.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                          _buildSleepTime(
                            context,
                            '${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')} AM',
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Repeat days',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const PickDay(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 40, top: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Remind me before bedtime',
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Text(
                              '30 min',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double compareTime(TimeOfDay time) => time.hour + time.minute / 60;
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

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:ios_clock/src/pages/bedtime/widgets/pick_day.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
//
// import '../../public/constants.dart';
// import '../../public/size_config.dart';
// import '../../theme/theme_service.dart';
// import '../global/controllers/clock_controller.dart';
// import '../global/widgets/clock_painter.dart';
// import '../widgets/clock_painter.dart';
//
// class BedTimePage extends StatefulWidget {
//   const BedTimePage({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _BedTimePageState();
// }
//
// class _BedTimePageState extends State<BedTimePage> {
//   //final clockController = Get.put(ClockController());
//   bool isOn = true;
//   final TimeOfDay _disabledStartTime = const TimeOfDay(hour: 11, minute: 01);
//   final TimeOfDay __disabledEndTime = const TimeOfDay(hour: 23, minute: 59);
//   final TimeOfDay _startTime = const TimeOfDay(hour: 00, minute: 00);
//   final TimeOfDay _endTime = const TimeOfDay(hour: 06, minute: 00);
//   TimeOfDay? _selectedTime;
//   @override
//   void initState() {
//     // clockController.startTimer();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     //clockController.dispose();
//     super.dispose();
//   }
//
//   toggle() {
//     setState(() {
//       isOn = !isOn;
//     });
//   }
//
//   _addZero() => toString().padLeft(2, '0');
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         _buildTitle(context),
//         const Spacer(flex: 1),
//         const PickDay(),
//         const Spacer(flex: 2),
//         Padding(
//           padding: const EdgeInsets.all(35.0),
//           child: TimeRangePicker(
//             minDuration: const Duration(hours: 5),
//             // onStartChange: (value) {
//             //   selectedTime = value;
//             // },
//             onEndChange: (value) {
//               setState(() {
//                 _selectedTime = value;
//               });
//             },
//             disabledColor: Colors.grey[300],
//             disabledTime: TimeRange(
//                 startTime: _disabledStartTime, endTime: __disabledEndTime),
//             hideTimes: true,
//             clockRotation: 180,
//             start: _startTime,
//             end: _selectedTime ?? _endTime,
//             use24HourFormat: false,
//             selectedColor: Colors.purple,
//             strokeColor: Colors.purple,
//             handlerColor: Colors.purple,
//             hideButtons: true,
//             strokeWidth: 28,
//             handlerRadius: 10,
//             backgroundWidget: Center(
//               child: SizedBox(
//                 width: 228,
//                 height: 228,
//                 child: Stack(
//                   children: [
//                     _buildClock(context, DateTime.now()),
//                     Positioned(
//                       right: 80,
//                       left: 80,
//                       top: 85,
//                       bottom: 85,
//                       child: Column(
//                         children: [
//                           Text(
//                             '${_selectedTime?.hour ?? _endTime.hour}hrs',
//                             style: const TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 22),
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                               '${_selectedTime?.minute.toString().padLeft(2, "0") ?? _endTime.minute.toString().padLeft(2, "0")}min',
//                               style: const TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 16))
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const Spacer(flex: 2),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _buildBottomTime(
//                 context,
//                 _startTime.hour.toString().padLeft(2, '0'),
//                 'Bedtime',
//                 Icons.power_settings_new_sharp),
//             _buildBottomTime(
//                 context,
//                 '${_selectedTime?.hour ?? _endTime.hour}:${_selectedTime?.minute.toString().padLeft(2, '0') ?? _endTime.minute.toString().padLeft(2, '0')}',
//                 'Wakeup Time',
//                 Icons.notifications_active),
//           ],
//         ),
//         const Spacer(flex: 3),
//       ],
//     );
//   }
//
//   Widget _buildTitle(context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16.0, right: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Bedtime Schedule',
//             style: TextStyle(
//               color: Theme.of(context).colorScheme.secondary,
//               fontFamily: 'Lato',
//               fontSize: width / 21.5,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           Switch(
//             activeColor: Theme.of(context).primaryColor,
//             value: isOn,
//             onChanged: (val) {
//               toggle();
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildClock(context, dateTime) {
//     return AspectRatio(
//       aspectRatio: 1,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.surface,
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//               offset: const Offset(0, 0),
//               color: kShadowColor.withOpacity(0.14),
//               blurRadius: 64,
//             ),
//           ],
//         ),
//         child: Transform.rotate(
//           angle: -pi / 2,
//           child: CustomPaint(
//             painter: IosClockPainter(context, dateTime),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBottomTime(context, time, title, icon) {
//     return Row(
//       children: [
//         Icon(
//           icon,
//           color: Theme.of(context).primaryColor,
//           size: width / 14.0,
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Column(
//           children: [
//             Text(
//               time,
//               style: TextStyle(
//                 color: Theme.of(context).textTheme.bodyText1?.color,
//                 fontFamily: 'Lato',
//                 fontSize: width / 12.5,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               title,
//               style: TextStyle(
//                 color: Theme.of(context).primaryColor,
//                 fontFamily: 'Lato',
//                 fontSize: width / 25.0,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 6.0),
//           ],
//         ),
//       ],
//     );
//   }
// }
