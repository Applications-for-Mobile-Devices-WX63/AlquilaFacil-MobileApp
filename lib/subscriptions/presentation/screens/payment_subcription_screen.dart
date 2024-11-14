import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:logger/logger.dart';

class PaymentSubscription extends StatelessWidget {
  final int planPrice;
  final int planId;
  final String planName;

  const PaymentSubscription ({
    super.key,
    required this.planPrice,
    required this.planId,
    required this.planName,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Finaliza el pago de tu suscripción'),
      ),
      child: Center(
        child: PaypalCheckoutView(
          sandboxMode: true,
          clientId: "AXyaQ4frJzmFwCRK7Nf6_rm66IzaMoQGtjNIpBKwarHewHArcTHJGob_gJqsp2nQVjB18sA-osj0u_QK",
          secretKey: "EJqS6dK5rnocQ9kCRHCn53kEflRfm5EYdpODk4ipkOAHzx2MtKbuby6di2UcOCtYZRtUs_wN-0LRzYeW", // Replace with your actual secret key
          transactions: [
            {
              "amount": {
                "total": planPrice.toString(),
                "currency": "USD",
              },
              "description": "Payment for susbscription at $planName.",
              "item_list": {
                "items": [
                  {
                    "name": planName,
                    "quantity": "1",
                    "price": planPrice.toString(),
                    "currency": "USD",
                  }
                ],
              },
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            Logger().i("Payment Success: $params");
          },
          onError: (error) {
            Logger().e("Payment Error: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            Logger().w("Payment Canceled");
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
