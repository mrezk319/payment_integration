import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payment_integration/shared/components.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  TextEditingController fName = new TextEditingController();
  TextEditingController lName = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController price = new TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Payment Integration",
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextInput(
                      inputController: fName,
                      label: "First name",
                      icon: Icons.text_fields,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextInput(
                      inputController: lName,
                      label: "Last name",
                      icon: Icons.text_fields,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextInput(
                      inputController: phone,
                      keyboard: TextInputType.phone,
                      label: "Phone Number",
                      icon: Icons.phone_android,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextInput(
                      inputController: email,
                      label: "Email",
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextInput(
                      inputController: price,
                      label: "Price",
                      keyboard: TextInputType.number,
                      icon: Icons.price_change_rounded,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("Done");
                        }
                      },
                      child: Text("Bay Now"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
