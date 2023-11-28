import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gengarbook/common/styleTxt.dart';
import 'package:gengarbook/widgets/customTextField.dart';
import 'package:gengarbook/widgets/dateTimeWidget.dart';
import 'package:gengarbook/widgets/radioWidget.dart';
import 'package:gengarbook/provider/radioProvider.dart';

class newBookModel extends ConsumerWidget {
  const newBookModel({
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
        padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
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
              'Titulo do Livro',
              style: appStyle.headingText,
            ),
            const Gap(6),
            customTextField(
              hintTxt: 'Escreva o titulo do seu livro',
            ),
            const Gap(12),
            Text(
              'Autor do livro',
              style: appStyle.headingText,
            ),
            const Gap(6),
            customTextField(
              hintTxt: 'Escreva o nome do autor',
            ),
            const Gap(12),
            Text(
              'Descrição',
              style: appStyle.headingText,
            ),
            const Gap(6),
            customTextField(
              hintTxt: "Descrição do livro",
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
                  child: radioWidget(
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
                  child: radioWidget(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dateTimeWidget(
                  icon: CupertinoIcons.calendar,
                  dateTimeText: 'Inicio da leitura',
                  valueText: 'dia/mês/ano',
                ),
                Gap(30),
                dateTimeWidget(
                  dateTimeText: 'Horario de leitura',
                  valueText: ' 12:00',
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
      ),
    );
  }
}
