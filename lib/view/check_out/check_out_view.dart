import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/constance.dart';
import 'package:my_shop/core/viewModel/checkout_view_model.dart';
import 'package:my_shop/helper/enum.dart';
import 'package:my_shop/view/control_view.dart';
import 'package:my_shop/view/widgets/add_address_widget.dart';
import 'package:my_shop/view/widgets/custom_button.dart';
import 'package:my_shop/view/widgets/delivery_time_widget.dart';
import 'package:my_shop/view/widgets/summary_widget.dart';
import 'package:status_change/status_change.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel() ?? Get.put(CheckOutViewModel()),
      builder:(controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Order Status",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            onPressed: () { 
              Get.to(ControlView());
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: 100,
                child: StatusChange.tileBuilder(
                  theme: StatusChangeThemeData(
                    direction: Axis.horizontal,
                    connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
                  ),
                  builder: StatusChangeTileBuilder.connected(
                    itemWidth: (_) => MediaQuery.of(context).size.width / _processes.length,
                    contentWidgetBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'add content here',
                          style: TextStyle(
                            color: Colors.blue, // change color with dynamic color --> can find it with example section
                          ),
                        ),
                      );
                    },
                    nameWidgetBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'your text ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controller.getColor(index),
                          ),
                        ),
                      );
                    },
                    indicatorWidgetBuilder: (_, index) {
                      if (index <= controller.index) {
                        return DotIndicator(
                          size: 35.0,
                          border: Border.all(color: Colors.green, width: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const OutlinedDotIndicator(
                          size: 30,
                          borderWidth: 1.0,
                          color: todoColor,
                        );
                      }
                    },
                    lineWidgetBuilder: (index) {
                      if (index > 0) {
                        if (index == controller.index) {
                          final prevColor = controller.getColor(index - 1);
                          final color = controller.getColor(index);
                          var gradientColors;
                          gradientColors = [
                            prevColor,
                            Color.lerp(prevColor, color, 0.5)
                          ];
                          return DecoratedLineConnector(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                            ),
                          );
                        } else {
                          return SolidLineConnector(
                            color: controller.getColor(index),
                          );
                        }
                      } else {
                        return null;
                      }
                    },
                    itemCount: _processes.length,
                  ),
                ),
              ),
            ),
            controller.pages == Pages.DeliveryTime
                ? DeliveryTimeWidget()
                : controller.pages == Pages.AddAddress
                ? AddAddressWidget()
                : SummaryWidget(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: CustomButton(
                    height: 60,
                    width: 200,
                    text: 'Next',
                    onPress: (){
                      controller.changeIndex(controller.index + 1);
                    },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summer',
];
