import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartfarm/core/components/size_config.dart';
import 'package:smartfarm/core/constants/my_asset_icons.dart';
import 'package:smartfarm/core/constants/my_colors.dart';
import 'package:smartfarm/screens/body_page/body_page_cubit.dart';

class BodyPageView extends StatelessWidget {
  BodyPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (_) => BodyPageCubit(),
      child:
          BlocBuilder<BodyPageCubit, BodyPageState>(builder: (context, state) {
        var _contextWatch = context.watch<BodyPageCubit>();
        var _contextRead = context.read<BodyPageCubit>();
        return Scaffold(
          body: _contextWatch.pages[_contextWatch.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              _setItem(MyAssetIcons.home, 0, _contextWatch.currentIndex),
              _setItem(MyAssetIcons.search, 1, _contextWatch.currentIndex),
              _setItem(MyAssetIcons.calendar, 2, _contextWatch.currentIndex),
              _setItem(MyAssetIcons.settings, 4, _contextWatch.currentIndex),
            ],
            onTap: (i) {
              _contextRead.changePage(i);
            },
          ),
        );
      }),
    );
  }

  BottomNavigationBarItem _setItem(
    String assetIcon,
    int index,
    int currentIndex,
  ) =>
      BottomNavigationBarItem(
        label: "",
        icon: SvgPicture.asset(
          assetIcon,
          height: getUniqueH(20.0),
          width: getUniqueW(20.0),
          color: currentIndex == index ? MyColors.primary : MyColors.grey,
        ),
      );
}
