import 'package:flutter/material.dart';
import 'package:flutter_servisci_app/product/constants/color_constants.dart';
import 'package:flutter_servisci_app/product/models/news.dart';
import 'package:flutter_servisci_app/product/widgets/text/subtitle_text.dart';

class HomeNewsCard extends StatelessWidget {
  const HomeNewsCard({
    required this.newsItem,
    super.key,
  });

  final News? newsItem;

  @override
  Widget build(BuildContext context) {
    if (newsItem == null) return const SizedBox.shrink();
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Image.network(
            newsItem!.image ?? '',
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
          ),
        ),
        Positioned.fill(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_add_outlined,
                  color: ColorConstants.white,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubtitleText(
                      value: newsItem!.category ?? '',
                      color: ColorConstants.grayPrimary,
                    ),
                    SubtitleText(
                      value: newsItem!.title ?? '',
                      color: ColorConstants.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
