import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/spaces/presentation/providers/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alquilafacil/spaces/presentation/widgets/card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Panel de control',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/search-space');
          },
        ),
      ),
      bottomNavigationBar: const ScreenBottomAppBar(),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(16.0),
            elevation: 10.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NavigationRow(
                    title: 'Modificar perfil',
                    routeName: '/profile-details',
                  ),
                  const Divider(),
                  NavigationRow(
                    title: 'Ver mis espacios',
                    routeName: '/my-spaces',
                  ),
                  const Divider(),
                  NavigationRow(
                    title: 'Mis espacios favoritos',
                    routeName: '/favorites',
                    onTap: () async {
                      await spaceProvider.loadFavorites();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoritesScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  NavigationRow(
                    title: 'Cerrar sesión',
                    routeName: '/login',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spaceProvider = Provider.of<SpaceProvider>(context);
    final favoriteSpaces = spaceProvider.favoriteSpaces;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Mis espacios favoritos',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/search-space');
          },
        ),
      ),
      body: favoriteSpaces.isEmpty
          ? const Center(child: Text('No tienes espacios favoritos'))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: favoriteSpaces.length,
              itemBuilder: (context, index) {
                final space = favoriteSpaces[index];
                return SpaceCard(
                  location: space.cityPlace,
                  price: space.nightPrice.toString(),
                  imageUrl: space.photoUrl,
                  id: space.id,
                );
              },
            ),
    );
  }
}

class NavigationRow extends StatelessWidget {
  final String title;
  final String routeName;
  final VoidCallback? onTap;

  const NavigationRow({
    super.key,
    required this.title,
    required this.routeName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => Navigator.pushNamed(context, routeName),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
