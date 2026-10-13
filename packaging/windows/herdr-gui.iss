; Build from target\pkg: copy this file there, next to the herdr-gui-windows-x86_64 folder
; (herdr-gui.exe, LICENSE, windows-port.patch) and herdr-LICENSE.txt, then run ISCC.
; Expects the herdr Windows release unzipped in C:\Users\Homagni\herdr-win.
; Per-user installer for the Windows port of herdr-gui, bundling herdr 0.9.3.
[Setup]
AppId={{8C2F6C1E-5B0B-4E0C-9E57-6B1B2B6C7A41}
AppName=herdr-gui
AppVersion=0.1.11
AppPublisher=undivisible/herdr-gui (unofficial Windows port)
AppPublisherURL=https://github.com/undivisible/herdr-gui
DefaultDirName={localappdata}\Programs\herdr-gui
DefaultGroupName=herdr-gui
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
LicenseFile=herdr-gui-windows-x86_64\LICENSE
OutputDir=.
OutputBaseFilename=herdr-gui-0.1.11-windows-x64-setup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
UninstallDisplayIcon={app}\herdr-gui.exe

[Tasks]
Name: desktopicon; Description: "Create a desktop shortcut"; Flags: unchecked

[Files]
Source: "herdr-gui-windows-x86_64\herdr-gui.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "herdr-gui-windows-x86_64\LICENSE"; DestDir: "{app}"; Flags: ignoreversion
Source: "herdr-gui-windows-x86_64\windows-port.patch"; DestDir: "{app}"; Flags: ignoreversion
; herdr itself (Apache-2.0): the GUI finds herdr.exe beside its own exe.
Source: "C:\Users\Homagni\herdr-win\herdr.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Homagni\herdr-win\conpty\*"; DestDir: "{app}\conpty"; Flags: ignoreversion recursesubdirs
Source: "C:\Users\Homagni\herdr-win\THIRD-PARTY-NOTICES\*"; DestDir: "{app}\THIRD-PARTY-NOTICES"; Flags: ignoreversion recursesubdirs
Source: "herdr-LICENSE.txt"; DestDir: "{app}\THIRD-PARTY-NOTICES"; Flags: ignoreversion

[Icons]
Name: "{group}\herdr-gui"; Filename: "{app}\herdr-gui.exe"; WorkingDir: "{app}"
Name: "{userdesktop}\herdr-gui"; Filename: "{app}\herdr-gui.exe"; WorkingDir: "{app}"; Tasks: desktopicon

[Run]
Filename: "{app}\herdr-gui.exe"; Description: "Launch herdr-gui"; Flags: nowait postinstall skipifsilent
