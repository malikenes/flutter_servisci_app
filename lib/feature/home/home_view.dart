import 'package:flutter/material.dart';
import 'package:flutter_servisci_app/product/constants/color_constants.dart';
import 'package:flutter_servisci_app/product/constants/string_constants.dart';
import 'package:flutter_servisci_app/product/widgets/text/subtitle_text.dart';
import 'package:flutter_servisci_app/product/widgets/text/title_text.dart';
part './subview/home_chips.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: const [
            _Header(),
            _SearchTextField(),
            _TagListView(),
            _BrowseHorizontalListView(),
            _RecommendedRow(),
            _RecommendedListview(),
          ],
        ),
      ),
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search_outlined),
        suffixIcon: Icon(Icons.mic_outlined),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        fillColor: ColorConstants.grayPrimary,
        filled: true,
        hintText: StringConstants.homeSearchHint,
      ),
    );
  }
}

class _TagListView extends StatelessWidget {
  const _TagListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 32,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (index.isOdd) {
              return const _PassiveChip();
            }

            return const _ActiveChip();
          },
        ),
      ),
    );
  }
}

class _BrowseHorizontalListView extends StatelessWidget {
  const _BrowseHorizontalListView();
  static const dummyImage =
      'https://firebasestorage.googleapis.com/v0/b/flutter-servisci-app.appspot.com/o/IMG_4113.jpg?alt=media&token=28e0e593-93f8-469c-8165-f4803887db12';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return const _HorizontalCard(dummyImage: dummyImage);
        },
      ),
    );
  }
}

class _HorizontalCard extends StatelessWidget {
  const _HorizontalCard({
    required this.dummyImage,
    super.key,
  });

  final String dummyImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Image.network(_BrowseHorizontalListView.dummyImage),
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
              const Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubtitleText(
                      value: 'Politics',
                      color: ColorConstants.grayPrimary,
                    ),
                    SubtitleText(
                      value: 'The latiest stıtıon in the presential election',
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

class _RecommendedRow extends StatelessWidget {
  const _RecommendedRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(child: TitleText(value: StringConstants.homeRecommend)),
        TextButton(
          onPressed: () {},
          child: const SubtitleText(
            value: StringConstants.homeSeeAll,
            color: ColorConstants.white,
          ),
        ),
      ],
    );
  }
}

class _RecommendedListview extends StatelessWidget {
  const _RecommendedListview();
  static const dummyImage =
      'https://firebasestorage.googleapis.com/v0/b/flutter-servisci-app.appspot.com/o/IMG_4113.jpg?alt=media&token=28e0e593-93f8-469c-8165-f4803887db12';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return const _RecommendedCard(dummyImage: dummyImage);
      },
    );
  }
}

class _RecommendedCard extends StatelessWidget {
  const _RecommendedCard({
    required this.dummyImage,
    super.key,
  });

  final String dummyImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          SizedBox(
            height: 96,
            child: Image.network(_RecommendedListview.dummyImage),
          ),
          const Expanded(
            child: ListTile(
              title: Text('UI/UX design'),
              subtitle: Text('A simple Trick for creatibg color palette quicly.'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(value: StringConstants.homeBrowse),
        SubtitleText(
          value: StringConstants.homeSubTitle,
          color: Colors.black,
        ),
      ],
    );
  }
}
