import 'package:alquilafacil/subscriptions/presentation/widgets/payment_method_card.dart';
import 'package:flutter/cupertino.dart';

class PaymentMethodsAvailable extends StatelessWidget {
  const PaymentMethodsAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PaymentMethodCard(
            paymentLogo: "https://logodownload.org/wp-content/uploads/2014/10/paypal-logo-0.png",
            onPaymentStart: (){

            }
        ),
        PaymentMethodCard(
            paymentLogo: "https://www.analytics.pe/wp-content/uploads/2019/04/logo-izipay.png",
            onPaymentStart: (){

            }
        )
      ],
    );
  }
}
