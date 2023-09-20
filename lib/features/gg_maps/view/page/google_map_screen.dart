import 'package:flutter/material.dart';
import 'package:od/features/gg_maps/view/widget/direction_screen.dart';
import 'package:od/features/gg_maps/view/widget/search_screen.dart';

import '../../../../common/widgets/buttons/header_buttons_components.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});
  static const String routeName = '/GoogleMapScreen';

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  int _currentIndex = 0;
  List<Widget> body = [const SearchScreen(), const DirectionsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Google Map'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: HeaderButtonComponents(
            padding: const EdgeInsets.only(left: 5),
            icon: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
        ),
      ),
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Search Places',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Directions',
            icon: Icon(Icons.directions),
          ),
        ],
      ),
    );
  }
}
