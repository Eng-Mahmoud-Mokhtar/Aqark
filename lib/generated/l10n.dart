// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome, `
  String get welcome {
    return Intl.message('Welcome, ', name: 'welcome', desc: '', args: []);
  }

  /// `Find the best place!`
  String get best {
    return Intl.message(
      'Find the best place!',
      name: 'best',
      desc: '',
      args: [],
    );
  }

  /// `Select App Language`
  String get selectAppLanguage {
    return Intl.message(
      'Select App Language',
      name: 'selectAppLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Sell Your Property`
  String get sellYourProperty {
    return Intl.message(
      'Sell Your Property',
      name: 'sellYourProperty',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Favorite`
  String get favorite {
    return Intl.message('Favorite', name: 'favorite', desc: '', args: []);
  }

  /// `Rate Us`
  String get rateUs {
    return Intl.message('Rate Us', name: 'rateUs', desc: '', args: []);
  }

  /// `About us`
  String get aboutUs {
    return Intl.message('About us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Terms and conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bottomHome {
    return Intl.message('Home', name: 'bottomHome', desc: '', args: []);
  }

  /// `Explore`
  String get bottomExplore {
    return Intl.message('Explore', name: 'bottomExplore', desc: '', args: []);
  }

  /// `More`
  String get bottomMore {
    return Intl.message('More', name: 'bottomMore', desc: '', args: []);
  }

  /// `Search by area`
  String get searchforProperty {
    return Intl.message(
      'Search by area',
      name: 'searchforProperty',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommended {
    return Intl.message('Recommended', name: 'recommended', desc: '', args: []);
  }

  /// `See all`
  String get seeAll {
    return Intl.message('See all', name: 'seeAll', desc: '', args: []);
  }

  /// `Manage Favorites`
  String get favorites {
    return Intl.message(
      'Manage Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `No Favorite Yet`
  String get nofavorites {
    return Intl.message(
      'No Favorite Yet',
      name: 'nofavorites',
      desc: '',
      args: [],
    );
  }

  /// `Start favoriting compounds to help you keep track of them later .`
  String get subNofavorites {
    return Intl.message(
      'Start favoriting compounds to help you keep track of them later .',
      name: 'subNofavorites',
      desc: '',
      args: [],
    );
  }

  /// `At Building Knowledge, we are committed to protecting and respecting user privacy. This Privacy Policy is designed to inform you about the privacy practices we follow, the data and information we collect about you, how we obtain that information, and how we use, share, and process it in the course of conducting our business through our application.`
  String get section1 {
    return Intl.message(
      'At Building Knowledge, we are committed to protecting and respecting user privacy. This Privacy Policy is designed to inform you about the privacy practices we follow, the data and information we collect about you, how we obtain that information, and how we use, share, and process it in the course of conducting our business through our application.',
      name: 'section1',
      desc: '',
      args: [],
    );
  }

  /// `This Privacy Policy applies to the Building Knowledge application and all subsidiary services associated with the company or operating under the name Building Knowledge. By accessing and using our application or the services we provide, you acknowledge that you have read and agree to the collection and processing of your personal data in accordance with this Privacy Policy. We will notify you of any changes to the way we process your data if such changes occur at any time.`
  String get section2 {
    return Intl.message(
      'This Privacy Policy applies to the Building Knowledge application and all subsidiary services associated with the company or operating under the name Building Knowledge. By accessing and using our application or the services we provide, you acknowledge that you have read and agree to the collection and processing of your personal data in accordance with this Privacy Policy. We will notify you of any changes to the way we process your data if such changes occur at any time.',
      name: 'section2',
      desc: '',
      args: [],
    );
  }

  /// `Key Terms`
  String get section3 {
    return Intl.message('Key Terms', name: 'section3', desc: '', args: []);
  }

  /// `To help clarify our Privacy Policy as much as possible, these terms will help you understand what we mean:`
  String get section4 {
    return Intl.message(
      'To help clarify our Privacy Policy as much as possible, these terms will help you understand what we mean:',
      name: 'section4',
      desc: '',
      args: [],
    );
  }

  /// `- Company: The terms 'Company,' 'we,' 'our,' and 'us' in this Privacy Policy refer to Building Knowledge, located at (47, North 90th Street, New Cairo, Egypt) (Tower 2, Gezira Plaza, 6th of October, Egypt), which is responsible for your information under this Privacy Policy.`
  String get section5 {
    return Intl.message(
      '- Company: The terms \'Company,\' \'we,\' \'our,\' and \'us\' in this Privacy Policy refer to Building Knowledge, located at (47, North 90th Street, New Cairo, Egypt) (Tower 2, Gezira Plaza, 6th of October, Egypt), which is responsible for your information under this Privacy Policy.',
      name: 'section5',
      desc: '',
      args: [],
    );
  }

  /// `- Country: The location of Building Knowledge or its owners/founders, in this case, Egypt.`
  String get section6 {
    return Intl.message(
      '- Country: The location of Building Knowledge or its owners/founders, in this case, Egypt.',
      name: 'section6',
      desc: '',
      args: [],
    );
  }

  /// `- Customer: Refers to any company, organization, or individual who accesses and uses our application or the services we provide.`
  String get section7 {
    return Intl.message(
      '- Customer: Refers to any company, organization, or individual who accesses and uses our application or the services we provide.',
      name: 'section7',
      desc: '',
      args: [],
    );
  }

  /// `- Device: Any internet-connected device such as a phone, tablet, computer, or any other device used to access the Building Knowledge application and use its services.`
  String get section8 {
    return Intl.message(
      '- Device: Any internet-connected device such as a phone, tablet, computer, or any other device used to access the Building Knowledge application and use its services.',
      name: 'section8',
      desc: '',
      args: [],
    );
  }

  /// `- IP Address: A number assigned to each device connected to the internet, known as an Internet Protocol (IP) address. These numbers are usually assigned in geographic blocks and can often be used to identify the location from which the device is connecting to the internet.`
  String get section9 {
    return Intl.message(
      '- IP Address: A number assigned to each device connected to the internet, known as an Internet Protocol (IP) address. These numbers are usually assigned in geographic blocks and can often be used to identify the location from which the device is connecting to the internet.',
      name: 'section9',
      desc: '',
      args: [],
    );
  }

  /// `- Personal Data: Any personal information we store about you, including your national ID or any identification documents.`
  String get section10 {
    return Intl.message(
      '- Personal Data: Any personal information we store about you, including your national ID or any identification documents.',
      name: 'section10',
      desc: '',
      args: [],
    );
  }

  /// `- Service: Refers to the service provided by Building Knowledge as described in this policy.`
  String get section11 {
    return Intl.message(
      '- Service: Refers to the service provided by Building Knowledge as described in this policy.',
      name: 'section11',
      desc: '',
      args: [],
    );
  }

  /// `- You: Any person or entity who accesses and uses our application or the services we provide.`
  String get section12 {
    return Intl.message(
      '- You: Any person or entity who accesses and uses our application or the services we provide.',
      name: 'section12',
      desc: '',
      args: [],
    );
  }

  /// `What Information Do We Collect?`
  String get section13 {
    return Intl.message(
      'What Information Do We Collect?',
      name: 'section13',
      desc: '',
      args: [],
    );
  }

  /// `We collect personal information and data in the course of conducting our business, when you use our application, register on it, place an order, subscribe to newsletters, respond to surveys, or fill out forms. This information may include:`
  String get section14 {
    return Intl.message(
      'We collect personal information and data in the course of conducting our business, when you use our application, register on it, place an order, subscribe to newsletters, respond to surveys, or fill out forms. This information may include:',
      name: 'section14',
      desc: '',
      args: [],
    );
  }

  /// `- Your name.`
  String get section15 {
    return Intl.message('- Your name.', name: 'section15', desc: '', args: []);
  }

  /// `- Your phone number.`
  String get section16 {
    return Intl.message(
      '- Your phone number.',
      name: 'section16',
      desc: '',
      args: [],
    );
  }

  /// `- Your email address.`
  String get section17 {
    return Intl.message(
      '- Your email address.',
      name: 'section17',
      desc: '',
      args: [],
    );
  }

  /// `How Do We Use the Information We Collect?`
  String get section18 {
    return Intl.message(
      'How Do We Use the Information We Collect?',
      name: 'section18',
      desc: '',
      args: [],
    );
  }

  /// `We may use the information we collect from you in the following ways:`
  String get section19 {
    return Intl.message(
      'We may use the information we collect from you in the following ways:',
      name: 'section19',
      desc: '',
      args: [],
    );
  }

  /// `- To provide better service to users, maintain internal records, and improve our products and services.`
  String get section20 {
    return Intl.message(
      '- To provide better service to users, maintain internal records, and improve our products and services.',
      name: 'section20',
      desc: '',
      args: [],
    );
  }

  /// `- To enhance your experience (your information helps us respond better to your individual needs).`
  String get section21 {
    return Intl.message(
      '- To enhance your experience (your information helps us respond better to your individual needs).',
      name: 'section21',
      desc: '',
      args: [],
    );
  }

  /// `- To improve our application (we continually strive to improve our offerings based on the information and feedback we receive from you).`
  String get section22 {
    return Intl.message(
      '- To improve our application (we continually strive to improve our offerings based on the information and feedback we receive from you).',
      name: 'section22',
      desc: '',
      args: [],
    );
  }

  /// `- To enhance customer service (your information helps us respond more effectively to customer service requests and support needs).`
  String get section23 {
    return Intl.message(
      '- To enhance customer service (your information helps us respond more effectively to customer service requests and support needs).',
      name: 'section23',
      desc: '',
      args: [],
    );
  }

  /// `Do We Share the Information We Collect with Third Parties?`
  String get section24 {
    return Intl.message(
      'Do We Share the Information We Collect with Third Parties?',
      name: 'section24',
      desc: '',
      args: [],
    );
  }

  /// `We may share the information we collect, whether personal or non-personal, with third parties such as specific real estate agents, real estate brokerage firms, agents, developers, or other service providers we work with, when requested by the user or as part of the user's use of the application. For example, if a user inquires about a property, we may transfer the user's personal information to the real estate agents handling the sale or rental of that property.`
  String get section25 {
    return Intl.message(
      'We may share the information we collect, whether personal or non-personal, with third parties such as specific real estate agents, real estate brokerage firms, agents, developers, or other service providers we work with, when requested by the user or as part of the user\'s use of the application. For example, if a user inquires about a property, we may transfer the user\'s personal information to the real estate agents handling the sale or rental of that property.',
      name: 'section25',
      desc: '',
      args: [],
    );
  }

  /// `Where and When Is Customer and End-User Information Collected?`
  String get section26 {
    return Intl.message(
      'Where and When Is Customer and End-User Information Collected?',
      name: 'section26',
      desc: '',
      args: [],
    );
  }

  /// `Building Knowledge collects the personal information that you provide to us. We may also receive personal information about you from third parties as described above.`
  String get section27 {
    return Intl.message(
      'Building Knowledge collects the personal information that you provide to us. We may also receive personal information about you from third parties as described above.',
      name: 'section27',
      desc: '',
      args: [],
    );
  }

  /// `How Do We Use Your Email Address?`
  String get section28 {
    return Intl.message(
      'How Do We Use Your Email Address?',
      name: 'section28',
      desc: '',
      args: [],
    );
  }

  /// `By providing your email address on the application, you agree to receive emails from us. You can unsubscribe from any email list at any time by clicking the unsubscribe link or any other opt-out option included in the relevant email.`
  String get section29 {
    return Intl.message(
      'By providing your email address on the application, you agree to receive emails from us. You can unsubscribe from any email list at any time by clicking the unsubscribe link or any other opt-out option included in the relevant email.',
      name: 'section29',
      desc: '',
      args: [],
    );
  }

  /// `How Long Do We Retain Your Information?`
  String get section30 {
    return Intl.message(
      'How Long Do We Retain Your Information?',
      name: 'section30',
      desc: '',
      args: [],
    );
  }

  /// `The duration for which we retain your personal information varies. Typically, we do not retain personal information longer than necessary to respond to inquiries or complaints or to improve the services we provide.`
  String get section31 {
    return Intl.message(
      'The duration for which we retain your personal information varies. Typically, we do not retain personal information longer than necessary to respond to inquiries or complaints or to improve the services we provide.',
      name: 'section31',
      desc: '',
      args: [],
    );
  }

  /// `Can My Information Be Transferred to Other Countries?`
  String get section32 {
    return Intl.message(
      'Can My Information Be Transferred to Other Countries?',
      name: 'section32',
      desc: '',
      args: [],
    );
  }

  /// `The information and data we collect from users may be transferred, stored, and hosted outside the country from which the information originates. We are committed to taking appropriate measures to ensure the protection and security of your personal information when it is transferred outside your country.`
  String get section33 {
    return Intl.message(
      'The information and data we collect from users may be transferred, stored, and hosted outside the country from which the information originates. We are committed to taking appropriate measures to ensure the protection and security of your personal information when it is transferred outside your country.',
      name: 'section33',
      desc: '',
      args: [],
    );
  }

  /// `Is the Information Collected Through Building Knowledge Secure?`
  String get section34 {
    return Intl.message(
      'Is the Information Collected Through Building Knowledge Secure?',
      name: 'section34',
      desc: '',
      args: [],
    );
  }

  /// `Ensuring the security of your personal information and preventing unauthorized access is a top priority for us. We are committed to taking all reasonably necessary steps to protect your personal information from unauthorized access, use, alteration, disclosure, or destruction.`
  String get section35 {
    return Intl.message(
      'Ensuring the security of your personal information and preventing unauthorized access is a top priority for us. We are committed to taking all reasonably necessary steps to protect your personal information from unauthorized access, use, alteration, disclosure, or destruction.',
      name: 'section35',
      desc: '',
      args: [],
    );
  }

  /// `Can I Update or Correct My Information?`
  String get section36 {
    return Intl.message(
      'Can I Update or Correct My Information?',
      name: 'section36',
      desc: '',
      args: [],
    );
  }

  /// `Under applicable law, you have the right to request access to the personal data we have collected about you for the purpose of reviewing, modifying, or requesting its deletion. You can contact us to:`
  String get section37 {
    return Intl.message(
      'Under applicable law, you have the right to request access to the personal data we have collected about you for the purpose of reviewing, modifying, or requesting its deletion. You can contact us to:',
      name: 'section37',
      desc: '',
      args: [],
    );
  }

  /// `1. Update or correct your personal identification information.`
  String get section38 {
    return Intl.message(
      '1. Update or correct your personal identification information.',
      name: 'section38',
      desc: '',
      args: [],
    );
  }

  /// `2. Change your preferences regarding communications and other information you receive from us.`
  String get section39 {
    return Intl.message(
      '2. Change your preferences regarding communications and other information you receive from us.',
      name: 'section39',
      desc: '',
      args: [],
    );
  }

  /// `3. Delete the personal information stored in our systems.`
  String get section40 {
    return Intl.message(
      '3. Delete the personal information stored in our systems.',
      name: 'section40',
      desc: '',
      args: [],
    );
  }

  /// `Children's Privacy`
  String get section41 {
    return Intl.message(
      'Children\'s Privacy',
      name: 'section41',
      desc: '',
      args: [],
    );
  }

  /// `We are committed to protecting the privacy of children. We do not target anyone under the age of 13 through our application. If we learn that we have collected personal data from anyone under the age of 13 without parental consent, we will take steps to remove that information from our servers.`
  String get section42 {
    return Intl.message(
      'We are committed to protecting the privacy of children. We do not target anyone under the age of 13 through our application. If we learn that we have collected personal data from anyone under the age of 13 without parental consent, we will take steps to remove that information from our servers.',
      name: 'section42',
      desc: '',
      args: [],
    );
  }

  /// `Changes to Our Privacy Policy`
  String get section43 {
    return Intl.message(
      'Changes to Our Privacy Policy',
      name: 'section43',
      desc: '',
      args: [],
    );
  }

  /// `We may update this Privacy Policy from time to time as deemed necessary. In the event of any material changes, we will notify users as required by applicable law.`
  String get section44 {
    return Intl.message(
      'We may update this Privacy Policy from time to time as deemed necessary. In the event of any material changes, we will notify users as required by applicable law.',
      name: 'section44',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get section45 {
    return Intl.message('Contact Us', name: 'section45', desc: '', args: []);
  }

  /// `If you have any questions, please feel free to contact us via email: info@buildingknowledge.com`
  String get section46 {
    return Intl.message(
      'If you have any questions, please feel free to contact us via email: info@buildingknowledge.com',
      name: 'section46',
      desc: '',
      args: [],
    );
  }

  /// `By using the Building Knowledge application (including all its features—whether mobile or otherwise—owned and operated by Building Knowledge), as well as the related data and services (collectively referred to as 'Services'), you agree to be bound by the following Terms of Use, which may be updated from time to time.`
  String get terms_section1 {
    return Intl.message(
      'By using the Building Knowledge application (including all its features—whether mobile or otherwise—owned and operated by Building Knowledge), as well as the related data and services (collectively referred to as \'Services\'), you agree to be bound by the following Terms of Use, which may be updated from time to time.',
      name: 'terms_section1',
      desc: '',
      args: [],
    );
  }

  /// `Permitted Use\nUnless you are a real estate or financial loan professional acting in your professional capacity, you agree to use the Services for personal purposes only. Commercial use is limited to transactions conducted on your own behalf. Real estate or loan professionals may use the Services to provide information to clients or act on their behalf (such as listing a property for sale). However, loan professionals are prohibited from using Building Knowledge's information to make loan-related decisions.`
  String get terms_section2 {
    return Intl.message(
      'Permitted Use\nUnless you are a real estate or financial loan professional acting in your professional capacity, you agree to use the Services for personal purposes only. Commercial use is limited to transactions conducted on your own behalf. Real estate or loan professionals may use the Services to provide information to clients or act on their behalf (such as listing a property for sale). However, loan professionals are prohibited from using Building Knowledge\'s information to make loan-related decisions.',
      name: 'terms_section2',
      desc: '',
      args: [],
    );
  }

  /// `1. Acceptable Use\nYou agree not to use the Services in an unlawful manner or in a way that harms Building Knowledge, service providers, suppliers, or other users. Prohibited activities include distributing spam, chain letters, pyramid schemes, or similar communications. You may not impersonate another person or misrepresent your relationship with any entity.`
  String get terms_section3 {
    return Intl.message(
      '1. Acceptable Use\nYou agree not to use the Services in an unlawful manner or in a way that harms Building Knowledge, service providers, suppliers, or other users. Prohibited activities include distributing spam, chain letters, pyramid schemes, or similar communications. You may not impersonate another person or misrepresent your relationship with any entity.',
      name: 'terms_section3',
      desc: '',
      args: [],
    );
  }

  /// `2. Automated Queries\nSending automated queries (such as data scraping, spiders, bots, or crawlers) is prohibited unless you have written permission from Building Knowledge. Public search engines may index the Services only within the limits permitted by applicable copyright law and must not bypass security measures like CAPTCHA.`
  String get terms_section4 {
    return Intl.message(
      '2. Automated Queries\nSending automated queries (such as data scraping, spiders, bots, or crawlers) is prohibited unless you have written permission from Building Knowledge. Public search engines may index the Services only within the limits permitted by applicable copyright law and must not bypass security measures like CAPTCHA.',
      name: 'terms_section4',
      desc: '',
      args: [],
    );
  }

  /// `Content Submission; Account Use; Privacy\nBy submitting any content to Building Knowledge, you grant an irrevocable, perpetual, royalty-free, worldwide license to use, copy, distribute, display, modify, and translate your content in connection with the Services or other media. Building Knowledge may remove or modify any content you submit at any time.`
  String get terms_section5 {
    return Intl.message(
      'Content Submission; Account Use; Privacy\nBy submitting any content to Building Knowledge, you grant an irrevocable, perpetual, royalty-free, worldwide license to use, copy, distribute, display, modify, and translate your content in connection with the Services or other media. Building Knowledge may remove or modify any content you submit at any time.',
      name: 'terms_section5',
      desc: '',
      args: [],
    );
  }

  /// `Updating or Correcting Information\nYour ability to update or correct information depends on your relationship with Building Knowledge. Users may request updates, corrections, or deletions of personal data by contacting Building Knowledge. However, some information may remain in backup systems and cannot be fully erased.`
  String get terms_section6 {
    return Intl.message(
      'Updating or Correcting Information\nYour ability to update or correct information depends on your relationship with Building Knowledge. Users may request updates, corrections, or deletions of personal data by contacting Building Knowledge. However, some information may remain in backup systems and cannot be fully erased.',
      name: 'terms_section6',
      desc: '',
      args: [],
    );
  }

  /// `Role of Building Knowledge\nBuilding Knowledge is a licensed real estate broker in Egypt.`
  String get terms_section7 {
    return Intl.message(
      'Role of Building Knowledge\nBuilding Knowledge is a licensed real estate broker in Egypt.',
      name: 'terms_section7',
      desc: '',
      args: [],
    );
  }

  /// `Intellectual Property\nThe Services are the proprietary property of Building Knowledge. You may not use Building Knowledge’s trademarks as part of your username or email address. Building Knowledge does not claim copyright over images or descriptions listed, as their use is subject to the copyright owner’s consent and applicable laws.`
  String get terms_section8 {
    return Intl.message(
      'Intellectual Property\nThe Services are the proprietary property of Building Knowledge. You may not use Building Knowledge’s trademarks as part of your username or email address. Building Knowledge does not claim copyright over images or descriptions listed, as their use is subject to the copyright owner’s consent and applicable laws.',
      name: 'terms_section8',
      desc: '',
      args: [],
    );
  }

  /// `Limitation of Liability; Exclusive Remedy\nBuilding Knowledge and its suppliers are not liable for any indirect, consequential, special, incidental, or punitive damages arising from your use of the Services. Your sole remedy if you are dissatisfied with these terms is to discontinue using the Services.`
  String get terms_section9 {
    return Intl.message(
      'Limitation of Liability; Exclusive Remedy\nBuilding Knowledge and its suppliers are not liable for any indirect, consequential, special, incidental, or punitive damages arising from your use of the Services. Your sole remedy if you are dissatisfied with these terms is to discontinue using the Services.',
      name: 'terms_section9',
      desc: '',
      args: [],
    );
  }

  /// `Changes; Service Discontinuation\nBuilding Knowledge may modify these terms at any time. Changes take effect immediately upon posting. Continued use of the Services constitutes acceptance of these changes. Building Knowledge may also modify, suspend, or discontinue the Services without prior notice.`
  String get terms_section10 {
    return Intl.message(
      'Changes; Service Discontinuation\nBuilding Knowledge may modify these terms at any time. Changes take effect immediately upon posting. Continued use of the Services constitutes acceptance of these changes. Building Knowledge may also modify, suspend, or discontinue the Services without prior notice.',
      name: 'terms_section10',
      desc: '',
      args: [],
    );
  }

  /// `Governing Law; Disputes\nThese terms are governed by the laws of the Arab Republic of Egypt. Any disputes shall be resolved in courts located in Cairo, Egypt. The prevailing party in any dispute is entitled to recover attorney fees and legal costs.`
  String get terms_section11 {
    return Intl.message(
      'Governing Law; Disputes\nThese terms are governed by the laws of the Arab Republic of Egypt. Any disputes shall be resolved in courts located in Cairo, Egypt. The prevailing party in any dispute is entitled to recover attorney fees and legal costs.',
      name: 'terms_section11',
      desc: '',
      args: [],
    );
  }

  /// `Indemnification\nYou agree to defend, indemnify, and hold harmless Building Knowledge from any claims arising from your violation of these terms, your use of the Services, your violation of laws, or any content you submit through your account.`
  String get terms_section12 {
    return Intl.message(
      'Indemnification\nYou agree to defend, indemnify, and hold harmless Building Knowledge from any claims arising from your violation of these terms, your use of the Services, your violation of laws, or any content you submit through your account.',
      name: 'terms_section12',
      desc: '',
      args: [],
    );
  }

  /// `Liability Waiver\nBuilding Knowledge, its affiliates, and representatives are released from any liability related to claims you may bring against third parties due to the Services.`
  String get terms_section13 {
    return Intl.message(
      'Liability Waiver\nBuilding Knowledge, its affiliates, and representatives are released from any liability related to claims you may bring against third parties due to the Services.',
      name: 'terms_section13',
      desc: '',
      args: [],
    );
  }

  /// `General Provisions\nYou agree to comply with all applicable export laws when using the Services.`
  String get terms_section14 {
    return Intl.message(
      'General Provisions\nYou agree to comply with all applicable export laws when using the Services.',
      name: 'terms_section14',
      desc: '',
      args: [],
    );
  }

  /// `For any inquiries or requests regarding your information, please contact Building Knowledge via email at info@buildingknowledge.com.`
  String get terms_section15 {
    return Intl.message(
      'For any inquiries or requests regarding your information, please contact Building Knowledge via email at info@buildingknowledge.com.',
      name: 'terms_section15',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get About_Us {
    return Intl.message('About Us', name: 'About_Us', desc: '', args: []);
  }

  /// `About Company`
  String get AboutCompany {
    return Intl.message(
      'About Company',
      name: 'AboutCompany',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Building Knowledge. We're here to simplify your real estate journey. Our team offers personalized solutions and exceptional service to help you find your dream property. Contact us today to get started!`
  String get SubAboutCompany {
    return Intl.message(
      'Welcome to Building Knowledge. We\'re here to simplify your real estate journey. Our team offers personalized solutions and exceptional service to help you find your dream property. Contact us today to get started!',
      name: 'SubAboutCompany',
      desc: '',
      args: [],
    );
  }

  /// `Our Mission`
  String get OurMission {
    return Intl.message('Our Mission', name: 'OurMission', desc: '', args: []);
  }

  /// `At Building Knowledge, we're committed to simplifying the real estate process. Our mission is to empower individuals and families to find their perfect home or investment property by providing intuitive tools, expert guidance, and exceptional service. We strive to make the journey of buying, selling, or renting real estate as seamless and rewarding as possible for our users.`
  String get SubOurMission {
    return Intl.message(
      'At Building Knowledge, we\'re committed to simplifying the real estate process. Our mission is to empower individuals and families to find their perfect home or investment property by providing intuitive tools, expert guidance, and exceptional service. We strive to make the journey of buying, selling, or renting real estate as seamless and rewarding as possible for our users.',
      name: 'SubOurMission',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get Notification {
    return Intl.message(
      'Notification',
      name: 'Notification',
      desc: '',
      args: [],
    );
  }

  /// `No Notification Yet`
  String get NoNotification {
    return Intl.message(
      'No Notification Yet',
      name: 'NoNotification',
      desc: '',
      args: [],
    );
  }

  /// `No Notification Yet`
  String get SubNoNotification {
    return Intl.message(
      'No Notification Yet',
      name: 'SubNoNotification',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get GetStarted {
    return Intl.message('Get started', name: 'GetStarted', desc: '', args: []);
  }

  /// `Next`
  String get Next {
    return Intl.message('Next', name: 'Next', desc: '', args: []);
  }

  /// `Skip`
  String get Skip {
    return Intl.message('Skip', name: 'Skip', desc: '', args: []);
  }

  /// `Welcome Home`
  String get OnBoarding1title {
    return Intl.message(
      'Welcome Home',
      name: 'OnBoarding1title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, your gateway to finding the perfect home sweet home.`
  String get OnBoarding1description {
    return Intl.message(
      'Welcome, your gateway to finding the perfect home sweet home.',
      name: 'OnBoarding1description',
      desc: '',
      args: [],
    );
  }

  /// `Tailor Your Search`
  String get OnBoarding2title {
    return Intl.message(
      'Tailor Your Search',
      name: 'OnBoarding2title',
      desc: '',
      args: [],
    );
  }

  /// `Preparing comprehensive contracts to secure your investments in real estate and construction projects.`
  String get OnBoarding2description {
    return Intl.message(
      'Preparing comprehensive contracts to secure your investments in real estate and construction projects.',
      name: 'OnBoarding2description',
      desc: '',
      args: [],
    );
  }

  /// `Let's Get Started`
  String get OnBoarding3title {
    return Intl.message(
      'Let\'s Get Started',
      name: 'OnBoarding3title',
      desc: '',
      args: [],
    );
  }

  /// `Let's dive in together and find your perfect home with Building Knowledge.`
  String get OnBoarding3description {
    return Intl.message(
      'Let\'s dive in together and find your perfect home with Building Knowledge.',
      name: 'OnBoarding3description',
      desc: '',
      args: [],
    );
  }

  /// `Not a member?`
  String get NotAMember {
    return Intl.message(
      'Not a member?',
      name: 'NotAMember',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get SignUp {
    return Intl.message('Sign up', name: 'SignUp', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `By continuing you agree to our`
  String get ByContinuingYouAgree {
    return Intl.message(
      'By continuing you agree to our',
      name: 'ByContinuingYouAgree',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(' and ', name: 'and', desc: '', args: []);
  }

  /// `Sign in with Phone Number`
  String get SignInWithPhoneNumber {
    return Intl.message(
      'Sign in with Phone Number',
      name: 'SignInWithPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get SignInWithFacebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'SignInWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get SignInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'SignInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Verify Phone Number`
  String get VerifyPhoneNumber {
    return Intl.message(
      'Verify Phone Number',
      name: 'VerifyPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code sent to +201017900067`
  String get SubVerifyPhoneNumber {
    return Intl.message(
      'Enter the verification code sent to +201017900067',
      name: 'SubVerifyPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get Verify {
    return Intl.message('Verify', name: 'Verify', desc: '', args: []);
  }

  /// `Resend Code After 00:59`
  String get ResendCode {
    return Intl.message(
      'Resend Code After 00:59',
      name: 'ResendCode',
      desc: '',
      args: [],
    );
  }

  /// `Choose Country Code`
  String get ChooseCountryCode {
    return Intl.message(
      'Choose Country Code',
      name: 'ChooseCountryCode',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message('Full Name', name: 'FullName', desc: '', args: []);
  }

  /// `First and Last Name`
  String get FirstandLastName {
    return Intl.message(
      'First and Last Name',
      name: 'FirstandLastName',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get AlreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'AlreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Search for countries`
  String get SearchForCountries {
    return Intl.message(
      'Search for countries',
      name: 'SearchForCountries',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `No Results to Show`
  String get NoResultstoShow {
    return Intl.message(
      'No Results to Show',
      name: 'NoResultstoShow',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Send a Message`
  String get SendMessage {
    return Intl.message(
      'Send a Message',
      name: 'SendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Write your message`
  String get WriteMessage {
    return Intl.message(
      'Write your message',
      name: 'WriteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get Send {
    return Intl.message('Send', name: 'Send', desc: '', args: []);
  }

  /// `Real Estate`
  String get RealEstate {
    return Intl.message('Real Estate', name: 'RealEstate', desc: '', args: []);
  }

  /// ` m²`
  String get m {
    return Intl.message(' m²', name: 'm', desc: '', args: []);
  }

  /// `EGP`
  String get EGP {
    return Intl.message('EGP', name: 'EGP', desc: '', args: []);
  }

  /// `Beds`
  String get Beds {
    return Intl.message('Beds', name: 'Beds', desc: '', args: []);
  }

  /// `Baths`
  String get Baths {
    return Intl.message('Baths', name: 'Baths', desc: '', args: []);
  }

  /// `Finishing`
  String get finishingType {
    return Intl.message('Finishing', name: 'finishingType', desc: '', args: []);
  }

  /// `Property Type`
  String get PropertyType {
    return Intl.message(
      'Property Type',
      name: 'PropertyType',
      desc: '',
      args: [],
    );
  }

  /// `Listing Date`
  String get ListingDate {
    return Intl.message(
      'Listing Date',
      name: 'ListingDate',
      desc: '',
      args: [],
    );
  }

  /// `Delivery In`
  String get deliveryType {
    return Intl.message(
      'Delivery In',
      name: 'deliveryType',
      desc: '',
      args: [],
    );
  }

  /// `About Property`
  String get AboutProperty {
    return Intl.message(
      'About Property',
      name: 'AboutProperty',
      desc: '',
      args: [],
    );
  }

  /// `Suggested for You`
  String get Suggested {
    return Intl.message(
      'Suggested for You',
      name: 'Suggested',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Fully Finished`
  String get FullyFinished {
    return Intl.message(
      'Fully Finished',
      name: 'FullyFinished',
      desc: '',
      args: [],
    );
  }

  /// `Semi-Finished`
  String get SemiFinished {
    return Intl.message(
      'Semi-Finished',
      name: 'SemiFinished',
      desc: '',
      args: [],
    );
  }

  /// `Not Finished`
  String get NotFinished {
    return Intl.message(
      'Not Finished',
      name: 'NotFinished',
      desc: '',
      args: [],
    );
  }

  /// `Payment Details`
  String get PaymentDetails {
    return Intl.message(
      'Payment Details',
      name: 'PaymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Fully Paid`
  String get FullyPaid {
    return Intl.message('Fully Paid', name: 'FullyPaid', desc: '', args: []);
  }

  /// `Installments`
  String get Installments {
    return Intl.message(
      'Installments',
      name: 'Installments',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get Services {
    return Intl.message('Services', name: 'Services', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Rent`
  String get rent {
    return Intl.message('Rent', name: 'rent', desc: '', args: []);
  }

  /// `Sale`
  String get sale {
    return Intl.message('Sale', name: 'sale', desc: '', args: []);
  }

  /// `No results to display`
  String get no_results {
    return Intl.message(
      'No results to display',
      name: 'no_results',
      desc: '',
      args: [],
    );
  }

  /// `For Rent`
  String get for_rent {
    return Intl.message('For Rent', name: 'for_rent', desc: '', args: []);
  }

  /// `For Sale`
  String get for_sale {
    return Intl.message('For Sale', name: 'for_sale', desc: '', args: []);
  }

  /// `Villas`
  String get villas {
    return Intl.message('Villas', name: 'villas', desc: '', args: []);
  }

  /// `Apartments`
  String get apartments {
    return Intl.message('Apartments', name: 'apartments', desc: '', args: []);
  }

  /// `Apartment`
  String get apartment {
    return Intl.message('Apartment', name: 'apartment', desc: '', args: []);
  }

  /// `Offices`
  String get offices {
    return Intl.message('Offices', name: 'offices', desc: '', args: []);
  }

  /// `Materials`
  String get Materials {
    return Intl.message('Materials', name: 'Materials', desc: '', args: []);
  }

  /// `Design & Finishing`
  String get Design_Finishing {
    return Intl.message(
      'Design & Finishing',
      name: 'Design_Finishing',
      desc: '',
      args: [],
    );
  }

  /// `Government Services`
  String get Government_Services {
    return Intl.message(
      'Government Services',
      name: 'Government_Services',
      desc: '',
      args: [],
    );
  }

  /// `Properties`
  String get Properties {
    return Intl.message('Properties', name: 'Properties', desc: '', args: []);
  }

  /// `Brokers`
  String get Brokers {
    return Intl.message('Brokers', name: 'Brokers', desc: '', args: []);
  }

  /// `Developers`
  String get Developers {
    return Intl.message('Developers', name: 'Developers', desc: '', args: []);
  }

  /// `Available Compounds`
  String get AvailableCompounds {
    return Intl.message(
      'Available Compounds',
      name: 'AvailableCompounds',
      desc: '',
      args: [],
    );
  }

  /// `Available Properties`
  String get AvailableProperties {
    return Intl.message(
      'Available Properties',
      name: 'AvailableProperties',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get Sort {
    return Intl.message('Sort', name: 'Sort', desc: '', args: []);
  }

  /// `Available Results`
  String get AvailableResults {
    return Intl.message(
      'Available Results',
      name: 'AvailableResults',
      desc: '',
      args: [],
    );
  }

  /// `Developer Sale`
  String get DeveloperSale {
    return Intl.message(
      'Developer Sale',
      name: 'DeveloperSale',
      desc: '',
      args: [],
    );
  }

  /// `Resale`
  String get Resale {
    return Intl.message('Resale', name: 'Resale', desc: '', args: []);
  }

  /// `Reset`
  String get Reset {
    return Intl.message('Reset', name: 'Reset', desc: '', args: []);
  }

  /// `Show`
  String get Show {
    return Intl.message('Show', name: 'Show', desc: '', args: []);
  }

  /// `Results`
  String get Results {
    return Intl.message('Results', name: 'Results', desc: '', args: []);
  }

  /// `Minimum Price`
  String get MinimumPrice {
    return Intl.message(
      'Minimum Price',
      name: 'MinimumPrice',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Price`
  String get MaximumPrice {
    return Intl.message(
      'Maximum Price',
      name: 'MaximumPrice',
      desc: '',
      args: [],
    );
  }

  /// `Newest`
  String get Newest {
    return Intl.message('Newest', name: 'Newest', desc: '', args: []);
  }

  /// `Developer Start Price`
  String get DeveloperStartPrice {
    return Intl.message(
      'Developer Start Price',
      name: 'DeveloperStartPrice',
      desc: '',
      args: [],
    );
  }

  /// `Resale Start Price`
  String get ResaleStartPrice {
    return Intl.message(
      'Resale Start Price',
      name: 'ResaleStartPrice',
      desc: '',
      args: [],
    );
  }

  /// `Workers`
  String get Workers {
    return Intl.message('Workers', name: 'Workers', desc: '', args: []);
  }

  /// `Search for workers`
  String get SearchForWorkers {
    return Intl.message(
      'Search for workers',
      name: 'SearchForWorkers',
      desc: '',
      args: [],
    );
  }

  /// `Featured Workers`
  String get FeaturedWorkers {
    return Intl.message(
      'Featured Workers',
      name: 'FeaturedWorkers',
      desc: '',
      args: [],
    );
  }

  /// `No workers available`
  String get NoWorkersAvailable {
    return Intl.message(
      'No workers available',
      name: 'NoWorkersAvailable',
      desc: '',
      args: [],
    );
  }

  /// `All Workers`
  String get AllWorkers {
    return Intl.message('All Workers', name: 'AllWorkers', desc: '', args: []);
  }

  /// `Search Options`
  String get SearchOptions {
    return Intl.message(
      'Search Options',
      name: 'SearchOptions',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message('Location', name: 'Location', desc: '', args: []);
  }

  /// `Choose Location`
  String get ChooseLocation {
    return Intl.message(
      'Choose Location',
      name: 'ChooseLocation',
      desc: '',
      args: [],
    );
  }

  /// `Choose Worker Role`
  String get ChooseWorkerRole {
    return Intl.message(
      'Choose Worker Role',
      name: 'ChooseWorkerRole',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get Rating {
    return Intl.message('Rating', name: 'Rating', desc: '', args: []);
  }

  /// `Select Location`
  String get SelectLocation {
    return Intl.message(
      'Select Location',
      name: 'SelectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Search for governorate or city`
  String get SearchForGovernorateOrCity {
    return Intl.message(
      'Search for governorate or city',
      name: 'SearchForGovernorateOrCity',
      desc: '',
      args: [],
    );
  }

  /// `Select Role`
  String get SelectRole {
    return Intl.message('Select Role', name: 'SelectRole', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
