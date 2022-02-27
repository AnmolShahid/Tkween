part of '../home_page.dart';

class _BuildScrollableCategory extends StatelessWidget {
  const _BuildScrollableCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: Const.space12),
        Container(
          width: Screens.width(context),
          height: 60,
          padding: const EdgeInsets.symmetric(
            horizontal: Const.margin,
          ),
          child: ListView.builder(
            itemCount: CategoryList.categoryList(context).length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,

            itemBuilder: (context, index) {
              final category = CategoryList.categoryList(context)[index];
              return _BuildCategoryCard(
                category: category,
              );
            },
          ),
        ),
      ],
    );
  }
}
