// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gengarbook/common/styleTxt.dart';

class dateTimeWidget extends StatelessWidget {
  const dateTimeWidget({
    Key? key,
    required this.dateTimeText,
    required this.valueText,
    required this.icon,
  }) : super(key: key);

  final String dateTimeText;
  final String valueText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          this.dateTimeText,
          style: appStyle.headingText,
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
              Gap(12),
              Text(valueText),
            ]),
          ),
        )
      ]),
    );
  }
}
