import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
      children: [
        _buildAction(context, 0),
        _buildAction(context, 1),
        _buildAction(context, 2),
        _buildAction(context, 3),
        _buildAction(context, 4),
        _buildAction(context, 5),
        _buildAction(context, 6),
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
          depth: 6.0,
          intensity: .25,
          color: picked[index] ? const Color(0xFF8338EC) : Colors.white,
        ),
      ),
    );
  }
}
