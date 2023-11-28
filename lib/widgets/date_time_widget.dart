import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gengarbook/common/style_txt.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({
    Key? key,
    required this.dateTimeText,
    required this.valueText,
    required this.icon,
  }) : super(key: key);

  final String dateTimeText;
  final String valueText;
  final IconData icon;

  @override
  _DateTimeWidgetState createState() => _DateTimeWidgetState();
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  late String dateTimeText;
  late String valueText;
  late IconData icon;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    dateTimeText = widget.dateTimeText;
    valueText = widget.valueText;
    icon = widget.icon;
    _selectedDate = DateTime.now();
  }

  Future<void> _showDatePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        valueText =
            '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'
                .toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showDatePicker,
      child: Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            dateTimeText,
            style: AppStyle.headingText,
          ),
          const Gap(6),
          Ink(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(children: [
                Icon(icon),
                const Gap(12),
                Text(valueText),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
