import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/features/browse/data/models/category_model.dart';
import 'package:movie_app/features/browse/presentation/widgets/category_item.dart';
import '../../../../core/api/api_manager.dart';

class BrowseTab extends StatelessWidget {
  static const String routeName = 'browseTab';

  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 22, left: 16),
              child: Text(
                "Browse Category",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            FutureBuilder(
                future: ApiManager.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }
                  var categories = snapshot.data?.genres ?? [];
                  return Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 20, right: 20),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 35,
                          crossAxisSpacing: 25,
                          mainAxisExtent: 105,
                        ),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, index) => CategoryItem(
                          categoryApi: categories,
                          category: CategoryModel.categories[index],
                          index: index,
                        ),
                        itemCount: CategoryModel.categories.length,
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
