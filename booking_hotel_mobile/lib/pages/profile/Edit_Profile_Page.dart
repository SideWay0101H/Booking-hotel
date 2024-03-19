import 'dart:io';
import 'dart:typed_data';

import 'package:booking_hotel_ui/core/constants/color_constrants.dart';
import 'package:booking_hotel_ui/core/global.dart';
import 'package:booking_hotel_ui/gen/assets.gen.dart';
import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:booking_hotel_ui/model/user.dart';
import 'package:booking_hotel_ui/pages/Home/HomePage.dart';
import 'package:booking_hotel_ui/pages/auth/LoginPage.dart';
import 'package:booking_hotel_ui/pages/profile/widgets/profile_page_widget.dart';
import 'package:booking_hotel_ui/pages/profile/widgets/textfield_widget.dart';
import 'package:booking_hotel_ui/services/shared_preferences.dart';
import 'package:booking_hotel_ui/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen_runner/flutter_gen_runner.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  File? _selectedImage;
  Uint8List? _image;
  Widget _buildBackbutton() {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Future<void> _showChangePasswordDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thay đổi mật khẩu'),
          content: const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Mật khẩu mới'),
                  obscureText: true,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Xác nhận mật khẩu'),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Hủy bỏ'),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform password change logic here
                Navigator.pop(context);
              },
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showChangeInfoDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cập nhật lại thông tin'),
          content: const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                TextField(
                  decoration:
                      InputDecoration(labelText: 'Cập nhật số điện thoại'),
                  obscureText: false,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Cập nhật tuổi'),
                  obscureText: false,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Cập nhật địa chỉ'),
                  obscureText: false,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Hủy bỏ'),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform password change logic here
                Navigator.pop(context);
              },
              // ignore: prefer_const_constructors
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    // String tProfile;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          buildAvatar(),
        ],
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    _scaffoldKey.currentState?.showBottomSheet((BuildContext context) {
      return _buildImagePicker();
    });
  }

  Widget _buildImagePicker() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  _pickImageFromGallery();
                },
                child: const SizedBox(
                  child: Column(
                    children: [
                      Icon(
                        Icons.image,
                        size: 70,
                      ),
                      Text('Truy cập thư mục')
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _pickImageFromCamera();
                },
                child: const SizedBox(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text('Truy cập Camera')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget buildAvatar() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBackbutton(),
                  Column(
                    children: [
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              // ignore: unnecessary_null_comparison
                              _image != null
                                  ? CircleAvatar(
                                      radius: 100,
                                      backgroundImage: MemoryImage(_image!),
                                    )
                                  : const CircleAvatar(
                                      radius: 100,
                                      backgroundImage:
                                          AssetImage('assets/image/photo.png'),
                                    ),
                              Positioned(
                                bottom: 0,
                                left: 84,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add_a_photo,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    showImagePickerOption(context);
                                  },
                                ),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'người dùng 01',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.roboto),
                      ),
                      const Text(
                        'user01@gmail.com',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(color: Colors.black12),
              const SizedBox(
                height: 10,
              ),
              ProfileWidget(
                title: 'Thay đổi mật khẩu',
                icon: Icons.password,
                onPressed: () {
                  _showChangePasswordDialog();
                },
              ),
              ProfileWidget(
                title: 'Chỉnh sửa tài khoản',
                icon: Icons.manage_accounts,
                onPressed: () {
                  _showChangeInfoDialog();
                },
              ),
              ProfileWidget(
                title: 'Đăng xuất',
                icon: Icons.logout,
                onPressed: () {
                  Global.sharedServices.remove('access_token');
                  Global.sharedServices.remove('refresh_token');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Xác nhận đăng xuất'),
                        content: Text('Bạn có muốn thoát ứng dụng không?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Đóng hộp thoại
                            },
                            child: Text('Ở lại'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Đóng hộp thoại
                              // Thực hiện đăng xuất và chuyển hướng đến trang đăng nhập
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text('Thoát'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      _selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop(); //close the model sheet
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      _selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorPalette.primaryColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: ColorPalette.primaryColor),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
