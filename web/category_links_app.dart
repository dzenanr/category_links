import 'dart:html';
import 'dart:json';

import 'package:category_links/category_links.dart';

LinksEntries entries;
Categories categories;

load() {
  String json = window.localStorage['category_links_with_dartling'];
  if (json == null) {
    initCategoryLinks(entries);
  } else {
    entries.fromJson(parse(json));
  }
  categories.order();
}

save() {
  window.localStorage['category_links_with_dartling'] =
      stringify(entries.toJson());
}

main() {
  try {
    var repo = new CategoryRepo();
    var domainCode = CategoryRepo.categoryDomainCode;
    var models = repo.getDomainModels(domainCode);
    var modelCode = CategoryRepo.categoryLinksModelCode;
    entries = models.getModelEntries(modelCode);
    categories = entries.categories;
    load();
  } catch (exception, stackTrace) {
    print("$exception $stackTrace");    
  }
}

