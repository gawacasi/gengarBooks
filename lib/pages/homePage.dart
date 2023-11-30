import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gengarbook/widgets/newBookModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Homepage();
  }
}

class Homepage extends StatefulWidget {
  Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.deepPurple.shade100,
            radius: 20,
            child: Image.asset(
              'assets/gengar.png',
              width: 25,
            ),
          ),
          title: Text(
            'Bem vindo!',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w100,
            ),
          ),
          subtitle: Text(
            "Username",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.calendar),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.bell),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Livros ativos!",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      Text(
                        "Livros ativos",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    child: Text(
                      "+ Novo livro",
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade50,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () => showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      context: context,
                      builder: (context) => newBookModel(),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
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
                    padding: const EdgeInsets.symmetric(horizontal: 14),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
