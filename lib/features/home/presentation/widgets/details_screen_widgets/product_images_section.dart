import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';

class ProductImagesSection extends StatefulWidget {
  const ProductImagesSection({
    super.key,
    required this.images,
  });
  final List<String> images;

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
            itemCount: widget.images.length,
            itemBuilder: (context, index) => AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.all(20),
                width: 100,
                height: 100,
                child: CustomNetworkImage(
                  imageUrl: widget.images[index],
                ),
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
            itemCount: widget.images.length,
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
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: isSelected
                          ? ColorStyles.primary
                          : ColorStyles.customGray.withValues(alpha: .5),
                    ),
                  ),
                  child: CustomNetworkImage(
                    imageUrl: widget.images[index],
                    fit: BoxFit.fill,
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
