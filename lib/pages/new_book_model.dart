import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gengarbook/common/style_txt.dart';
import 'package:gengarbook/widgets/custom_text_field.dart';
import 'package:gengarbook/widgets/date_time_widget.dart';
import 'package:gengarbook/widgets/radio_widget.dart';
import 'package:gengarbook/providers/radio_provider.dart';

class NewBookModel extends ConsumerWidget {
  const NewBookModel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          Navigator.pop(context); // Fecha o modal ao arrastar para baixo
        }
      },
      child: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
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
              'Titulo do Livro',
              style: AppStyle.headingText,
            ),
            const Gap(6),
            const CustomTextField(
              hintTxt: 'Escreva o titulo do seu livro',
            ),
            const Gap(12),
            const Text(
              'Autor do livro',
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
              hintTxt: "Descrição do livro",
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
                      radioTxt: 'Nada',
                      statusColor: Colors.red.shade400,
                      valueInput: 1,
                      onChangedValue: () => {
                            ref
                                .read(radioProvider.notifier)
                                .update((state) => 1),
                          }),
                ),
                Expanded(
                  child: RadioWidget(
                      radioTxt: 'Lendo',
                      statusColor: Colors.purple.shade200,
                      valueInput: 2,
                      onChangedValue: () => {
                            ref
                                .read(radioProvider.notifier)
                                .update((state) => 2),
                          }),
                ),
                Expanded(
                  child: RadioWidget(
                      radioTxt: 'Lido',
                      statusColor: Colors.deepPurple,
                      valueInput: 3,
                      onChangedValue: () => {
                            ref
                                .read(radioProvider.notifier)
                                .update((state) => 3),
                          }),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeWidget(
                  dateTimeText: 'Início da Leitura',
                  valueText: 'dd/mm/aa',
                  icon: CupertinoIcons.time,
                ),
                Gap(30),
                DateTimeWidget(
                  dateTimeText: 'Horario de leitura',
                  valueText: ' 12:00',
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
