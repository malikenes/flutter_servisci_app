import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_servisci_app/feature/home/home_provider.dart';
import 'package:flutter_servisci_app/product/constants/color_constants.dart';
import 'package:flutter_servisci_app/product/constants/string_constants.dart';
import 'package:flutter_servisci_app/product/models/recommended.dart';
import 'package:flutter_servisci_app/product/models/tag.dart';
import 'package:flutter_servisci_app/product/widgets/card/home_news_card.dart';
import 'package:flutter_servisci_app/product/widgets/card/recommended_card.dart';
import 'package:flutter_servisci_app/product/widgets/text/subtitle_text.dart';
import 'package:flutter_servisci_app/product/widgets/text/title_text.dart';
part './subview/home_chips.dart';

final _homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => ref.read(_homeProvider.notifier).fetchAndLoad());
  }

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

class _TagListView extends ConsumerWidget {
  const _TagListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tagItems = ref.watch(_homeProvider).tags ?? [];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 32,
        child: ListView.builder(
          itemCount: tagItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final tagItem = tagItems[index];
            if (tagItem.active ?? true) {
              return _PassiveChip(tagItem);
            }

            return _ActiveChip(tagItem);
          },
        ),
      ),
    );
  }
}

class _BrowseHorizontalListView extends ConsumerWidget {
  const _BrowseHorizontalListView();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsItems = ref.watch(_homeProvider).news;

    return SizedBox(
      height: 240,
      child: ListView.builder(
        itemCount: newsItems?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return HomeNewsCard(newsItem: newsItems?[index]);
        },
      ),
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

class _RecommendedListview extends ConsumerWidget {
  const _RecommendedListview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recomItems = ref.watch(_homeProvider).recommendeds ?? [];
    return ListView.builder(
      itemCount: recomItems.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return RecommendedCard(recoms: recomItems[index]);
      },
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
