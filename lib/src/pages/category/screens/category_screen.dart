  part of '../category_page.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<ThemeProvider>(
      builder: (context, themeProv, snapshot){
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
                bottom: TabBar(
                  labelStyle: theme.textTheme.headline4,
                  unselectedLabelStyle: theme.textTheme.bodyText2,
                  labelColor: theme.primaryColor,
                  unselectedLabelColor: (themeProv.isLightTheme == true)
                      ? ColorLight.fontDisable
                      : ColorDark.fontDisable,
                  tabs: const [
                    Tab(text: 'E-Book'),
                    Tab(text: 'Paper-Book'),
                    //Tab(text: 'Fiction'),
                    // Tab(text: AppLocalizations.of(context)!.kids),
                    // Tab(text: AppLocalizations.of(context)!.luxury),
                  ],
                ),
                leading: Container(),
            backgroundColor: Theme.of(context).backgroundColor,
            title:Text(AppLocalizations.of(context)!.categories,style: TextStyle(color: Colors.black),),
          ),
          body: TabBarView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: Const.space12),
                Container(
                  width: Screens.width(context),
                  height: 400,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Const.margin,
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: CategoryList.categoryListTwo(context).map((e){
                      final category = e;
                      return Card(
                        margin: const EdgeInsets.only(
                          right: Const.space5,
                          left:Const.space5 ,
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
                            width:MediaQuery.of(context).size.width/2.35,
                            padding: const EdgeInsets.all(Const.space8),
                            child: Column(
                              children: [
                                SvgPicture.asset(category.icon!, color: ColorLight.primary,width: 40,),
                                SizedBox(height: 2,),
                                Text(category.name.toString())
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: Const.space12),
                Container(
                  width: Screens.width(context),
                  height: 400,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Const.margin,
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: CategoryList.categoryListTwo(context).map((e){
                      final category = e;
                      return Card(
                        margin: const EdgeInsets.only(
                          right: Const.space5,
                          left:Const.space5 ,
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
                            width:MediaQuery.of(context).size.width/2.35,
                            padding: const EdgeInsets.all(Const.space8),
                            child: Column(
                              children: [
                                SvgPicture.asset(category.icon!, color: ColorLight.primary,width: 40,),
                                SizedBox(height: 2,),
                                Text(category.name.toString())
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),

            // Expanded(
            //   child: ResponsiveGridList(
            //     desiredItemWidth: 150,
            //     minSpacing: Const.margin,
            //
            //     children: ProductList.flashSaleProductList.map((e) {
            //       final product = e;
            //       return Padding(
            //         padding: const EdgeInsets.only(top: 8.0),
            //         child: ProductCard(product: product),
            //       );
            //     }).toList(),
            //   ),
            // ),

            // Expanded(
            //   child: ResponsiveGridList(
            //     desiredItemWidth: 150,
            //     minSpacing: Const.margin,
            //
            //     children: ProductList.allProduct.map((e) {
            //       final product = e;
            //       return Padding(
            //         padding: const EdgeInsets.only(top: 8.0),
            //         child: ProductCard(product: product),
            //       );
            //     }).toList(),
            //   ),
            // ),
            // Expanded(
            //   child: ResponsiveGridList(
            //     desiredItemWidth: 150,
            //     minSpacing: Const.margin,
            //
            //     children: ProductList.flashSaleProductList.map((e) {
            //       final product = e;
            //       return Padding(
            //         padding: const EdgeInsets.only(top: 8.0),
            //         child: ProductCard(product: product),
            //       );
            //     }).toList(),
            //   ),
            // ),

          ],),
        )
        );
      },
    );
  }
}
