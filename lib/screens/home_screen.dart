import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dolosa_mobprog/constants.dart';
import 'package:dolosa_mobprog/screens/newsfeed_screen.dart';
import 'package:dolosa_mobprog/screens/notification_screen.dart';
import 'package:dolosa_mobprog/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // Enhancement 2: dynamic AppBar title (isa bawat page)
  final List<String> _titles = [appName, 'Notifications', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: fbTextColorWhite,
        elevation: 2,
        title: CustomText(
          text: _titles[_selectedIndex],
          fontSize: ScreenUtil().setSp(25),
          color: fbPrimary,
          fontFamily: 'Klavika',
          fontWeight: FontWeight.w700,
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          NewsfeedScreen(),
          NotificationScreen(),
          Center(child: Text('Profile')),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onTappedBar,
        // Enhancement 3: dagdag na item (Profile)
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: fbPrimary,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
