part of '../home_page.dart';

class _BuildCategoryCard extends StatelessWidget {
  const _BuildCategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(
        right: Const.space5,
        left: Const.space5,
        bottom: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(Const.radius),
        onTap: () => Get.toNamed<dynamic>(
          Routes.allProduct,
          arguments: category.name,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.35,
          padding: const EdgeInsets.all(Const.space8),
          child: SvgPicture.asset(
            category.icon!,
            color: theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
