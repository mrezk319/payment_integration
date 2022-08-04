import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_integration/models/first_token.dart';
import 'package:payment_integration/models/last_token.dart';
import 'package:payment_integration/models/order_id.dart';
import 'package:payment_integration/modules/kiosk_screen.dart';
import 'package:payment_integration/modules/payments/webview.dart';
import 'package:payment_integration/shared/const.dart';
import 'package:payment_integration/shared/network.dart';

part 'payment_cubit_state.dart';

class PaymentCubitCubit extends Cubit<PaymentCubitState> {
  PaymentCubitCubit() : super(PaymentCubitInitial());
  static PaymentCubitCubit get(context) => BlocProvider.of(context);
  FirstTokenModel? firstTokenModel;

  getFirstToken(amount) async {
    emit(LoadingFirstToken());
    DioHelper.postData(url: "auth/tokens", data: {"api_key": apiKey})
        .then((value) {
      firstTokenModel = FirstTokenModel.fromJson(json.decode(value.toString()));
      firstToken = firstTokenModel!.token;
      emit(SuccessFirstToken());
      getOrderId(amount);
    }).catchError((E) {
      print(E);
      emit(FailFirstToken());
    });
  }

  OrderIdModel? orderIdModel;

  getOrderId(amount) async {
    emit(LoadingGetOrderId());
    DioHelper.postData(url: "ecommerce/orders", data: {
      "auth_token": firstToken,
      "amount_cents": "${int.parse(amount) * 100}",
      "currency": "EGP",
      "delivery_needed": false,
      "items": [],
    }).then((value) {
      // orderIdModel = OrderIdModel.fromJson(json.decode(value.toString()));
      orderId = value.data["id"].toString();
      emit(SuccessGetOrderId());
    }).catchError((E) {
      print(E);
      emit(FailGetOrderId());
    });
  }

  FinalToken? finalTokenModel;

  getFinalToken(
      amount, fname, lname, phone, email, isVisa, isKiosk, context) async {
    var x;
    if (isVisa) {
      x = CardId;
      print("CardId $x");
      print("CardId CardId");
    } else if (isKiosk) {
      print("KioskId");
      x = KioskId;
    } else if (isVisa == false && isKiosk == false) {
      print("MobileId");
      x = MobileWlletId;
    }
    ;

    emit(LoadingLastToken());
    DioHelper.postData(url: "acceptance/payment_keys", data: {
      "auth_token": firstToken,
      "expiration": "3600",
      "amount_cents": "${int.parse(amount) * 100}",
      "currency": "EGP",
      "order_id": orderId,
      "billing_data": {
        "apartment": "NA",
        "floor": "NA",
        "street": "NA",
        "building": "NA",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "state": "NA",
        "email": email,
        "first_name": fname,
        "phone_number": phone,
        "last_name": lname
      },
      // ignore: equal_keys_in_map
      "currency": "EGP",
      "integration_id": x
    }).then((value) {
      // finalTokenModel = FinalToken.fromJson(json.decode(value.toString()));
      finalToken = value.data["token"].toString();
      print("Final Token ====> $finalToken");
      emit(SuccessLastToken());
      if (isVisa) {
        print("Visa");
        Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => WebViewExample(
                  url:
                      "https://accept.paymob.com/api/acceptance/iframes/441437?payment_token=$finalToken"),
            ));
      } else if (isKiosk) {
        print("Kiosk");
        getKioskCode(context);
      } else if (isVisa == false && isKiosk == false) {
        print("Mobile");
        getMobileWallet(context);
        
      }
      ;
    }).catchError((E) {
      print(E);
      emit(FailLastToken());
    });
  }

  getKioskCode(context) async {
    emit(LoadingKioskCode());
    DioHelper.postData(url: "acceptance/payments/pay", data: {
      "payment_token": finalToken,
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"}
    }).then((value) {
      print(value.toString());
      refCode = value.data["id"].toString();
      print("Kiosk Code ==> $refCode");
      emit(SuccessKioskCode());
      Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => KioskScreen(
                    code: refCode,
                  )));
    }).catchError((E) {
      print(E);
      emit(FailKioskCode());
    });
  }


    getMobileWallet(context) async {
    emit(LoadingMobileWallet());
    DioHelper.postData(url: "acceptance/payments/pay", data: {
      "payment_token": finalToken,
      "source": {"identifier": "wallet mobile number", "subtype": "WALLET"}
    }).then((value) {
      print(value.toString());
      var redirect_url= value.data["iframe_redirection_url"].toString();
      print("Redirect Url ==> $redirect_url");
      emit(SuccessMobileWallet());
     Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => WebViewExample(
                  url: redirect_url),
            ));
    }).catchError((E) {
      print(E);
      emit(FailMobileWallet());
    });
  }

}
