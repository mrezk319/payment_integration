import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/modules/payments/cubit/payment_cubit_cubit.dart';
import 'package:payment_integration/shared/components.dart';

class ChoosePayment extends StatelessWidget {
  ChoosePayment({Key? key,required this.fname, required this.lname, required this.phone, required this.email, required this.amount})
      : super(key: key);
  String? fname, lname, phone, email, amount;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<PaymentCubitCubit>(context),
      child: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBarr(),
            body: ListView(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    PaymentCubitCubit.get(context).getFinalToken(amount, fname,
                        lname, phone, email, true, false, context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Visa Card",
                            style: TextStyle(fontSize: 25),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    PaymentCubitCubit.get(context).getFinalToken(amount, fname,
                        lname, phone, email, false, true, context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "By Fawry",
                            style: TextStyle(fontSize: 25),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    PaymentCubitCubit.get(context).getFinalToken(amount, fname,
                        lname, phone, email, false, false, context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Mobile",
                            style: TextStyle(fontSize: 25),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
