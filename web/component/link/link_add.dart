import 'dart:html';
import 'dart:uri';

import 'package:category_links/category_links.dart';
import 'package:web_ui/web_ui.dart';

class LinkAdd extends WebComponent {
  Category category;
  Links links;

  add() {
    InputElement code = query("#add-link-code");
    InputElement webLink = query("#add-link-url");
    InputElement description = query("#add-link-description");
    Element message = query("#add-link-message");
    var error = false;
    message.text = '';
    if (code.value.trim() == '') {
      message.text = 'web link name is mandatory; ${message.text}';
      error = true;
    }
    if (webLink.value.trim() == '') {
      message.text = 'web link is mandatory; ${message.text}';
      error = true;
    }
    if (!error) {
      var link = new Link(links.concept);
      link.code = code.value;
      link.url = Uri.parse(webLink.value);
      link.description = description.value;
      link.category = category;
      if (links.add(link)) {
        message.text = 'added';
        var linkTable = document.query('#link-table').xtag;
        linkTable.links.order();
      } else {
        message.text = 'web link name already in use';
      }
    }
  }

}

