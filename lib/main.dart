import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pfe_app/screens/aboutUs.dart';
import 'package:pfe_app/screens/mps.dart';
import 'package:pfe_app/screens/photoPage.dart';
import 'package:pfe_app/screens/settingsPage.dart';
import 'package:pfe_app/widgets/AnimatedButton.dart';
import 'package:pfe_app/widgets/custom_tag.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Splash Screen',
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/page1': (context) => const Mps(),
        '/page2': (context) => const PhotosPage(),
        '/page3': (context) => const SettingsPage(),
        '/page4': (context) => const AboutUs(),
      },
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 4, 34),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_logo.png',
              height: 150,
            ),
            const SizedBox(
              height: 30,
            ),
            if (defaultTargetPlatform == TargetPlatform.iOS)
              const CupertinoActivityIndicator(
                color: Colors.white,
                radius: 20,
              )
            else
              const CircularProgressIndicator(
                color: Colors.white,
              )
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  List<IconData> listOfIcons = [
    Icons.location_on_rounded,
    Icons.camera_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  List<String> listOfStrings = [
    'Location',
    'Photos',
    'Settings',
    'About Us',
  ];

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 21, 4, 34),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: const [
          Intro(),
          Qui(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
              // Navigate to the corresponding page when a button is pressed
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/page1');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/page2');
                  break;
                case 3:
                  Navigator.pushNamed(context, '/page3');
                  break;
                case 4:
                  Navigator.pushNamed(context, '/page4');
                  break;
                default:
                  break;
              }
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? const Color.fromARGB(255, 1, 8, 20).withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex ? listOfStrings[index] : '',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? const Color.fromARGB(255, 0, 0, 0)
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Qui extends StatelessWidget {
  const Qui({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Add a SizedBox widget here

            Text(
              'Last Photos:',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 4,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        //TO DO : add photos from rpi
        //  SizedBox(
        //  height: 250,
        //  child: ListView.builder( scrollDirection: Axis.horizontal,
        // itemCount: const EdgeInsets.only(right: 10),
        // itemBuilder: (context , index ){
        // return Column(
        // child: Column(
        //  children: [
        //  ImageContainer(width: MediaQuery.of(context0).size.width*0.5, image: image)
        //  ],
        //)
        // )
        // })
        //)
        //Add a SizedBox widget here

        const Button()
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedButton(
          width: 300,
          height: 40,
          text: 'All Photos:',
          animationColor: Color.fromARGB(255, 6, 0, 8),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class Intro extends StatelessWidget {
  const Intro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
        height: MediaQuery.of(context).size.height * 0.45,
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        image: 'assets/images/image.png',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTag(
              backgroundColor:
                  const Color.fromARGB(255, 197, 189, 231).withAlpha(150),
              children: [
                Text(
                  'Welcome to My Eyes! ',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color.fromARGB(255, 241, 240, 245),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'We are excited to have you here. we hope you enjoy your experience with our app. Thanks for choosing My Eyes!',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.25,
                  ),
            ),
            Text(
              'By SE Engineering',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ));
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    this.height = 125,
    this.borderRadius = 20,
    required this.width,
    required this.image,
    this.padding,
    this.margin,
    this.child,
  });
  final double width;
  final double height;
  final String image;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      margin: margin,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          )),
      child: child,
    );
  }
}
