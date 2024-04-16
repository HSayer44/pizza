import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza/screens/home/views/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Row(
            children: [
              Image.asset('assets/8.png', scale: 14),
              const SizedBox(width: 8),
              const Text(
                'PIZZA',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart)),
            IconButton(
                onPressed: () {
                  context.read<SignInBloc>().add(SignOutRequired());
                },
                icon: const Icon(CupertinoIcons.arrow_right_to_line)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 8 / 16,
            ),
            itemCount: 8,
            itemBuilder: (context, int i) {
              return Material(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsScreen(),
                        ));
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/${i + 1}.png'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30), color: Colors.red.withOpacity(0.6)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                                child: Text(
                                  'NON-VEG',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 9),
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30), color: Colors.green.withOpacity(0.2)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                                child: Text(
                                  '🌶️ BALANCE',
                                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.w800, fontSize: 9),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                        child: Text(
                          'Cheesy Marvel',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                        child: Text(
                          'Crafting joy: your pizza, your rules, best taste',
                          style: TextStyle(fontSize: 10, color: Colors.grey.shade700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                        child: Row(
                          children: [
                            Text('€12.00',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w700,
                                )),
                            const SizedBox(width: 5),
                            Text('€15.00',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.lineThrough,
                                )),
                            const Expanded(child: SizedBox()),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.add_circled_solid),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
