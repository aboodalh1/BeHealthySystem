import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              drawer: Row(
                children: [
                  Container(
                    color: kPrimaryColor,
                    height: double.infinity,
                    width: ScreenSizeUtil.screenWidth * 0.3,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text('Be Healthy',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300)),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomTextButton(
                          function: () {},
                          icon: Icons.home_filled,
                          title: 'Home',
                        ),
                        CustomTextButton(
                          function: () {},
                          icon: Icons.person,
                          title: 'Customers',
                        ),
                        CustomTextButton(
                          function: () {},
                          icon: Icons.report,
                          title: 'Reports',
                        ),
                        CustomTextButton(
                          function: () {},
                          icon: Icons.shopping_bag_rounded,
                          title: 'Bags',
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Divider(
                            height: 0.2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomTextButton(
                            function: () {
                              Navigator.of(context).pushNamed('sign_in_page');
                            },
                            title: "Sign out",
                            icon: Icons.login,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
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
