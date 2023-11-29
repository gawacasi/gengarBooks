import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:gengarfilm/widgets/custom_text_field.dart';
import 'package:gengarfilm/providers/radio_provider.dart';
import 'package:gengarfilm/widgets/date_time_widget.dart';
import 'package:gengarfilm/widgets/radio_widget.dart';
import 'package:gengarfilm/common/style_txt.dart';

class NewFilmModel extends ConsumerWidget {
  const NewFilmModel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final radioCategory = ref.watch(radioProvider);
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          Navigator.pop(context);
        }
      },
      child: Container(
        // padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
        padding: const EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height * 0.70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
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
              'Autor do filme',
              style: AppStyle.headingText,
            ),
            const Gap(6),
            const CustomTextField(
              hintTxt: 'Escreva o nome do autor',
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
                  child: Column(
                    children: [
                      RadioWidget(
                          radioTxt: 'Nada',
                          statusColor: Colors.red.shade400,
                          valueInput: 1,
                          onChangedValue: () => {
                                ref
                                    .read(radioProvider.notifier)
                                    .update((state) => 1),
                              }),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      RadioWidget(
                          radioTxt: 'Lendo',
                          statusColor: Colors.purple.shade200,
                          valueInput: 2,
                          onChangedValue: () => {
                                ref
                                    .read(radioProvider.notifier)
                                    .update((state) => 2),
                              }),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      RadioWidget(
                          radioTxt: 'Lido',
                          statusColor: Colors.deepPurple,
                          valueInput: 3,
                          onChangedValue: () => {
                                ref
                                    .read(radioProvider.notifier)
                                    .update((state) => 3),
                              }),
                    ],
                  ),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeWidget(
                  dateTimeText: 'Início da sessão',
                  valueText: 'dd/mm/aa',
                  type: 'date',
                  icon: CupertinoIcons.time,
                ),
                Gap(30),
                DateTimeWidget(
                  dateTimeText: 'Horario de sessão',
                  valueText: '00:00',
                  type: 'time',
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
      ),
    );
  }
}
