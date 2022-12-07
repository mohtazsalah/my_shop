import 'package:flutter/material.dart';
import 'package:my_shop/constance.dart';
import 'package:my_shop/view/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> names = <String>['men' , 'women' , 'children' , 'one' , 'one'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0 , left: 20 , right: 20),
          child: Column(
            children: [
              _searchTextFormField(),
              const SizedBox(height: 30,),
              CustomText(text: 'Category',),
              const SizedBox(height: 30,),
              _listViewCategory(),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Best Selling',
                    fontSize: 18,
                  ),
                  CustomText(
                    text: 'See all',
                    fontSize: 16,
                  ),
                ],
              ),
              SizedBox(height: 30,),
              _listViewProduct(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search , color: Colors.black,),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return Container(
      height: 100,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/shoe.png'),
                ),
              ),
              const SizedBox(height: 10,),
              CustomText(
                text: names[index],
              ),
            ],
          );
        }, separatorBuilder: (context, index) => const SizedBox(width: 20,),
      ),
    );
  }

  Widget _listViewProduct() {
    return Container(
      height: 350,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
          return Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100
                  ),
                  child: Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Image.asset(
                        'assets/images/Image.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                CustomText(
                  text: 'Leather Wristwatch',
                  alignment: Alignment.bottomLeft,
                ),
                const SizedBox(height: 10,),
                CustomText(
                  text: 'Tag Heuer',
                  alignment: Alignment.bottomLeft,
                  color: Colors.grey,
                ),
                const SizedBox(height: 10,),
                CustomText(
                  text: '\$450',
                  alignment: Alignment.bottomLeft,
                  color: primaryColor,
                ),
                const SizedBox(height: 10,),
              ],
            ),
          );
        }, separatorBuilder: (context, index) => const SizedBox(width: 20,),
      ),
    );
  }
}

Widget bottomNavigationBar(){
  return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: 'Explore',
            icon: Image.asset(
                'assets/images/Icon_Explore.png',
              fit: BoxFit.contain,
              width: 20,
            )
        ),
        BottomNavigationBarItem(
          label: 'Cart',
          icon: Image.asset(
                'assets/images/Icon_Cart.png',
              fit: BoxFit.contain,
              width: 20,
            ),
        ),
        BottomNavigationBarItem(
          label: 'User',
          icon: Image.asset(
                'assets/images/Icon_User.png',
              fit: BoxFit.contain,
              width: 20,
            ),
        ),
      ],
    currentIndex: 0,
    onTap: (index){},
  );
}
