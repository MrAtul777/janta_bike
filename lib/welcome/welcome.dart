
import 'package:flutter/material.dart';
import 'package:janta_bike/form/login.dart';
import 'package:janta_bike/myhomepage.dart';
import 'package:janta_bike/welcome/button.dart';
import 'package:janta_bike/welcome/page.dart';
import 'package:janta_bike/welcome/previours.dart';




class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  // List of onboarding pages with images and messages
  final List<Map<String, String>> _pages = [
    {
      'image': 'assets/logo/first.png', // Path to your image
      'title': 'Welcome!',
      'message': 'Welcome to our application, your journey starts here.',
    },
    {
      'image': 'assets/logo/second.png', // Path to your image
      'title': 'About Us',
      'message': 'Here is some information about our system.',
    },
    {
      'image': 'assets/logo/thrid.png', // Path to your image
      'title': 'Get Started',
      'message': 'Login or sign up to continue.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _buildPage(
                _pages[index]['image']!,
                _pages[index]['title']!,
                _pages[index]['message']!,
              );
            },
          ),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: PageIndicator(
                currentPage: _currentPage, pageCount: _pages.length),
          ),
          // Conditionally show Previous button
          if (_currentPage >
              0) // Only show Previous button if not on the first page
            Positioned(
              bottom: 50,
              left: 20,
              child: PreviousButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
              ),
            ),
          Positioned(
            bottom: 50,
            right: 20,
            child: NextButton(
              onPressed: () {
                if (_currentPage < _pages.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  //Navigate to the signup page after the last page
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Build individual onboarding page with image and message
  Widget _buildPage(String imagePath, String title, String message) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white, // Ensure each page has a white background
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            height: 250, // Adjust size as necessary
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
