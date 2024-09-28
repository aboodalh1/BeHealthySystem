import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/core/widgets/desktop_drawer.dart';
import 'package:qrreader/feature/customers/presentation/manger/customer_cubit.dart';
import 'package:qrreader/feature/customers/presentation/view/widgets/customer_grid.dart';
import '../../../home_page/presentation/view/widgets/custom_elevated_button.dart';
import '../../../home_page/presentation/view/widgets/custom_search_bar.dart';

class DesktopCustomerPage extends StatelessWidget {
  const DesktopCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return BlocConsumer<CustomerCubit,CustomerState>(
        listener: ( context,  state) {},
        builder: (context, state) {
          CustomerCubit customerCubit = context.read();
          return Scaffold(
            body: Row(
              children: [
                DesktopDrawer(),
                Expanded(
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
                          CustomerGrid(
                            customerCubit: customerCubit,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
