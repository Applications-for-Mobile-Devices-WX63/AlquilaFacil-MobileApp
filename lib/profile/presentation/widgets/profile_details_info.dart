import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../public/ui/theme/main_theme.dart';

class ProfileDetailsInfo extends StatelessWidget {
  final String fullName;
  final String phoneNumber;
  final String documentNumber;
  final String dateOfBirth;
  const ProfileDetailsInfo({
        super.key,
        required this.fullName,
        required this.phoneNumber,
        required this.documentNumber,
        required this.dateOfBirth
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      padding: const EdgeInsets.only(top: 70, bottom: 10),
      width: double.infinity,
      height: 600,
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    SizedBox(
                    width: 80,
                    height: 100,
                    child:  Stack(
                      fit: StackFit.expand,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        Positioned(
                            left:50,
                            top: 65,
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: IconButton(
                                iconSize: 10,
                              onPressed: (){

                                },
                                icon: const Icon(
                                    Icons.edit,
                                  color: Colors.white,
                                ),
                              style: IconButton.styleFrom(
                                backgroundColor: MainTheme.secondary,
                               ),
                                                       ),
                            )
                        )
                      ]
                    ),
                  ),
                  Text(
                    fullName,
                    style:  const TextStyle(
                        color: Colors.black
                    ),
                  )
                ],
              )
            ),
          const SizedBox(height: 50),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
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
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
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
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
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
          )
        ],
      ),
    );
  }
}
