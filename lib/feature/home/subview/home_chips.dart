part of '../home_view.dart';

class _PassiveChip extends StatelessWidget {
  const _PassiveChip(this.tag,
    
  );
  final Tag tag;
  
  @override
  Widget build(BuildContext context) {
    return  Chip(
      label: Text(tag.name!),
    );
  }
}

class _ActiveChip extends StatelessWidget {
  const _ActiveChip(this.tag);
  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return  Chip(
      backgroundColor: ColorConstants.Purpleprimary,
      labelStyle: const TextStyle(color: ColorConstants.white),
      label: Text(tag.name!),
    );
  }
}
