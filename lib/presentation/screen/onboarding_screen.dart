import 'package:flutter/material.dart';
import 'package:user_app/presentation/screen/forgetpassword.dart';
import 'package:user_app/presentation/screen/signInScrenn.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  late PageController _pageController;
  bool _isSkipPressed = false; // Flag to prevent blinking

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (!_isSkipPressed) {
      if (currentPage < demoData.length - 1) {
        setState(() {
          currentPage++;
        });
        _pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _navigateToLoginScreen(); // Navigate to LoginScreen instead of NewScreen
      }
    }
  }

  void _navigateToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  SignInScreen()), // Replaced NewScreen with LoginScreen
    );
  }

  void _skipToLoginScreen() {
    setState(() {
      _isSkipPressed = true; // Set the flag to true when skip is pressed
    });
    _navigateToLoginScreen(); // Navigate to LoginScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 1),
                Expanded(
                  flex: 6,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: demoData.length,
                    onPageChanged: (value) {
                      if (!_isSkipPressed) {
                        setState(() {
                          currentPage = value;
                        });
                      }
                    },
                    itemBuilder: (context, index) => OnboardContent(
                      illustration: demoData[index]["illustration"],
                      title: demoData[index]["title"],
                      text: demoData[index]["text"],
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    demoData.length,
                    (index) => DotIndicator(isActive: index == currentPage),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
          // Skip Button
          Positioned(
            top: 36,
            right: 16,
            child: TextButton(
              onPressed: _skipToLoginScreen, // Navigate to LoginScreen on skip
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 36.0, right: 16),
              child: FloatingActionButton(
                onPressed: _nextPage,
                backgroundColor: const Color(0xFF22A45D),
                child: const Icon(Icons.arrow_forward, color: Colors.white),
                shape: const CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.text,
  });

  final String? illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              illustration!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          text!,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
    this.activeColor = const Color(0xFF22A45D),
    this.inActiveColor = const Color(0xFF868686),
  });

  final bool isActive;
  final Color activeColor, inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 16 / 2),
      height: 5,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inActiveColor.withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> demoData = [
  {
    "illustration": "https://i.postimg.cc/L43CKddq/Illustrations.png",
    "title": "Track Your Package",
    "text":
        "Easily track your packages in real-time,so you\nalways know where your delivery is.",
  },
  {
    "illustration": "https://i.postimg.cc/xTjs9sY6/Illustrations-1.png",
    "title": "Free delivery offers",
    "text":
        "Free delivery for new customers via Apple Pay\nand others payment methods.",
  },
  {
    "illustration": "https://i.postimg.cc/6qcYdZVV/Illustrations-2.png",
    "title": "Choose your food",
    "text":
        "Easily find your type of food craving and\nyou’ll get delivery in wide range.",
  },
];


