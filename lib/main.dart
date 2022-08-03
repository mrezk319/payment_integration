import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/bloc_observer.dart';
import 'package:payment_integration/modules/choose_payment.dart';
import 'package:payment_integration/modules/payments/cubit/payment_cubit_cubit.dart';
import 'package:payment_integration/modules/registeration.dart';
import 'package:payment_integration/shared/network.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PaymentCubitCubit>(
          create: (BuildContext context) => PaymentCubitCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Payment Integration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RegistrationScreen(),
      ),
    );
  }
}
