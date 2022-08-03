import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/modules/choose_payment.dart';
import 'package:payment_integration/modules/payments/cubit/payment_cubit_cubit.dart';
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
        appBar: AppBarr(),
        body: BlocProvider.value(
            value: BlocProvider.of<PaymentCubitCubit>(context),
            child: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
              listener: (context, state) {
                if (state is SuccessGetOrderId) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChoosePayment(
                                fname: fName.text,
                                lname: lName.text,
                                email: email.text,
                                phone: phone.text,
                                amount: price.text,
                              )));
                }
              },
              builder: (context, state) {
                return Padding(
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
                                    PaymentCubitCubit.get(context)
                                        .getFirstToken(price.text);
                                  }
                                },
                                child: state is LoadingFirstToken
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      )
                                    : Text("Bay Now"),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.purple,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10),
                                    textStyle: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          )),
                    ],
                  ),
                );
              },
            )));
  }
}
