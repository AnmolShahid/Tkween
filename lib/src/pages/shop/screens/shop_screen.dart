part of '../shop_page.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<ThemeProvider>(
      builder: (context, themeProv, snapshot) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: CustomAppBar(
              context,
              enableLeading: false,
              title: AppLocalizations.of(context)!.shop,
              actions: [
                IconButton(
                  onPressed: () => Get.toNamed<dynamic>(Routes.search),
                  icon: const Icon(FeatherIcons.search),
                ),
              ],
              bottom: TabBar(
                labelStyle: theme.textTheme.headline4,
                unselectedLabelStyle: theme.textTheme.bodyText2,
                labelColor: theme.primaryColor,
                unselectedLabelColor: (themeProv.isLightTheme == true)
                    ? ColorLight.fontDisable
                    : ColorDark.fontDisable,
                tabs: const [
                  Tab(text: 'Book'),
                   Tab(text: 'E-Book'),
                  // Tab(text: AppLocalizations.of(context)!.kids),
                  // Tab(text: AppLocalizations.of(context)!.luxury),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Expanded(
                  child: ResponsiveGridList(
                    desiredItemWidth: 150,
                    minSpacing: Const.margin,

                    children: ProductList.flashSaleProductList.map((e) {
                      final product = e;
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ProductCard(product: product),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: ResponsiveGridList(
                    desiredItemWidth: 150,
                    minSpacing: Const.margin,

                    children: ProductList.allProduct.map((e) {
                      final product = e;
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ProductCard(product: product),
                      );
                    }).toList(),
                  ),
                ),
                //_BodyTabScreen(itemCount: CategoryList.categoryList(context)),
                // _BodyTabScreen(itemCount: CategoryList.categoryListTwo(context)),
                // _BodyTabScreen(itemCount: CategoryList.kidsList(context)),
                // _BodyTabScreen(itemCount: CategoryList.luxuryList(context)),
              ],
            ),
          ),
        );
      },
    );
  }
}
