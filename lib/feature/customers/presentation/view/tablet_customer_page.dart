import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/feature/Auth/presentation/view/widgets/tablet_widgets/tablet_custom_drawer.dart';
import 'package:qrreader/feature/customers/presentation/view/widgets/tablet/tablet_customer_grid.dart';
import '../../../../constant.dart';


import '../../../../core/util/screen_util.dart';
import '../../../home_page/presentation/view/desktop_home_page.dart';
import '../../../home_page/presentation/view/widgets/custom_elevated_button.dart';
import '../../../home_page/presentation/view/widgets/custom_search_bar.dart';
import '../manger/customer_cubit.dart';

class TabletCustomerPage extends StatelessWidget {
  const TabletCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return BlocProvider(
      create: (context) => CustomerCubit(),
      child: BlocConsumer<CustomerCubit, CustomerState>(
          listener: (context, state) {},
          builder: (context, state) {
            CustomerCubit customerCubit = context.read();
            return Scaffold(
              appBar: AppBar(backgroundColor: kPrimaryColor,),
              drawer: TabletDrawer(),
              body: Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45.0, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomElevatedButton(fill: true,
                              title: 'Select', onPressed: () {},
                            ),
                          ],
                        ),
                        const CustomSearchBar(),
                        TabletCustomerGrid(
                          customerCubit: customerCubit,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
