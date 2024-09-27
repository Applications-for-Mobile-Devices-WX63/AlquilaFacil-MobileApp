import 'package:flutter/material.dart';

import '../../../public/ui/theme/main_theme.dart';

class ConditionsTerms extends StatefulWidget {
  const ConditionsTerms({super.key});

  @override
  State<StatefulWidget> createState() => _ConditionTerms();
}

class _ConditionTerms extends State<ConditionsTerms> {
  late bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
            value: isAccepted,
            side: BorderSide(color: MainTheme.secondary, width: 2.0),
            activeColor: MainTheme.transparent,
            checkColor: MainTheme.secondary,
            onChanged: (bool? value) {
              setState(() {
                isAccepted = value ?? false;
              });
            }),
        const SizedBox(width: 10.0),
        const SizedBox(
            width: 200,
            child: Text(
              "Al registrarse, acepta los Términos y uso y la Política de Privacidad de AlquilaFácil",
              style: TextStyle(fontSize: 10.0),
            ))
      ],
    );
  }
}
