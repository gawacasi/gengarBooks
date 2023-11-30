import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardListBooks extends StatelessWidget {
  const CardListBooks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 148,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          width: 10,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Titulo'),
                subtitle: const Text('Description'),
                trailing: Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    shape: const CircleBorder(),
                    value: true,
                    activeColor: Colors.purple,
                    onChanged: (value) => print(value),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -12),
                child: Container(
                  child: Column(
                    children: [
                      Divider(
                        thickness: 1.5,
                        color: Colors.grey.shade200,
                      ),
                      Row(
                        children: [
                          Text('hoje'),
                          Gap(12),
                          Text('09:15 AM - 11:45 PM'),
                          Gap(90),
                          Container(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(''),),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ))
      ]),
    );
  }
}
