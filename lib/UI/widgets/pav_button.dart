import 'package:flutter/material.dart';

class PavButton extends StatelessWidget {
  final void Function() onPressed;
  const PavButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 24, right: 24),
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
            'Next',
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
