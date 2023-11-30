import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gengarbook/common/styleTxt.dart';

class dateTimeWidget extends ConsumerWidget {
  const dateTimeWidget({
    Key? key,
    required this.dateTimeText,
    required this.valueText,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String dateTimeText;
  final String valueText;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          this.dateTimeText,
          style: appStyle.headingText,
        ),
        const Gap(6),
        Material(
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => onTap(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(children: [
                  Icon(icon),
                  Gap(6),
                  Text(valueText),
                ]),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
