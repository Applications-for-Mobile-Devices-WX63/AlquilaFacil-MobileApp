import 'package:alquilafacil/auth/presentation/providers/ConditionTermsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final conditionTermsProvider = context.watch<ConditionTermsProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
            value: conditionTermsProvider.isChecked,
            side: BorderSide(color: MainTheme.secondary, width: 2.0),
            activeColor: MainTheme.transparent,
            checkColor: MainTheme.secondary,
            onChanged: (_){
              conditionTermsProvider.setIsChecked();
            },
        ),
        const SizedBox(width: 10.0),
        const Expanded(
          child: Text(
            "Al registrarse, acepta los Términos de uso y la Política de Privacidad de AlquilaFácil",
            style: TextStyle(fontSize: 10.0),
          ),
        )
      ],
    );
  }
}
