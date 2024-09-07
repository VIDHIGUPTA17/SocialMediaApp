import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:uni_links/uni_links.dart';

import 'photo_post_screen.dart';
import 'text_post_screen.dart';
import 'video_post_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
    handleDeepLinks();
  }

  Future<void> handleDeepLinks() async {
    // Handle deep links when the app is running
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        navigateToScreen(uri.path);
      }
    }, onError: (err) {
      print('Failed to handle deep link: $err');
    });
  }

  void navigateToScreen(String path) {
    switch (path) {
      case '/textPost':
        Navigator.pushNamed(context, '/textPost');
        break;
      case '/videoPost':
        Navigator.pushNamed(context, '/videoPost');
        break;
      case '/photoPost':
        Navigator.pushNamed(context, '/photoPost');
        break;
      default:
        break;
    }
  }

  List<Widget> _buildScreens() {
    return [
      TextPostScreen(),
      VideoPostScreen(),
      PhotoPostScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.text_fields),
        title: ("Text Post"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.video_library),
        title: ("Video Post"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.photo),
        title: ("Photo Post"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: const Color.fromARGB(255, 237, 249, 255),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style1,
    );
  }
}

