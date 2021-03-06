import 'package:flutter/material.dart';

class PavButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const PavButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Material(
        elevation: 2.0,
        color: const Color(0xFF8338EC),
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        child: MaterialButton(
          height: 56,
          minWidth: 312,
          onPressed: onPressed,
          color: const Color(0xFF8338EC),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
