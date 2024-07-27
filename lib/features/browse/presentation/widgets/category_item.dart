import 'package:flutter/material.dart';
import 'package:movie_app/features/browse/presentation/pages/movieDiscover_tab.dart';
import 'package:movie_app/features/browse/presentation/widgets/movieDiscover_item.dart';
import '../../data/models/category_model.dart';
import '../../data/models/category_response.dart';
import '../../../browse/data/models/movieDiscover_response.dart';

class CategoryItem extends StatefulWidget {
  CategoryModel category;
  List<Genres> categoryApi;
  int index;

  CategoryItem({required this.category,required this.categoryApi, required this.index, super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, MovieDiscoverTab.routeName,
            arguments: MovieDiscoverItem(index: widget.index, categoryApi:widget.categoryApi ,));
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "${widget.category.imagePath}",
              ),
            )),
        child: Center(
          child: Text(
            "${widget.categoryApi[widget.index].name}",
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.black.withOpacity(0.4),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
