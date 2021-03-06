import 'dart:html';

import 'package:category_links/category_links.dart';
import 'package:web_ui/web_ui.dart';

class CategoryTable extends WebComponent {
  Categories categories;
  Category category;

  bool showCategoryAdd = false;
  bool showCategoryEdit = false;
  bool showCategoryLinks = false;

  add() {
    ButtonElement addCategory = query("#addCategoryButton");
    if (addCategory.text == 'Show Add') {
      showCategoryAdd = true;
      addCategory.text = 'Hide Add';
    } else {
      showCategoryAdd = false;
      addCategory.text = 'Show Add';
    }
  }

  edit(category) {
    showCategoryEdit = true;
    this.category = category;
  }

  delete(category) {
    categories.remove(category);
    showCategoryLinks = false;
  }

  showLinks(category) {
    showCategoryLinks = true;
    this.category = category;
  }

}