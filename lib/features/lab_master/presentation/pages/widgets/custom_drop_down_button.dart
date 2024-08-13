import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.items,
    required this.initialValue,
    required this.onChnaged,
  });
  final List<String> items;
  final String initialValue;
  final void Function(String?)? onChnaged;
  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  late String currentValue;
  @override
  void initState() {
    currentValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      value: currentValue,
      dropdownColor: ColorsHelper.lightGry,
      iconSize: 15,
      // focusColor: Colors.red,
      iconEnabledColor: ColorsHelper.darkGrey,
      isExpanded: true,
      alignment: Alignment.center,
      itemHeight: 50,
      items: List.generate(
        widget.items.length,
        (index) => DropdownMenuItem(
          value: widget.items[index],
          child: Text(widget.items[index]),
        ),
      ),
      onChanged: (value) {
        setState(() {
          currentValue = value!;
          widget.onChnaged!(value);
        });
      },
    );
  }
}
