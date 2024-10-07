// import 'package:car_rental_app/presentation/bloc/onboard_bloc/onboard_bloc.dart';
// import 'package:car_rental_app/presentation/bloc/onboard_bloc/onboard_event.dart';
// import 'package:car_rental_app/presentation/bloc/onboard_bloc/onboard_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:onboarding/onboarding.dart';


// class RentACarOnboarding extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<OnboardingBloc, OnboardingState>(
//         builder: (context, state) {
//           return Onboarding(
//             swipeableBody: [
//               OnboardingPage(
//                 title: 'Welcome to Rent a Car!',
//                 description: 'Rent the best cars at affordable prices.',
//                 image: Image.asset('assets/images/onboarding1.jpeg'),
//               ),
//               OnboardingPage(
//                 title: 'Variety of Cars',
//                 description: 'Choose from a wide range of cars for your needs.',
//                 image: Image.asset('assets/variety.png'),
//               ),
//               OnboardingPage(
//                 title: 'Easy Booking',
//                 description: 'Book your favorite car quickly and easily.',
//                 image: Image.asset('assets/easy_booking.png'),
//               ),
//             ],
//             startIndex: state.currentIndex,
//             onPageChanges:
//                 (netDragDistance, pagesLength, currentIndex, slideDirection) {
//               // Listen to page changes here if necessary
//             },
//             buildHeader: (context, netDragDistance, pagesLength, currentIndex,
//                 setIndex, slideDirection) {
//               return Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     if (currentIndex > 0)
//                       TextButton(
//                         onPressed: () {
//                           context
//                               .read<OnboardingBloc>()
//                               .add(PreviousPageEvent());
//                         },
//                         child: Text('Back'),
//                       ),
//                     Text('Page ${currentIndex + 1} of $pagesLength'),
//                     TextButton(
//                       onPressed: () {
//                         context
//                             .read<OnboardingBloc>()
//                             .add(SkipOnboardingEvent());
//                       },
//                       child: Text('Skip'),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             buildFooter: (context, netDragDistance, pagesLength, currentIndex,
//                 setIndex, slideDirection) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(pagesLength, (index) {
//                   return Icon(
//                     index == currentIndex
//                         ? Icons.circle
//                         : Icons.circle_outlined,
//                     size: 10,
//                   );
//                 }),
//               );
//             },
//             animationInMilliseconds: 500,
//           );
//         },
//       ),
//       floatingActionButton: BlocBuilder<OnboardingBloc, OnboardingState>(
//         builder: (context, state) {
//           return FloatingActionButton(
//             onPressed: () {
//               context.read<OnboardingBloc>().add(NextPageEvent());
//             },
//             child: Icon(Icons.arrow_forward),
//           );
//         },
//       ),
//     );
//   }
// }

// class OnboardingPage extends StatelessWidget {
//   final String title;
//   final String description;
//   final Image image;

//   const OnboardingPage({
//     required this.title,
//     required this.description,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         image,
//         SizedBox(height: 24),
//         Text(
//           title,
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 16),
//         Text(
//           description,
//           style: TextStyle(fontSize: 16),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }


import 'package:car_rental_app/presentation/pages/spalsh_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rental_app/presentation/bloc/onboard_bloc/onboard_bloc.dart';
import 'package:car_rental_app/presentation/bloc/onboard_bloc/onboard_event.dart';
import 'package:car_rental_app/presentation/bloc/onboard_bloc/onboard_state.dart';
import 'package:onboarding/onboarding.dart';
// Import your login page here

class RentACarOnboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent.shade200, Colors.blue.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Onboarding(
              swipeableBody: [
                OnboardingPage(
                  title: 'Welcome to Rent a Car!',
                  description: 'Rent the best cars at affordable prices.',
                  image: Image.asset('assets/images/onboarding1.jpeg'),
                ),
                OnboardingPage(
                  title: 'Variety of Cars',
                  description:
                      'Choose from a wide range of cars for your needs.',
                  image: Image.asset('assets/images/onboarding2.jpeg'),
                ),
                OnboardingPage(
                  title: 'Easy Booking',
                  description: 'Book your favorite car quickly and easily.',
                  image: Image.asset('assets/images/onboarding3.jpeg'),
                ),
              ],
              startIndex: state.currentIndex,
              onPageChanges:
                  (netDragDistance, pagesLength, currentIndex, slideDirection) {
                // Handle page changes here
              },
              buildHeader: (context, netDragDistance, pagesLength, currentIndex,
                  setIndex, slideDirection) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (currentIndex > 0)
                        TextButton(
                          onPressed: () {
                            context
                                .read<OnboardingBloc>()
                                .add(PreviousPageEvent());
                          },
                          child: Text(
                            'Back',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      Text(
                        'Page ${currentIndex + 1} of $pagesLength',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read<OnboardingBloc>()
                              .add(SkipOnboardingEvent());
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
              buildFooter: (context, netDragDistance, pagesLength, currentIndex,
                  setIndex, slideDirection) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(pagesLength, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: index == currentIndex ? 12.0 : 8.0,
                        height: index == currentIndex ? 12.0 : 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == currentIndex
                              ? Colors.white
                              : Colors.white54,
                        ),
                      );
                    }),
                  ),
                );
              },
              animationInMilliseconds: 500,
            ),
          );
        },
      ),
      floatingActionButton: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            onPressed: () {
              // If last page, navigate to login page
              if (state.currentIndex == 2) {
                // Assuming 3 onboarding pages (index starts at 0)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SpalshPage()),
                );
              } else {
                context.read<OnboardingBloc>().add(NextPageEvent());
              }
            },
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final Image image;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: image,
            ),
          ),
          SizedBox(height: 40),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  color: Colors.black26,
                  blurRadius: 4,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              height: 1.4,
              letterSpacing: 0.8,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
