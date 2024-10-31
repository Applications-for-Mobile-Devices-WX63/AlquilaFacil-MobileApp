import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountProfileInfo extends StatelessWidget {
  final String phoneNumber;
  final String documentNumber;
  final String dateOfBirth;
  const AccountProfileInfo({super.key, required this.phoneNumber, required this.documentNumber, required this.dateOfBirth});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 20),
                    Text(
                      "Número de telefono",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                Text(
                  phoneNumber,
                  style: const TextStyle(
                      color: Colors.black
                  ),
                )
              ],
            ),
          const SizedBox(height: 20),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.account_balance_rounded),
                    SizedBox(width: 20),
                    Text(
                      "Número de documento",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                Text(
                  documentNumber,
                  style: const TextStyle(
                      color: Colors.black
                  ),
                )
              ],
            ),
          const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.date_range),
                    SizedBox(width: 20),
                    Text(
                      "Fecha de cumpleaños",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                Text(
                  dateOfBirth,
                  style: const TextStyle(
                      color: Colors.black
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
