import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true, // Prevent overflow when keyboard appears
      body: SingleChildScrollView(
        // Make content scrollable
        child: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.15, // Profile picture size
                      backgroundImage: const AssetImage(
                          'assets/avatar.png'), // Placeholder image
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          // Logic to change profile picture
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          radius: size.width * 0.05, // Edit icon size
                          child: Icon(Icons.edit,
                              color: Colors.white, size: size.width * 0.04),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              // Spacing after profile picture

              // Full Name Input Field
              _buildTextField(
                context,
                label: 'Full Name',
                initialValue: 'John Doe',
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              // Spacing

              // Email Input Field
              _buildTextField(
                context,
                label: 'Email Address',
                initialValue: 'john.doe@example.com',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              // Spacing

              // Phone Number Input Field
              _buildTextField(
                context,
                label: 'Phone Number',
                initialValue: '+1234567890',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              // Spacing

              // Bio Input Field
              _buildTextField(
                context,
                label: 'Bio',
                initialValue: 'E-learning enthusiast and Flutter developer.',
                icon: Icons.info_outline,
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              // Spacing

              // Save Changes Button
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent.shade700, // Start color (deep blue)
                      Colors.blue.shade500, // Mid-tone blue
                      Colors.lightBlueAccent.shade200, // End color (light blue)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Add save profile logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    // Make button transparent
                    shadowColor: Colors.transparent,
                    // Remove shadow
                    minimumSize: const Size(double.infinity, 50),
                    // Full width button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                        fontSize: 18, color: Colors.white), // Button text style
                  ),
                ),
              ),
              const Spacer(),
              // Pushes content up
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String label,
    required String initialValue,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(icon, color: Colors.blueAccent),
      ),
    );
  }
}
