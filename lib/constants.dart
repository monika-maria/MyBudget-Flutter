import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFC0ADDB); //Color(0xFF63D3FF);
const kSecondaryColor = Color(0xFFC0ADDB); //Color(0xFFBE80FF);
//#C0ADDB
//Color(0xFFEE4387);

// Tekst w AppBar
const kAppBarTextStyle = TextStyle(
  fontSize: 23,
  color: Colors.white,
);

// Mniejszy tekst w AppBar
const kAppBarSmallerTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);

// Lista kategorii
const kCategoryTitleTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFFC0ADDB),
  fontFamily: 'Lato',
  fontWeight: FontWeight.w600,
);

const kCategorySubtitleTextStyle = TextStyle(
  fontSize: 14,
  color: Color(0xFFC0ADDB),
  fontFamily: 'Lato',
);

//---------------------------//
const kTabsTextStyle =
    TextStyle(fontSize: 16, fontFamily: 'Lato', fontWeight: FontWeight.w600);

// Tytuły
const kTitleTextStyle = TextStyle(
  fontSize: 28,
  color: Color(0xFFC0ADDB),
  fontFamily: 'Lato',
  fontWeight: FontWeight.w600,
);

// Nagłówki
const kSubtitleTextStyle = TextStyle(
  fontSize: 16,
  color: Color(0xFFC0ADDB),
  fontFamily: 'Lato',
);

// Treść, zwykły tekst
const kPlainTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.white,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w600,
);

// Tekst w TabBar
const kTabBarTextStyle = TextStyle(
  fontSize: 16,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w600,
);

// Tytuły artykułów na liście
const kArticleListTitleTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w600,
);

// Zajawka
const kArticleListSubtitleTextStyle = TextStyle(
  fontSize: 12,
  color: Colors.white,
  fontFamily: 'Lato',
);

// Tytuły artykułów na liście
const kArticleTitleTextStyle = TextStyle(
  fontSize: 24,
  color: Colors.white,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w600,
);

// Informacje o artykule
const kArticleTagsTextStyle = TextStyle(
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Lato',
);

const kArticleAuthorTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Lato',
);

// Informacje o artykule
const kArticleDateTextStyle = TextStyle(
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Lato',
);

// Treść artykułu
const kArticleDescTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontFamily: 'Lato',
);

const kSearchBarTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  letterSpacing: 1,
);

const kAboutTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontFamily: 'Lato',
  fontWeight: FontWeight.w600,
);

//uzywane
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFC0ADDB), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF660066), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
