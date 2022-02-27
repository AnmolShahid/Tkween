part of '../home_page.dart';

class _BuildAppBar extends StatelessWidget {
   _BuildAppBar({Key? key,required this.gk}) : super(key: key);
  GlobalKey<ScaffoldState> gk ; // Create a key

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Positioned(
      top: 0,
      right: 3,
      height: 60,
      child: GestureDetector(
          onTap: (){
            gk.currentState!.openEndDrawer();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.menu,color: _theme.primaryColor,size: 28,),
          )),
    );
  }
}
