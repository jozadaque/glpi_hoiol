class HtmlConverte {
  static converter(String content) {
    final text = content
        .replaceAll('&#60;', '<')
        .replaceAll('&#62;', '>')
        .replaceAll('&gt;', '>');

    return text;
  }
}
