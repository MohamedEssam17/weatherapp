import 'package:flutter/material.dart';

class Noweatherbody extends StatelessWidget {
  const Noweatherbody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                  )
          ],),
        );
  }
}