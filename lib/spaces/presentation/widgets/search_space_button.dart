import 'package:alquilafacil/public/ui/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/space_provider.dart';

class SearchSpaceButton extends StatefulWidget {
  final String? routeToRedirect;
  final IconData? suffixIcon;
  const SearchSpaceButton({super.key, this.routeToRedirect, this.suffixIcon});
  @override
  State<StatefulWidget> createState() => _SearchSpaceButton();
}

class _SearchSpaceButton extends State<SearchSpaceButton> {
  @override
  Widget build(BuildContext context) {
    final spaceProvider = context.watch<SpaceProvider>();
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
          color: MainTheme.helper, borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: TextFormField(
          initialValue: spaceProvider.cityPlace,
          onChanged: (newCityPlace) => spaceProvider.setCityPlace(newCityPlace),
          textAlign: TextAlign.start,
          cursorColor: Colors.black,
          style: const TextStyle(color: Colors.black, fontSize: 15.0),
          onTap: () =>
              Navigator.pushNamed(context, '/${widget.routeToRedirect}'),
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MainTheme.transparent)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MainTheme.transparent)),
              hintText: "Busca tu espacio ideal",
              prefixIcon: IconButton(
                  onPressed: () => {spaceProvider.searchDistrict()}, icon: const Icon(Icons.search_outlined)),
              suffixIcon: IconButton(
                  onPressed: () => {Navigator.pushNamed(context, "/search-space")}, icon: Icon(widget.suffixIcon))),
        ),
      ),
    );
  }
}
