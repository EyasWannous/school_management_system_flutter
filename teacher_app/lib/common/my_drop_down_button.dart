import 'package:flutter/material.dart';

class MyDropDownButton extends StatelessWidget {
  final String hintText;
  final List<String> childText;
  final Function changeValue;
  const MyDropDownButton({
    Key? key,
    required this.hintText,
    required this.childText,
    required this.changeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Align(alignment: Alignment.center, child: Text(hintText)),
      style: const TextStyle(
        fontSize: 10,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      underline: const Text(''),
      dropdownColor: const Color.fromRGBO(233, 238, 252, 1),
      value: 'Option 1',
      alignment: AlignmentDirectional.center,
      borderRadius: BorderRadius.circular(15),
      items: childText.map((String item) {
        return DropdownMenuItem(
          value: item,
          alignment: Alignment.center,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) => changeValue,
    );
  }
}
