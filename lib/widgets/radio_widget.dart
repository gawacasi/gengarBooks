// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gengarbook/providers/radio_provider.dart';

class RadioWidget extends ConsumerWidget {
  const RadioWidget({
    Key? key,
    required this.radioTxt,
    this.statusColor,
    required this.valueInput,
    required this.onChangedValue,
  }) : super(key: key);

  final String radioTxt;
  final Color? statusColor;
  final int valueInput;
  final VoidCallback onChangedValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio = ref.watch(radioProvider);
    return Material(
      color: Colors.white,
      child: Theme(
        data: ThemeData(unselectedWidgetColor: statusColor),
        child: RadioListTile(
          activeColor: statusColor,
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(
            offset: const Offset(-22, 0),
            child: Text(
              radioTxt,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          value: valueInput,
          groupValue: radio,
          onChanged: (value) => onChangedValue(),
        ),
      ),
    );
  }
}
