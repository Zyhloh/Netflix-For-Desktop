# Netflix For Desktop

An unofficial desktop application for Netflix with built-in ad blocking, Discord Rich Presence integration, and hardware-accelerated video playback.

![Netflix For Desktop](https://img.shields.io/badge/Platform-Windows-blue?style=for-the-badge)
![.NET](https://img.shields.io/badge/.NET-8.0-purple?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## ✨ Features

- **Built-in Ad Blocker** - uBlock Origin integrated natively, blocks ads during playback with zero setup
- **Native Netflix Experience** - Direct embedding of Netflix web interface
- **Discord Rich Presence** - Show what you're watching on Discord
- **Hardware Acceleration** - Smooth video playback with GPU acceleration
- **DRM Support** - Full Widevine DRM support for premium content
- **Optimized for Streaming** - 1400x900 window optimized for viewing

## 🚀 Quick Start

### Option 1: Download Pre-built Installer (Recommended)
1. Go to [Releases](https://github.com/zyhloh/netflix-for-desktop/releases)
2. Download `NetflixForDesktop_v2.0.0_Setup.exe`
3. Run the installer
4. Launch from Start Menu or Desktop shortcut

> **Note:** The installer includes uBlock Origin for ad blocking out of the box. .NET 8.0 Desktop Runtime and WebView2 are required.

### Option 2: Build from Source

#### Prerequisites
- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [Microsoft Edge WebView2](https://developer.microsoft.com/en-us/microsoft-edge/webview2/) (if not already installed)
- Windows 10/11

#### Build Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/zyhloh/netflix-for-desktop.git
   cd netflix-for-desktop
   ```

2. Run the setup script to download uBlock Origin:
   ```bash
   setup.bat
   ```

3. Build the application:
   ```bash
   dotnet build .\NetflixForDesktop.csproj -c Release
   ```

4. Run the application:
   ```bash
   dotnet run --project NetflixForDesktop.csproj
   ```

## 📦 Creating Your Own Installer

If you want to package the application into an installer:

### Using Inno Setup (Recommended)
1. Install [Inno Setup 6](https://jrsoftware.org/isinfo.php)
2. Create an Inno Setup script (`.iss` file) pointing to your build output
3. Compile using Inno Setup Compiler

### Alternative Packaging Options
- **NSIS** - Nullsoft Scriptable Install System
- **WiX Toolset** - Windows Installer XML
- **Advanced Installer** - Commercial solution with GUI

## 🛠️ Development

### Project Structure
```
Netflix For Desktop/
├── App.xaml                 # Application definition
├── App.xaml.cs              # Application code-behind
├── MainWindow.xaml          # Main window UI
├── MainWindow.xaml.cs       # Main window logic
├── NetflixForDesktop.csproj # Project file
├── setup.bat                # Downloads uBlock Origin for ad blocking
├── UBlock/                  # uBlock Origin extension (created by setup.bat)
├── images/                  # Application icons
└── font/                    # Custom fonts
```

### Key Dependencies
- **Microsoft.Web.WebView2** - Web browser control
- **DiscordRPC** - Discord Rich Presence integration
- **Microsoft.WindowsAPICodePack-Shell** - Windows shell integration

### Building for Distribution
```bash
# Build self-contained executable
dotnet publish .\NetflixForDesktop.csproj -c Release -r win-x64 --self-contained true
```

## 🔧 Configuration

The application stores settings in the Windows Registry under:
```
HKEY_CURRENT_USER\SOFTWARE\NetflixForDesktop
```

### Settings Include:
- Hardware acceleration preferences
- Window state and position

## 🎮 Discord Integration

The app automatically shows your Netflix activity on Discord:
- Currently watching title
- Viewing status (watching, browsing)
- Time elapsed

## 🔒 Security & Privacy

- **Built-in Ad Blocker** - uBlock Origin runs natively inside the app, no browser extension needed
- **Domain Allowlist** - Only allows Netflix, Google auth, and CDN domains
- **Content Security Policy** - Blocks unauthorized external content
- **Local Storage** - Settings stored locally on your machine
- **No Data Collection** - Application doesn't collect or transmit user data

## 🐛 Troubleshooting

### Common Issues

**WebView2 Not Found:**
- Download and install [Microsoft Edge WebView2](https://developer.microsoft.com/en-us/microsoft-edge/webview2/)
- Or use the packaged installer which includes WebView2

**Build Errors:**
- Ensure .NET 8.0 SDK is installed
- Restore NuGet packages: `dotnet restore`
- Clean and rebuild: `dotnet clean && dotnet build`

**Discord RPC Not Working:**
- Ensure Discord is running
- Check Discord settings allow Rich Presence
- Restart the application

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⚠️ Disclaimer

This is an unofficial application and is not affiliated with, endorsed by, or sponsored by Netflix, Inc. Netflix is a trademark of Netflix, Inc.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📞 Support

- **Issues:** [GitHub Issues](https://github.com/zyhloh/netflix-for-desktop/issues)
- **Discussions:** [GitHub Discussions](https://github.com/zyhloh/netflix-for-desktop/discussions)

---

Made with ❤️ by [Zyhloh](https://github.com/zyhloh)
