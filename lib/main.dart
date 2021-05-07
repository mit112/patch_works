import 'package:flutter/material.dart';
import 'screens/admin/admin_homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'services/google_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'screens/sign_in.dart';
import 'services/auth.dart';
import 'package:provider/provider.dart';
import 'screens/user/homepage.dart';
import 'constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(auth: FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Patch Works',
        theme: ThemeData(
          accentColor: kDarkBlue,
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
          ),
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

String checkIfAdmin(DocumentSnapshot doc) {
  String userType;
  print('---' * 80);
  print(doc.data()['userType']);
  print('---' * 80);
  userType = doc.data()['userType'];
  return doc.data()['userType'];
}

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  Future<String> checkIfAdmin() async {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      String userType;
      users
          .doc(firebaseUser.uid)
          .get()
          .then((doc) => userType = doc.data()['userType']);
      print('-' * 80);
      print(userType);
      print('-' * 80);
      if (userType == 'admin') {
        return 'admin';
      } else {
        return 'user';
      }
    }
    return null;
  }

  String _userType;

  @override
  void initState() {
    // TODO: implement initState
    checkIfAdmin().then((value) => _userType = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_userType != null) {
      print('-' * 80);
      print(_userType);
      print('-' * 80);
      if (_userType == 'admin') {
        return AdminHomepage();
      } else {
        return Homepage();
      }
    }
    return Authenticate();
  }
}
