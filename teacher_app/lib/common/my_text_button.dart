import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final Widget childWidget;
  final Function onP;
  const MyTextButton({
    Key? key,
    required this.childWidget,
    required this.onP,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () => onP,
        // style: Theme.of(context).textButtonTheme.style,
        child: childWidget,
      ),
    );
  }
}
