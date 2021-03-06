part of '../home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? _searchController;

  final _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  final GlobalKey<ScaffoldState> key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<LocaleProvider>(builder: (context, locale, snapshot) {
      final lang = locale.locale ?? Localizations.localeOf(context);
      return SmartRefresher(
        controller: _refreshController,
        header: const WaterDropMaterialHeader(),
        onRefresh: () {
          Future.delayed(const Duration(seconds: 1), () {
            _refreshController.refreshCompleted();
            setState(() {});
          });
        },
        onLoading: () {
          Future.delayed(const Duration(seconds: 1), () {
            _refreshController.loadComplete();
            setState(() {});
          });
        },
        child: lang.languageCode == "ar"
            ? Scaffold(
                key: key,
                endDrawer: CustomDrawer(),
                appBar: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Theme.of(context).primaryColor),
                  iconTheme:
                      IconThemeData(color: Theme.of(context).backgroundColor),
                  backgroundColor: Theme.of(context).primaryColor,
                  titleSpacing: 0,
                  centerTitle: true,
                  title: const _BuildHeader(),
                  leading: GestureDetector(
                    child: Icon(
                      Icons.search_outlined,
                      color: theme.backgroundColor,
                      size: 26,
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Get.toNamed<dynamic>(Routes.search,
                          arguments: _searchController?.text);
                    },
                  ),
                ),
                body: SafeArea(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: 0,
                        child: ListView(
                          children: [
                            //   CarouselWithIndicatorDemo(),
                            //  const SizedBox(height: Const.space15),
                            /*   _BuildSearch(
                      controller: _searchController,
                      onSearchTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Get.toNamed<dynamic>(Routes.search,
                            arguments: _searchController?.text);
                      },
                    ),*/
                            _BuildScrollableAllProduct(
                              scrollDirection:
                                  lang.languageCode == 'ar' ? true : false,
                              itemList: ProductList.flashSaleProductList,
                              label: 'Latest books',
                              onSeeAllTap: () => Get.toNamed<dynamic>(
                                Routes.allProduct,
                                arguments: AppLocalizations.of(context)!.all,
                              ),
                            ),
                            const SizedBox(height: Const.space15),
                            const _BuildScrollableCategory(),
                            const SizedBox(height: Const.space25),
                            _BuildScrollableProduct(
                              scrollDirection:
                                  lang.languageCode == 'ar' ? true : false,
                              itemList: ProductList.flashSaleProductList,
                              label: 'Latest books',
                              onSeeAllTap: () => Get.toNamed<dynamic>(
                                Routes.allProduct,
                                arguments: AppLocalizations.of(context)!.all,
                              ),
                            ),
                            const SizedBox(height: Const.space25),
                            _BuildScrollableProduct(
                              scrollDirection:
                                  lang.languageCode == 'ar' ? true : false,
                              itemList: ProductList.allProduct,
                              label: 'Books on sale',
                              onSeeAllTap: () {},
                            ),

                            const SizedBox(height: Const.space25),

                            _BuildScrollableProduct(
                              scrollDirection:
                                  lang.languageCode == 'ar' ? true : false,
                              itemList: ProductList.flashSaleProductList,
                              label: 'Featured books',
                              onSeeAllTap: () => Get.toNamed<dynamic>(
                                Routes.allProduct,
                                arguments: AppLocalizations.of(context)!.all,
                              ),
                            ),
                            const SizedBox(height: Const.space25),
                            _BuildScrollableProduct(
                              scrollDirection:
                                  lang.languageCode == 'ar' ? true : false,
                              itemList: ProductList.allProduct,
                              label: 'Top sold books',
                              onSeeAllTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Scaffold(
                key: key,
                drawer: CustomDrawer(),
                appBar: AppBar(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Theme.of(context).primaryColor),
                    iconTheme:
                        IconThemeData(color: Theme.of(context).backgroundColor),
                    backgroundColor: Theme.of(context).primaryColor,
                    titleSpacing: 0,
                    centerTitle: true,
                    title: const _BuildHeader(),
                    actions: [
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          child: Icon(
                            Icons.search_outlined,
                            color: theme.backgroundColor,
                            size: 26,
                          ),
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Get.toNamed<dynamic>(Routes.search,
                                arguments: _searchController?.text);
                          },
                        ),
                      )
                    ]),
                body: SafeArea(
                  child: Stack(

                    children: [
                      Positioned.fill(
                        top: 0,
                        child: ListView(
                          
                          children: [
                            //                 CarouselWithIndicatorDemo(),
                            //  const SizedBox(height: Const.space15),
                            /* _BuildSearch(
                      controller: _searchController,
                      onSearchTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        Get.toNamed<dynamic>(Routes.search,
                            arguments: _searchController?.text);
                      },
                    ),*/

                            _BuildScrollableAllProduct(
                              
                              scrollDirection:
                                  lang.languageCode == 'ar' ? true : false,
                              itemList: ProductList.flashSaleProductList,
                              label: 'Latest books',
                              onSeeAllTap: () => Get.toNamed<dynamic>(
                                Routes.allProduct,
                                arguments: AppLocalizations.of(context)!.all,
                              ),
                            ),
                            const SizedBox(height: Const.space15),
                            const _BuildScrollableCategory(),
                            const SizedBox(height: Const.space25),
                            _BuildScrollableProduct(
                              scrollDirection:
                                  lang.languageCode == 'ar' ? true : false,
                              itemList: ProductList.flashSaleProductList,
                              label: 'Latest books',
                              onSeeAllTap: () => Get.toNamed<dynamic>(
                                Routes.allProduct,
                                arguments: AppLocalizations.of(context)!.all,
                              ),
                            ),
                            const SizedBox(height: Const.space25),
                            _BuildScrollableProduct(
                              scrollDirection:
                                  lang.languageCode == 'ar' ? true : false,
                              itemList: ProductList.allProduct,
                              label: 'Books on sale',
                              onSeeAllTap: () {},
                            ),

                            const SizedBox(height: Const.space25),

                            _BuildScrollableProduct(
                              scrollDirection:
                                  lang.languageCode == 'ar' ? true : false,
                              itemList: ProductList.flashSaleProductList,
                              label: 'Featured books',
                              onSeeAllTap: () => Get.toNamed<dynamic>(
                                Routes.allProduct,
                                arguments: AppLocalizations.of(context)!.all,
                              ),
                            ),
                            const SizedBox(height: Const.space25),
                            _BuildScrollableProduct(
                              scrollDirection:
                                  lang.languageCode == 'ar' ? true : false,
                              itemList: ProductList.allProduct,
                              label: 'Top sold books',
                              onSeeAllTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
