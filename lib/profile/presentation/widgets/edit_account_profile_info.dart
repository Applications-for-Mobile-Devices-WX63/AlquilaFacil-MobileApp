
import 'package:alquilafacil/profile/presentation/providers/pofile_provider.dart';
import 'package:alquilafacil/profile/presentation/widgets/edit_account_info_field.dart';
import 'package:alquilafacil/profile/presentation/widgets/edit_profile_actions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditAccountProfileInfo extends StatefulWidget {
  const EditAccountProfileInfo({super.key});

  @override
  State<EditAccountProfileInfo> createState() => _EditAccountProfileInfoState();
}

class _EditAccountProfileInfoState extends State<EditAccountProfileInfo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileProvider = context.read<ProfileProvider>();
      profileProvider.loadCurrentInfo();
    });
  }
  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child:
           Form(
                key: _formKey,
                child:
                Column(
                    children: [
                      const SizedBox(height: 50),
                      EditAccountInfoField(
                        accountParam: profileProvider.currentName,
                        labelParam: "Ingrese el nuevo nombre",
                        onChangeValue: (String value) {
                          profileProvider.setCurrentName(value);
                       },
                      ),
                      const SizedBox(height: 50),
                      EditAccountInfoField(
                          accountParam: profileProvider.currentFatherName,
                          labelParam: "Ingrese el nuevo apellido paterno",
                        onChangeValue: (String value){
                            profileProvider.setCurrentFatherName(value);
                        },
                      ),
                      const SizedBox(height: 50),
                      EditAccountInfoField(
                          accountParam: profileProvider.currentMotherName,
                          labelParam: "Ingrese el nuevo apellido materno",
                        onChangeValue: (String value){
                          profileProvider.setCurrentMotherName(value);
                        },
                      ),
                      const SizedBox(height: 50),
                      EditAccountInfoField(
                          accountParam: profileProvider.currentDocumentNumber,
                          labelParam: "Ingrese el nuevo número de documento",
                        onChangeValue: (String value){
                          profileProvider.setCurrentDocumentNumber(value);
                        },
                      ),
                      const SizedBox(height: 50),
                      EditAccountInfoField(
                          accountParam: profileProvider.currentPhoneNumber,
                          labelParam: "Ingrese el nuevo número de telefono",
                        onChangeValue: (String value){
                          profileProvider.setCurrentPhoneNumber(value);
                        },
                      ),
                      const SizedBox(height: 50),
                      EditAccountInfoField(
                          accountParam: profileProvider.currentDateOfBirth,
                          labelParam: "Ingrese la nueva fecha de cumpleaños",
                        onChangeValue: (String value){
                          profileProvider.setCurrentDateOfBirth(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      const  EditProfileActions()
                ]

              )
           )
    );
  }
}

