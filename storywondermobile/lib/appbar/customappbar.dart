import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double progress;

  const CustomAppBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(
                Iconsax.arrow_left_15,
                color: Color(0xFF11BFDD),
              ), // Replace with the Iconsax icon
              onPressed: () {},
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: SizedBox(
                height: 14, // Adjust height as needed
                child: TweenAnimationBuilder<double>(
                  duration:
                      const Duration(milliseconds: 400), // Animation duration
                  tween: Tween<double>(
                    begin: progress -
                        0.1, // Start animation slightly before the current progress
                    end: progress, // End animation at current progress
                  ),
                  builder: (context, value, child) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(153, 17, 190, 221),
                          ),
                        ),
                        Positioned.fill(
                          left: 0,
                          child: FractionallySizedBox(
                            widthFactor: value,
                            alignment: Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xFF11BFDD),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
