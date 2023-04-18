String url = 'http://127.0.0.1:8000/';
Uri getNotesUrl = Uri.parse('${url}notes/');
Uri getNoteURLFromSlug(int slug) {
  String slug2 = slug.toString();
  String url2 = getNotesUrl.toString() + slug2;
  return Uri.parse(url2);
}
