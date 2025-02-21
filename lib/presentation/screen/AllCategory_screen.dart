// import 'package:flutter/material.dart';
// import 'package:user_app/presentation/screen/home_screens.dart';

// class AllCategoriesScreen extends StatelessWidget {
//   const AllCategoriesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // List of all categories (you can replace this with your actual data)
//     List<Map<String, dynamic>> allCategories = [
//       {"icon": flashIcon, "text": "Flash Deal"},
//       {"icon": billIcon, "text": "Bill"},
//       {"icon": packageIcon, "text": "Package"},
//       {"icon": giftIcon, "text": "Daily Gift"},
//       {"icon": discoverIcon, "text": "More"},
//       // Add more categories as needed
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("All Categories"),
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 4, // Number of columns in the grid
//           crossAxisSpacing: 16, // Horizontal space between items
//           mainAxisSpacing: 16, // Vertical space between items
//           childAspectRatio: 1, // Aspect ratio of each item
//         ),
//         itemCount: allCategories.length,
//         itemBuilder: (context, index) {
//           return CategoryCard(
//            // icon: allCategories[index]["icon"],
//            // text: allCategories[index]["text"],
//             // press: () {
//             //   // Handle category click (if needed)
//             // },
//           );
//         },
//       ),
//     );
//   }
// }