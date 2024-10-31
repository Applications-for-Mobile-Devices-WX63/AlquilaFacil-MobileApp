import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../public/ui/theme/main_theme.dart';

class AvatarDetails extends StatelessWidget {
  final String fullName;
  const AvatarDetails({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 100,
            child: Stack(
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
                  left: 50,
                  top: 65,
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: IconButton(
                      iconSize: 10,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: MainTheme.secondary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            fullName,
            style:  const TextStyle(
                color: Colors.black
            ),
          ),
        ],
      ),
    );
  }
}
