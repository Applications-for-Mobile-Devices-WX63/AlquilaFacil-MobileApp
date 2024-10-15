import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:alquilafacil/spaces/presentation/providers/local_category_provider.dart';
import 'package:alquilafacil/spaces/presentation/providers/space_provider.dart';
import 'package:alquilafacil/spaces/presentation/widgets/capacity_filters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});


  @override
  State<StatefulWidget> createState()  => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>{
  int? selectedIndex;
  @override
  void initState(){
    super.initState();
    final localCategoryProvider = context.read<LocalCategoryProvider>();
    () async {
      await localCategoryProvider.getAllLocalCategories();
    }();
  }
  @override
  Widget build(BuildContext context) {
    final localCategoryProvider = context.watch<LocalCategoryProvider>();
    final spaceProvider = context.watch<SpaceProvider>();
    final ranges = ["5-10","10-25","25-50","50-100"];
    return Scaffold(
      backgroundColor: MainTheme.background,
      appBar: AppBar(
        backgroundColor: MainTheme.background,
        title: const Center(
            child: Text("Filtros",
                style:
                TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
      ),
      bottomNavigationBar: const ScreenBottomAppBar(),
      body:
          SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                     "Tipo de espacio",
                     style: TextStyle(
                       color: MainTheme.contrast,
                       fontSize: 20.0,
                       fontWeight: FontWeight.bold
                     ),
                     textAlign: TextAlign.start,
                                     ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: localCategoryProvider.localCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      bool isSelected  = selectedIndex == index;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedIndex = index;
                                spaceProvider.categorySelected = localCategoryProvider.localCategories[index].id;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected ? MainTheme.primary : Colors.transparent,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Card(
                                elevation: 10.0,
                                color: MainTheme.background,
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        localCategoryProvider.localCategories[index].photoUrl,
                                        width: 65,
                                      ),
                                      Text(
                                        localCategoryProvider.localCategories[index].name,
                                        style: TextStyle(
                                            color: MainTheme.contrast,
                                            fontSize: 10.0
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      );
                    },
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                    )
                         ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                   child: Text(
                     "Capacidad de Personas",
                     style: TextStyle(
                         color: MainTheme.contrast,
                         fontSize: 20.0,
                         fontWeight: FontWeight.bold
                     ),
                     textAlign: TextAlign.start,
                   ),
                 ),
                 ListView.builder(
                   itemBuilder: (BuildContext context, int index){
                         return CapacityFilters(
                             range: ranges[index]
                         );
                   },
                   itemCount: 4,
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                 ),
                 Center(
                   child: TextButton(onPressed: (){
                       spaceProvider.getFilterRanges();
                       spaceProvider.searchDistrictsByCategoryIdAndRange();
                       Navigator.pushNamed(
                           context, "/spaces-details"
                       );
                     },
                       child: const Text("Buscar")
                   ),
                 )
              ],
             ),
           )
    );
  }

}
