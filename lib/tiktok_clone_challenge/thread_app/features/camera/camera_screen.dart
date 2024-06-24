import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/camera/widgets/camera_bottom_bar.dart';
import 'package:nomadcoders_flutter_challenge/tiktok_clone_challenge/thread_app/features/camera/widgets/camera_control.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  late CameraController _cameraController;
  bool _cameraGranted = false;
  bool get _cameraInitialized => _cameraController.value.isInitialized;
  final resolution = ResolutionPreset.medium;
  bool _selfieMode = false;

  bool _appInBackground = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initPermission();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _initPermission() async {
    final cameraPermission = await Permission.camera.request();
    _cameraGranted =
        !cameraPermission.isDenied && !cameraPermission.isPermanentlyDenied;
    if (_cameraGranted) {
      _cameraGranted = true;
      await _initCamera();
    }
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[_selfieMode ? 1 : 0],
      resolution,
      enableAudio: false,
    );

    await _cameraController.initialize();

    setState(() {});
  }

  void _onClose([List<XFile> files = const []]) {
    Navigator.of(context).pop(files);
  }

  Size _previewSizeConstraint(BuildContext context) {
    var tmp = MediaQuery.sizeOf(context);
    final screenSize = Size(
      min(tmp.width, tmp.height),
      max(tmp.width, tmp.height),
    );

    tmp = _cameraController.value.previewSize!;
    final previewSize = Size(
      min(tmp.width, tmp.height),
      max(tmp.width, tmp.height),
    );

    final screenRatio = screenSize.height / screenSize.width;
    final previewRatio = previewSize.height / previewSize.width;

    final maxWidth = screenRatio > previewRatio
        ? screenSize.height / previewSize.height * previewSize.width
        : screenSize.width;
    final maxHeight = screenRatio > previewRatio
        ? screenSize.height
        : screenSize.width / previewSize.width * previewSize.height;

    return Size(maxWidth, maxHeight);
  }

  void _onFlashPressed() async {
    final nextMode = _cameraController.value.flashMode == FlashMode.torch
        ? FlashMode.off
        : FlashMode.torch;
    await _cameraController.setFlashMode(nextMode);
    setState(() {});
  }

  void _onCapturePressed() async {
    final file = await _cameraController.takePicture();
    _onClose([file]);
  }

  void _onRotatePressed() async {
    _selfieMode = !_selfieMode;
    await _initCamera();
  }

  void _onLibraryPressed() async {
    final files = await ImagePicker().pickMultiImage();
    if (files.isEmpty) return;
    _onClose(files);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (!_cameraGranted || !_cameraInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.paused:
        _appInBackground = true;
        setState(() {});
        _cameraController.dispose();
      case AppLifecycleState.resumed:
        if (!_appInBackground) return;
        _appInBackground = false;
        await _initCamera();
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _cameraGranted
              ? _cameraInitialized
                  ? Stack(
                      children: [
                        if (!_appInBackground)
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32),
                                bottomRight: Radius.circular(32),
                              ),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Builder(
                              builder: (context) {
                                final sizeConstraint =
                                    _previewSizeConstraint(context);
                                return OverflowBox(
                                  maxWidth: sizeConstraint.width,
                                  maxHeight: sizeConstraint.height,
                                  child: CameraPreview(_cameraController),
                                );
                              },
                            ),
                          ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CameraControl(
                            onFlashPressed: _onFlashPressed,
                            onCapturePressed: _onCapturePressed,
                            onRotatePressed: _onRotatePressed,
                            flashOn: _cameraController.value.flashMode ==
                                FlashMode.torch,
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: Text(
                        "Initializing camera...",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
              : const Center(
                  child: Text(
                    "Please grant camera permission.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: IconButton(
                onPressed: _onClose,
                icon: const Icon(
                  Icons.chevron_left,
                  size: 36,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CameraBottomBar(
        onLibraryPressed: _onLibraryPressed,
      ),
    );
  }
}
