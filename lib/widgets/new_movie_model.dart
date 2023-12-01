import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gengarmovies/common/style_text.dart';
import 'package:gengarmovies/provider/datetime_provider.dart';
import 'package:gengarmovies/widgets/custom_text_field.dart';
import 'package:gengarmovies/widgets/date_time_widget.dart';
import 'package:gengarmovies/widgets/radio_widget.dart';
import 'package:gengarmovies/provider/radio_provider.dart';
import 'package:intl/intl.dart';

class NewMovieModel extends ConsumerWidget {
  const NewMovieModel({
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
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Adicionar novo filme',
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
            style: AppStyle.headingText,
          ),
          const Gap(6),
          const CustomTextField(
            hintTxt: 'Escreva o titulo do seu filme',
          ),
          const Gap(12),
          const Text(
            'Link de Imagem',
            style: AppStyle.headingText,
          ),
          const Gap(6),
          const CustomTextField(
            hintTxt: 'Digite o link de imagem',
          ),
          const Gap(12),
          const Text(
            'Descrição',
            style: AppStyle.headingText,
          ),
          const Gap(6),
          const CustomTextField(
            hintTxt: "Descrição do filme",
            maxLength: 255,
            maxLines: 3,
          ),
          const Gap(12),
          const Text(
            'Status',
            style: AppStyle.headingText,
          ),
          Row(
            children: [
              Expanded(
                child: RadioWidget(
                    radioTxt: 'NDA',
                    statusColor: Colors.red.shade400,
                    valueInput: 1,
                    onChangedValue: () => {
                          ref.read(radioProvider.notifier).update((state) => 1),
                        }),
              ),
              Expanded(
                child: RadioWidget(
                    radioTxt: 'Marcar',
                    statusColor: Colors.purple.shade200,
                    valueInput: 2,
                    onChangedValue: () => {
                          ref.read(radioProvider.notifier).update((state) => 2),
                        }),
              ),
              Expanded(
                child: RadioWidget(
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
              DateTimeWidget(
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
              const Gap(30),
              DateTimeWidget(
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
          const Gap(13),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.deepPurple),
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
              const Gap(30),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.deepPurple),
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    {}
                  },
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
