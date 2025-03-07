import 'package:flutter/material.dart';

class CategoriesFilter extends StatefulWidget {
  const CategoriesFilter({super.key});

  @override
  State<CategoriesFilter> createState() => _CategoriesFilterState();
}

class _CategoriesFilterState extends State<CategoriesFilter> {
  int selectedIndex = 3; // Default selected category

  void _onCategorySelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        SectionTitle(
          title: "Categories",
          press: () {
            setState(() {
              selectedIndex = -1; // Clear selection
            });
          },
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Wrap(
            spacing: 6, 
            runSpacing: 6, // Adjust to avoid overflow
            children: List.generate(
              demoCategories.length,
              (index) => CategoryButton(
                title: demoCategories[index]["title"],
                isSelected: selectedIndex == index,
                onTap: () => _onCategorySelected(index),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.indigo : const Color.fromARGB(255, 149, 147, 147),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              "Clear all",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF010F07).withOpacity(0.64),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> demoCategories = [
  {"title": "Electronic"},
  {"title": "Documents"},
  {"title": "Cloths"},
  {"title": "Burgers"},
  {"title": "Chinese"},
  {"title": "Pizza"},
  {"title": "Salads"},
  {"title": "Soups"},
  {"title": "Breakfast"},
];
