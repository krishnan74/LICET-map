import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key? key, required this.onValueChanged});

  final ValueChanged<String> onValueChanged;

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  final List<String> items = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J'
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: const Row(
          children: [
            Icon(Icons.location_city, color: Colors.white,),
            SizedBox(width: 10,),
            Expanded(
              child: Text(
                'Block',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Change to your desired text color
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Change to your desired text color
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )).toList(),

        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          widget.onValueChanged(value!);
        },

        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 190,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            color: Colors.grey[800], // Change to your desired dropdown button color
          ),
          elevation: 2,
        ),

        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down_sharp,
          ),
          iconSize: 20,
          iconEnabledColor: Colors.white, // Change to your desired icon color
          iconDisabledColor: Colors.grey,
        ),

        dropdownStyleData: DropdownStyleData(
          maxHeight: 220,
          width: 136,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
            color: Colors.grey[800], // Change to your desired dropdown menu color
          ),
          offset: const Offset(0, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(5),
            thickness: MaterialStateProperty.all(2),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
