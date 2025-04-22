import 'package:flutter/material.dart';

class AppStyles {
  // 🎨 Colors
  static const Color primary = Colors.black;
  static const Color secondary = Colors.blue;
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.black;
  static const Color backgroundColor = Colors.white;
  static const Color dividerColor = Colors.grey;

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20, // ✅ Set font size
    fontWeight: FontWeight.bold, // ✅ Make it bold
    color: textSecondary, // ✅ Set text color
  );

  // 🏠 Home & Main Screen Styles
  static const TextStyle homeTitle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    color: textSecondary,
  );

  static const TextStyle homeSubtitle = TextStyle(
    fontSize: 23,
    color: textSecondary,
  );

  static const TextStyle homeBody = TextStyle(
    fontSize: 23,
    color: textSecondary,
  );

  static const TextStyle sectionHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle seeAllText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: secondary,
  );

  static const TextStyle categoryText = TextStyle(
    fontSize: 14,
    color: textSecondary,
  );

  static const TextStyle metalMagicTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  // 🔑 Sign-Up & Login Screen Styles
  static const TextStyle signUpHeading = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle signUpSubtitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle loginHeading = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle loginSubtitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle loginText = TextStyle(
    color: textSecondary,
    fontSize: 16,
  );

  static const TextStyle loginTextBold = TextStyle(
    color: secondary,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle orText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle seeAllStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: primary, // Blue color for visibility
  );
  // 🏷 Caption Style for image descriptions
  static const TextStyle captionStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textSecondary,
  );
  // 📌 Find Professionals Header Style
  static const TextStyle findProfessionalsHeader = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: textSecondary,
    height: 1.2,
  );

  // 📌 Shop By Category Header Style
  static const TextStyle shopCategoryHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: textSecondary,
  );
// 🏷 Vertical Scroll Title Style
  static const TextStyle verticalScrollTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textSecondary,
  );
  // 🔎 Search Bar Styles
  //static const double searchBarWidth = 500.0; // ✅ Set width
  //static const double searchBarHeight = 50.0; // ✅ Set height

// 🔹 Search Bar Styles
  static const double searchBarMaxWidth = 700.0; // ✅ Ensures max length
  static const double searchBarHeight = 50.0; // ✅ Adjusted height

// 🏷 Section Title Style
  static const TextStyle sectionTitleStyle = TextStyle(
    fontSize: 20, // Bigger than regular text
    fontWeight: FontWeight.bold,
    color: textSecondary,
  );

// 📌 Default Image Sizes for Sections
  static const double horizontalImageWidth = 120;
  static const double horizontalImageHeight = 120;

  static const double verticalImageWidth = 150;
  static const double verticalImageHeight = 150;

  static const double carouselImageWidth = 500;
  static const double carouselImageHeight = 500;

  static const double metalMagicImageWidth = 450;
  static const double metalMagicImageHeight = 500;
}
