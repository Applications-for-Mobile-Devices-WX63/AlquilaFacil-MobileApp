import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:alquilafacil/auth/presentation/screens/login.dart';
import 'package:alquilafacil/spaces/presentation/providers/space_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../public/ui/theme/main_theme.dart';



class MySpacesScreen extends StatefulWidget {
  const MySpacesScreen({super.key});

  @override
  State<MySpacesScreen> createState() => _MySpacesScreenState();
}

class _MySpacesScreenState extends State<MySpacesScreen> {
  @override
  void initState(){
    super.initState();
    final spaceProvider = context.read<SpaceProvider>();
    final signInProvider = context.read<SignInProvider>();
    () async {
      await spaceProvider.fetchMySpaces(signInProvider.userId);
    }();
  }
  @override
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();
    return  Scaffold(
        backgroundColor: MainTheme.background,
        appBar: AppBar(
          backgroundColor: MainTheme.background,
          title: const Text("Mis espacios"),
        ),
        body: spaceProvider.currentSpaces.isNotEmpty ?
        SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: spaceProvider.currentSpaces.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                color: MainTheme.background,
                elevation: 2.0,
                child: InkWell(
                  onTap: (){
                    spaceProvider.setSelectedSpace(spaceProvider.currentSpaces[index]);
                    Navigator.pushNamed(
                        context, "/space-info"
                    );
                  },
                  child: ListTile(
                      title: Text(
                        spaceProvider.currentSpaces[index].localName,
                        textAlign: TextAlign.end,
                      ),
                      leading: Image.network(
                        spaceProvider.currentSpaces[index].photoUrl,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            spaceProvider.currentSpaces[index].nightPrice.toString(),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            spaceProvider.currentSpaces[index].cityPlace,
                            textAlign: TextAlign.end,
                          )
                        ],
                      )
                  ),
                ),
              );
            }
          ) ,
        ) : Center(
          child: CircularProgressIndicator(
            color: MainTheme.secondary,
          ),
        )
    );
  }
}

