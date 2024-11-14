import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/subscriptions/presentation/widgets/payment_method_niubiz.dart';
import 'package:alquilafacil/subscriptions/presentation/widgets/payment_methods_available.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../public/ui/theme/main_theme.dart';

class SubscriptionPaymentScreen extends StatelessWidget {
  final int planPrice;
  const SubscriptionPaymentScreen({super.key, required this.planPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainTheme.primary(context),
        foregroundColor: Colors.white,
        title: const Text(
          "Elige un meétodo de pago",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 110),
            child: Text(
              "Precio total: \$$planPrice",
              style: TextStyle(
                  color: MainTheme.contrast(context),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
          ),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PaymentMethodsAvailable(),
                PaymentMethodNiubiz(),
              ])
        ],
      ),
      bottomNavigationBar: const ScreenBottomAppBar(),
    );
  }
}
