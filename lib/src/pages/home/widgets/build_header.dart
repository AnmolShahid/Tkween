part of '../home_page.dart';

class _BuildHeader extends StatelessWidget {
  const _BuildHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Const.margin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Home',
            style: _theme.textTheme.headline1!.copyWith(
              fontSize: 25,
              color: _theme.backgroundColor
            ),
          ),
        ],
      ),
    );
  }
}
