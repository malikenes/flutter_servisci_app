import 'package:flutter/material.dart';
import 'package:flutter_servisci_app/product/models/recommended.dart';

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    required this.recoms,
    super.key,
  });

  final Recommended recoms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          SizedBox(
            height: 96,
            child: Image.network(recoms.image ?? ''),
          ),
          Expanded(
            child: ListTile(
              title: Text(recoms.title ?? ''),
              subtitle: Text(recoms.description ?? ''),
            ),
          ),
        ],
      ),
    );
  }
}
