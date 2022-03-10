part of '../home_page.dart';

class _BuildScrollableAllProduct extends StatelessWidget {
  final List<ProductModel> itemList;
  final String label;
  final bool scrollDirection;
  final VoidCallback onSeeAllTap;

  const _BuildScrollableAllProduct({
    Key? key,
    required this.itemList,
    required this.label,
    required this.scrollDirection,
    required this.onSeeAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  const SizedBox(height: Const.space12),
        Container(
          padding: EdgeInsets.all(9),
          color: Color(0xFF880032),
          width: Screens.width(context),
          height: 300,
          child: ImageSlideshow(
            /// Width of the [ImageSlideshow].
            width: double.infinity,

            /// Height of the [ImageSlideshow].
            height: 200,

            /// The page to show when first creating the [ImageSlideshow].
            initialPage: 0,

            /// The color to paint the indicator.
            indicatorColor: Colors.blue,

            /// The color to paint behind th indicator.
            indicatorBackgroundColor: Colors.grey,

            /// The widgets to display in the [ImageSlideshow].
            /// Add the sample image file into the images folder
            children: [
              // for (int i = 0; i >= itemList.length; i++)
              _BuildAllProductCard(product: itemList[0]),
              _BuildAllProductCard(product: itemList[1]),
              _BuildAllProductCard(product: itemList[2]),
              _BuildAllProductCard(product: itemList[3]),
              /*  ListView.builder(
                  reverse: scrollDirection,
                  itemCount: itemList.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: Const.margin),
                  itemBuilder: (context, index) {
                    final product = itemList[index];
                    return _BuildAllProductCard(product: product);
                  },
                ),*/
            ],

            /// Called whenever the page in the center of the viewport changes.
            onPageChanged: (value) {
              print('Page changed: $value');
            },

            /// Auto scroll interval.
            /// Do not auto scroll with null or 0.
            autoPlayInterval: 3000,

            /// Loops back to first slide.
            isLoop: true,
          ),
        )
      ],
    );
  }
}
