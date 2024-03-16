part of '../home_view.dart';

class _PassiveChip extends StatelessWidget {
  const _PassiveChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Chip(
      label: Text('label passive'),
    );
  }
}

class _ActiveChip extends StatelessWidget {
  const _ActiveChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Chip(
      backgroundColor: ColorConstants.Purpleprimary,
      labelStyle: TextStyle(color: ColorConstants.white),
      label: Text('label active'),
    );
  }
}
