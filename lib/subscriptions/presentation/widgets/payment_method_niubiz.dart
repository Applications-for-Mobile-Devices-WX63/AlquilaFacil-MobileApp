import 'package:alquilafacil/auth/presentation/screens/register.dart';
import 'package:alquilafacil/subscriptions/presentation/provider/plan_provider.dart';
import 'package:alquilafacil/subscriptions/presentation/screens/payment_subcription_screen.dart';
import 'package:alquilafacil/subscriptions/presentation/widgets/payment_method_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMethodNiubiz extends StatelessWidget {
  const PaymentMethodNiubiz({super.key});

  @override
  Widget build(BuildContext context) {
    final planProvider = context.watch<PlanProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PaymentMethodCard(
            paymentLogo:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjmd7Je-pipM_WEKycXMrVQ9JrGSkF0UjLPw&s",
            onPaymentStart: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (_) => PaymentSubscription(
              //             planPrice: planProvider.currentPlans[0].price,
              //             planId: planProvider.currentPlans[0].id,
              //             planName: planProvider.currentPlans[0].name)));
            }),
      ],
    );
  }
}
