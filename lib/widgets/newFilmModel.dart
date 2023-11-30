import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gengarbook/common/styleTxt.dart';
import 'package:gengarbook/provider/dateTimeProvider.dart';
import 'package:gengarbook/widgets/customTextField.dart';
import 'package:gengarbook/widgets/dateTimeWidget.dart';
import 'package:gengarbook/widgets/radioWidget.dart';
import 'package:gengarbook/provider/radioProvider.dart';
import 'package:intl/intl.dart';

class newBookModel extends ConsumerWidget {
  const newBookModel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);
    final timeProv = ref.watch(timeProvider);
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Adicionar novo livro',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade200,
          ),
          const Gap(12),
          const Text(
            'Titulo do Filme',
            style: appStyle.headingText,
          ),
          const Gap(6),
          customTextField(
            hintTxt: 'Escreva o titulo do seu Filme',
          ),
          const Gap(12),
          Text(
            'Link de Imagem',
            style: appStyle.headingText,
          ),
          const Gap(6),
          customTextField(
            hintTxt: 'Digite o link de imagem',
          ),
          const Gap(12),
          Text(
            'Descrição',
            style: appStyle.headingText,
          ),
          const Gap(6),
          customTextField(
            hintTxt: "Descrição do filme",
            maxLength: 255,
            maxLines: 3,
          ),
          Gap(12),
          Text(
            'Status',
            style: appStyle.headingText,
          ),
          Row(
            children: [
              Expanded(
                child: radioWidget(
                    radioTxt: 'NDA',
                    statusColor: Colors.red.shade400,
                    valueInput: 1,
                    onChangedValue: () => {
                          ref.read(radioProvider.notifier).update((state) => 1),
                        }),
              ),
              Expanded(
                child: radioWidget(
                    radioTxt: 'Marcar',
                    statusColor: Colors.purple.shade200,
                    valueInput: 2,
                    onChangedValue: () => {
                          ref.read(radioProvider.notifier).update((state) => 2),
                        }),
              ),
              Expanded(
                child: radioWidget(
                    radioTxt: 'Visto',
                    statusColor: Colors.deepPurple,
                    valueInput: 3,
                    onChangedValue: () => {
                          ref.read(radioProvider.notifier).update((state) => 3),
                        }),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              dateTimeWidget(
                onTap: () async {
                  final getValue = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2025),
                  );

                  if (getValue != null) {
                    final format = DateFormat.yMMMd();
                    ref
                        .read(dateProvider.notifier)
                        .update((state) => format.format(getValue));
                  }
                },
                icon: CupertinoIcons.calendar,
                dateTimeText: 'Lançamento',
                valueText: dateProv,
              ),
              Gap(30),
              dateTimeWidget(
                onTap: () async {
                  final getTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (getTime != null) {
                    ref
                        .read(timeProvider.notifier)
                        .update((state) => getTime.format(context));
                  }
                },
                dateTimeText: 'Horario do Filme',
                valueText: timeProv,
                icon: CupertinoIcons.time,
              )
            ],
          ),
          Gap(13),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurple),
                    backgroundColor: const Color.fromARGB(255, 239, 231, 240),
                    foregroundColor: Colors.deepPurple,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Gap(30),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurple),
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Concluir',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
