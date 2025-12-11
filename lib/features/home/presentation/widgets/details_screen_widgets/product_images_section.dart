import 'package:flutter/material.dart';

class ProductImagesSection extends StatefulWidget {
  const ProductImagesSection({super.key});

  @override
  State<ProductImagesSection> createState() => _ProductImagesSectionState();
}

class _ProductImagesSectionState extends State<ProductImagesSection> {
  int selectedIndex = 0;
  late final PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.red, Colors.blue, Colors.green];
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            itemCount: 3,
            itemBuilder: (context, index) => AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.all(20),
                width: 100,
                height: 100,
                color: colors[index],
              ),
            ),
          ),
        ),

        const SizedBox(height: 19),

        Container(
          alignment: Alignment.center,
          height: 56,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 16),
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });

                  controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.yellow,
                    ),
                    color: colors[index],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
