import 'package:flutter/material.dart';
import 'material_components_screen.dart';
import 'animations_screen.dart';
import 'custom_themes_screen.dart';
import 'layouts_screen.dart';
import 'cupertino_widgets_screen.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Flutter Design Showcase',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        elevation: 2,
        shadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          _buildDesignCard(
            context,
            'Material Components',
            Icons.widgets,
            Colors.blue,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MaterialComponentsScreen(),
              ),
            ),
          ),
          _buildDesignCard(
            context,
            'Animations',
            Icons.animation,
            Colors.purple,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AnimationsScreen(),
              ),
            ),
          ),
          _buildDesignCard(
            context,
            'Custom Themes',
            Icons.color_lens,
            Colors.orange,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomThemesScreen(),
              ),
            ),
          ),
          _buildDesignCard(
            context,
            'Layouts',
            Icons.grid_on,
            Colors.green,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LayoutsScreen(),
              ),
            ),
          ),
          _buildDesignCard(
            context,
            'Cupertino Widgets',
            Icons.phone_iphone,
            Colors.grey,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CupertinoWidgetsScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesignCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.7),
                color,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.white,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}