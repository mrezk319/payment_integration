import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payment_integration/shared/components.dart';

class KioskScreen extends StatelessWidget {
  KioskScreen({Key? key, required this.code}) : super(key: key);
  String? code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The Code is ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          ],
        ),
        Text(
          code.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
         Text(
          "The code will expire after 1 hour!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ]),
    );
  }
}
