import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/modules/payments/cubit/payment_cubit_cubit.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<PaymentCubitCubit>(context),
      child: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}