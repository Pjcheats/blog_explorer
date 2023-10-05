import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BlogListSkeleton extends StatelessWidget {
  const BlogListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SafeArea(
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade600.withOpacity(0.5),
              highlightColor: Colors.grey.shade500.withOpacity(0.5),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                width: double.infinity,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  width: double.infinity,
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade600.withOpacity(0.5),
              highlightColor: Colors.grey.shade500.withOpacity(0.5),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                width: double.infinity,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade600.withOpacity(0.5),
              highlightColor: Colors.grey.shade500.withOpacity(0.5),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                width: double.infinity,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade600.withOpacity(0.5),
              highlightColor: Colors.grey.shade500.withOpacity(0.5),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
