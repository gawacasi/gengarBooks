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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                title: const Text('Titulo'),
                subtitle: const Text('Description'),
                trailing: Transform.scale(
                  scale: 1.5,
                  child: Container(
                    height: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                          'https://yt3.ggpht.com/yti/ADpuP3M7u7NI18NMZJpS8xZnZxMtdZT1XSjfDzwM6AVmkFw=s88-c-k-c0x00ffffff-no-rj'),
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -10),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          Gap(60),
                          Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              shape: const CircleBorder(),
                              value: true,
                              activeColor: Colors.purple,
                              onChanged: (value) => print(value),
                            ),
                          ),
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
