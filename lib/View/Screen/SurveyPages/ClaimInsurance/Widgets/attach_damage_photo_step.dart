import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:math' show cos, min, pi, sin;

import '../Models/claim_data.dart';

class AttachDamagePhotoStep extends StatefulWidget {
  final ClaimData claimData;
  final Function(ClaimData) onChanged;

  AttachDamagePhotoStep({required this.claimData, required this.onChanged});

  @override
  _AttachDamagePhotoStepState createState() => _AttachDamagePhotoStepState();
}

class _AttachDamagePhotoStepState extends State<AttachDamagePhotoStep> {
  final ImagePicker _picker = ImagePicker();
  List<File> _images = [];

  @override
  void initState() {
    super.initState();
    _images = widget.claimData.images;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Attach Damage Photo', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildCarImageSection(),
            SizedBox(height: 20),
            _buildImageList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCarImageSection() {
    return AspectRatio(
      aspectRatio: 12 / 13,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/images/capture_car.png', width: constraints.maxWidth * 0.5, height: constraints.maxHeight * 0.5),
              ..._buildCameraButtons(constraints),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildCameraButtons(BoxConstraints constraints) {
    return List.generate(8, (index) {
      final angle = index * (2 * pi / 8);
      final radius = min(constraints.maxWidth, constraints.maxHeight) * 0.40;
      return Positioned(
        left: constraints.maxWidth / 2 + radius * cos(angle) - 28,
        top: constraints.maxHeight / 2 + radius * sin(angle) - 35,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.white),
                onPressed: () => _getImage(ImageSource.camera, index),
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildImageList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(8, (index) {
        final sectionImages = _images.where((image) => image.path.contains('_section${index + 1}')).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Section ${index + 1}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            if (sectionImages.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: sectionImages.map((image) {
                  return Stack(
                    children: [
                      Image.file(image, width: 100, height: 100, fit: BoxFit.cover),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.close, color: Colors.red),
                          onPressed: () => _removeImage(image),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              )
            else
              Text('No image selected'),
            SizedBox(height: 16),
          ],
        );
      }),
    );
  }

  Future<void> _getImage(ImageSource source, int sectionIndex) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      final String newPath = '${imageFile.parent.path}/image_section${sectionIndex + 1}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final File renamedImage = await imageFile.copy(newPath);
      await imageFile.delete();

      setState(() {
        _images.add(renamedImage);
        _updateClaimData();
      });
    }
  }

  void _removeImage(File image) {
    setState(() {
      _images.remove(image);
      _updateClaimData();
    });
  }

  void _updateClaimData() {
    widget.claimData.images = _images;
    widget.onChanged(widget.claimData);
  }
}