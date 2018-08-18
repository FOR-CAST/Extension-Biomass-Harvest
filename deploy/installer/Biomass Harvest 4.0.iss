; LANDIS-II Extension infomation
#define CoreRelease "LANDIS-II-V7"
#define ExtensionName "iomass Harvest"
#define AppVersion "4.0"
#define AppPublisher "LANDIS-II Foundation"
#define AppURL "http://www.landis-ii.org/"

; Build directory
#define BuildDir "..\..\src\bin\Debug\netstandard2.0"

; LANDIS-II installation directories
#define ExtDir "C:\Program Files\LANDIS-II-v7\extensions"
#define AppDir "C:\Program Files\LANDIS-II-v7"
#define LandisPlugInDir "C:\Program Files\LANDIS-II-v7\plug-ins-installer-files"
#define ExtensionsCmd AppDir + "\commands\landis-ii-extensions.cmd"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{D3028456-B0EF-4CE4-9178-0E844AE9FBC7}
AppName={#CoreRelease} {#ExtensionName}
AppVersion={#AppVersion}
; Name in "Programs and Features"
AppVerName={#CoreRelease} {#ExtensionName} v{#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName={pf}\{#ExtensionName}
DisableDirPage=yes
DefaultGroupName={#ExtensionName}
DisableProgramGroupPage=yes
LicenseFile=LANDIS-II_Binary_license.rtf
OutputDir={#SourcePath}
OutputBaseFilename={#CoreRelease} {#ExtensionName} {#AppVersion}-setup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"


[Files]
; This .dll IS the extension (ie, the extension's assembly)
; NB: Do not put an additional version number in the file name of this .dll
; (The name of this .dll is defined in the extension's \src\*.csproj file)
Source: {#BuildDir}\Landis.Extension.BiomassHarvest-v4.dll; DestDir: {#ExtDir}; Flags: replacesameversion
Source: {#BuildDir}\Landis.Extension.BiomassHarvest-v4.pdb; DestDir: {#ExtDir}; Flags: replacesameversion

; Requisite auxiliary libraries
; NB. These libraries are used by other extensions and thus are never uninstalled.
Source: {#BuildDir}\Landis.Library.AgeOnlyCohorts-v3.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: {#BuildDir}\Landis.Library.BiomassCohorts-v3.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: {#BuildDir}\Landis.Library.BiomassHarvest-v3.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: {#BuildDir}\Landis.Library.Biomass-v2.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: {#BuildDir}\Landis.Library.Cohorts-v2.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: {#BuildDir}\Landis.Library.HarvestManagement-v3.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: {#BuildDir}\Landis.Library.Metadata-v2.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: {#BuildDir}\Landis.Library.SiteHarvest-v2.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion
Source: {#BuildDir}\Landis.Library.Succession-v6.dll; DestDir: {#ExtDir}; Flags: uninsneveruninstall replacesameversion

; Complete example for testing the extension
Source: ..\examples\*.txt; DestDir: {#AppDir}\examples\{#ExtensionName}; Flags: replacesameversion
Source: ..\examples\*.gis; DestDir: {#AppDir}\examples\{#ExtensionName}; Flags: replacesameversion
Source: ..\examples\*.bat; DestDir: {#AppDir}\examples\{#ExtensionName}; Flags: replacesameversion
Source: ..\examples\*.csv; DestDir: {#AppDir}\examples\{#ExtensionName}; Flags: replacesameversion


; LANDIS-II identifies the extension with the info in this .txt file
; NB. New releases must modify the name of this file and the info in it
#define InfoTxt "Biomass Harvest 4.0.txt"
Source: {#InfoTxt}; DestDir: {#LandisPlugInDir}
; NOTE: Don't use "Flags: ignoreversion" on any shared system files


[Run]
Filename: {#ExtensionsCmd}; Parameters: "remove ""Biomass Harvest"" "; WorkingDir: {#LandisPlugInDir}
Filename: {#ExtensionsCmd}; Parameters: "add ""{#InfoTxt}"" "; WorkingDir: {#LandisPlugInDir} 


[UninstallRun]
; Remove "Age-Only Succession" from "extensions.xml" file.
Filename: {#ExtensionsCmd}; Parameters: "remove ""Biomass Harvest"" "; WorkingDir: {#LandisPlugInDir}


