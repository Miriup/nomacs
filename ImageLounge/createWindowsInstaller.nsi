; Script generated by the HM NIS Edit Script Wizard.
 !include "FileAssociation.nsh"
 !insertmacro RegisterExtension
 ${FileAssociation_VERBOSE} 4   # all verbosity
!include nsDialogs.nsh
!include LogicLib.nsh
!include "nsProcess.nsh"

; your install directories
; !define BUILD_DIR "..\build2012x86\ReallyRelease"

!ifndef BUILD_DIR
!define BUILD_DIR "..\build2012x64\ReallyRelease"
!endif
!define README_DIR "Readme"

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "nomacs - Image Lounge"
!define PRODUCT_VERSION "1.2.1 Fotobox"
!define PRODUCT_WEB_SITE "http://www.nomacs.org"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\nomacs.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

BrandingText "nomacs - Image Lounge"
Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "nomacs-setup.exe"
InstallDir "$PROGRAMFILES\nomacs"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show


; MUI 1.67 compatible ------
!include "MUI2.nsh"

!include "uninstaller.nsdinc"


; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "nomacs.ico"
!define MUI_UNICON "nomacs.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "Readme/LICENSE.GPLv3"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES


; silent install 
!include FileFunc.nsh
!insertmacro GetParameters
!insertmacro GetOptions


; custom page
Page custom fileAssociation fileAssociationFinished

; Finish page
!define MUI_FINISHPAGE_SHOWREADME ""
!define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
!define MUI_FINISHPAGE_SHOWREADME_TEXT "Create Desktop Shortcut"
!define MUI_FINISHPAGE_SHOWREADME_FUNCTION finishpageaction

!define MUI_FINISHPAGE_RUN ""
!define MUI_FINISHPAGE_RUN_TEXT "Run ${PRODUCT_NAME}"
!define MUI_FINISHPAGE_RUN_FUNCTION launchnomacs
!insertmacro MUI_PAGE_FINISH


; custom uninstaller page
UninstPage custom un.fnc_uninstaller_Show un.uninstallNomacs

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES


; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------
Var Dialog
Var Label
Var FullySupportedGroupBox
Var PartiallySupportedGroupBox

; Fully Supported
Var checkAllFully
Var checkAllFully_state
Var jpg
Var png
Var tif
Var bmp
Var pbm
Var pgm
Var xbm
Var xpm
Var jp2k
Var webp


Var jpg_state
Var png_state
Var tif_state
Var bmp_state
Var pbm_state
Var pgm_state
Var xbm_state
Var xpm_state
Var jp2k_state
Var webp_state

; Partially Supported
Var checkAllPartially
Var checkAllPartially_state
Var gif
Var nef
Var crw
Var cr2
Var arw
Var rw2
Var mrw
Var mpo
Var jps
Var pns
Var dng
Var psd

Var gif_state
Var nef_state
Var crw_state
Var cr2_state
Var arw_state
Var rw2_state
Var mrw_state
Var mpo_state
Var jps_state
Var pns_state
Var dng_state
Var psd_state

Var params
Var fileAss 

; Uninstaller
Var hCtl_uninstaller_CheckBox1_state

Function .onInit		
	IfSilent isSilent isNotSilent
		isSilent:
			${GetParameters} $params
			ClearErrors
			${GetOptions} $params /FileAssociations= $fileAss
		isNotSilent:

FunctionEnd
	
Function fileAssociation
	nsDialogs::Create 1018
	Pop $Dialog
	
    ; FULLY SUPPORTED 	
	${NSD_CreateLabel} 0 0 100% 12u "Set File Associations:"
	Pop $Label

	${NSD_CreateCheckbox} 5u 35u 20% 10u "Check All"
	Pop $checkAllFully
	
	${NSD_CreateCheckbox} 10u 50u 15% 10u "jpg"
	Pop $jpg

	${NSD_CreateCheckbox} 10u 65u 15% 10u "png"
	Pop $png

	${NSD_CreateCheckbox} 10u 80u 15% 10u "tif"
	Pop $tif

	${NSD_CreateCheckbox} 10u 95u 15% 10u "bmp"
	Pop $bmp

	${NSD_CreateCheckbox} 10u 110u 15% 10u "webp"
	Pop $webp

	${NSD_CreateCheckbox} 70u 50u 15% 10u "pbm"
	Pop $pbm

	${NSD_CreateCheckbox} 70u 65u 15% 10u "pgm"
	Pop $pgm

	${NSD_CreateCheckbox} 70u 80u 15% 10u "xbm"
	Pop $xbm

	${NSD_CreateCheckbox} 70u 95u 15% 10u "xpm"
	Pop $xpm

	${NSD_CreateCheckbox} 70u 110u 15% 10u "jp2k"
	Pop $jp2k
	
	${NSD_CreateGroupBox} 0 18u 40% 120u "Fully supported:";
	Pop $FullySupportedGroupBox
	
	; PARTIAL SUPPORTED
	${NSD_CreateCheckbox} 155u 35u 20% 10u "Check All"
	Pop $checkAllPartially

	${NSD_CreateCheckbox} 160u 50u 15% 10u "gif"
	Pop $gif
	
	${NSD_CreateCheckbox} 160u 65u 15% 10u "nef"
	Pop $nef

	${NSD_CreateCheckbox} 160u 80u 15% 10u "crw"
	Pop $crw

	${NSD_CreateCheckbox} 160u 95u 15% 10u "rw2"
	Pop $rw2

	${NSD_CreateCheckbox} 160u 110u 15% 10u "jps"
	Pop $jps

	${NSD_CreateCheckbox} 160u 125u 15% 10u "dng"
	Pop $dng

	${NSD_CreateCheckbox} 220u 50u 15% 10u "cr2"
	Pop $cr2

	${NSD_CreateCheckbox} 220u 65u 15% 10u "arw"
	Pop $arw

	${NSD_CreateCheckbox} 220u 80u 15% 10u "mrw"
	Pop $mrw

	${NSD_CreateCheckbox} 220u 95u 15% 10u "mpo"
	Pop $mpo

	${NSD_CreateCheckbox} 220u 110u 15% 10u "pns"
	Pop $pns
	
	${NSD_CreateCheckbox} 220u 125u 15% 10u "psd"
	Pop $psd

	
	${NSD_CreateGroupBox} 150u 18u 40% 120u "Partially supported:";
	Pop $PartiallySupportedGroupBox
	
	${NSD_OnClick} $checkAllFully checkAllFully
	${NSD_OnClick} $checkAllPartially checkAllPartially
	
	nsDialogs::Show
FunctionEnd

Function fileAssociationFinished

	; DELETE REGISTRY ENTRIES FROM OLD VERSION
	DeleteRegValue HKCU "Software\nomacs\Image Lounge\GlobalSettings\" "highlightColor"
	DeleteRegValue HKCU "Software\nomacs\Image Lounge\GlobalSettings\" "invertZoom"
	DeleteRegValue HKCU "Software\nomacs\Image Lounge\GlobalSettings\" "resetMatrix"
	DeleteRegValue HKCU "Software\nomacs\Image Lounge\GlobalSettings\" "saveThumb"
	DeleteRegValue HKCU "Software\nomacs\Image Lounge\GlobalSettings\" "thumbSize"
	
	; DELETE OLD DLLs
	Delete "$INSTDIR\opencv_imgproc220.dll"
	Delete "$INSTDIR\opencv_core220.dll"
	Delete "$INSTDIR\opencv_imgproc231.dll"
	Delete "$INSTDIR\opencv_core231.dll"
	Delete "$INSTDIR\opencv_imgproc242.dll"
	Delete "$INSTDIR\opencv_core242.dll"

	; RESET UPDATE FLAG
	WriteRegStr HKCU "Software\nomacs\Image Lounge\SynchronizeSettings\" "updateDialogShown" "false"
	
	; FULLY SUPPORTED
	${NSD_GetState} $jpg $jpg_state
	${NSD_GetState} $png $png_state
	${NSD_GetState} $tif $tif_state
	${NSD_GetState} $bmp $bmp_state
	${NSD_GetState} $pbm $pbm_state
	${NSD_GetState} $pgm $pgm_state
	${NSD_GetState} $xbm $xbm_state
	${NSD_GetState} $xpm $xpm_state
	${NSD_GetState} $jp2k $jp2k_state
	${NSD_GetState} $webp $webp_state

	${If} $jpg_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".jpg" "nomacs.file.jpg" "JPG Image"
		${registerExtension} "$INSTDIR\nomacs.exe" ".jpeg" "nomacs.file.jpg" "JPG Image"
	${EndIf}
	
	${If} $png_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".png" "nomacs.file.png" "PNG Image"
	${EndIf}

	${If} $tif_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".tif" "nomacs.file.tif"  "TIF Image"
		${registerExtension} "$INSTDIR\nomacs.exe" ".tiff" "nomacs.file.tif" "TIF Image"
	${EndIf}

	${If} $bmp_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".bmp" "nomacs.file.bmp" "BMP Image"
	${EndIf}

	${If} $pbm_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".pbm" "nomacs.file.pbm" "PBM Image"
	${EndIf}

	${If} $pgm_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".pgm" "nomacs.file.pgm" "PGM Image"
	${EndIf}

	${If} $xbm_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".xbm" "nomacs.file.xbm" "XBM Image"
	${EndIf}

	${If} $xpm_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".xpm" "nomacs.file.xpm" "XPM Image"
	${EndIf}

	${If} $jp2k_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".jp2k" "nomacs.file.jp2k" "JPEG2000 Image"
		${registerExtension} "$INSTDIR\nomacs.exe" ".jp2" "nomacs.file.jp2" "JPEG2000 Image"
	${EndIf}

	${If} $webp_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".webp" "nomacs.file.xpm" "WebP Image"
	${EndIf}
	
	; PARTIALLY SUPPORTED
	${NSD_GetState} $gif $gif_state
	${NSD_GetState} $nef $nef_state
	${NSD_GetState} $crw $crw_state
	${NSD_GetState} $cr2 $cr2_state
	${NSD_GetState} $arw $arw_state
	${NSD_GetState} $mpo $mpo_state
	${NSD_GetState} $rw2 $rw2_state
	${NSD_GetState} $mrw $mrw_state
	${NSD_GetState} $jps $jps_state
	${NSD_GetState} $dng $dng_state
	${NSD_GetState} $pns $pns_state
	${NSD_GetState} $psd $psd_state

	${If} $gif_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".gif" "nomacs.file.gif" "GIF Image"
	${EndIf}

	${If} $nef_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".nef" "nomacs.file.nef" "Nikon Raw"
	${EndIf}

	${If} $crw_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".crw" "nomacs.file.crw" "Canon Raw"
	${EndIf}

	${If} $cr2_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".cr2" "nomacs.file.cr2" "Canon Raw"
	${EndIf}

	${If} $arw_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".arw" "nomacs.file.arw" "Sony Raw"
	${EndIf}

	${If} $rw2_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".rw2" "nomacs.file.rw2" "Panasonic Raw"
	${EndIf}

	${If} $mrw_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".mrw" "nomacs.file.mrw" "Minolta Raw"
	${EndIf}

	${If} $mpo_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".mpo" "nomacs.file.mpo" "MPO Image"
	${EndIf}
	
	${If} $jps_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".jps" "nomacs.file.jps" "JPEG Stereo"
	${EndIf}

	${If} $dng_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".dng" "nomacs.file.dng" "Digital Negative"
	${EndIf}
	
	${If} $pns_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".pns" "nomacs.file.pns" "PNG Stereo"
	${EndIf}

	${If} $psd_state == ${BST_CHECKED}
		${registerExtension} "$INSTDIR\nomacs.exe" ".psd" "nomacs.file.psd" "Photoshop Image"
	${EndIf}
	
	Call RefreshShellIcons
	
FunctionEnd

Function checkAllFully
	${NSD_GetState} $checkAllFully $checkAllFully_State
	${If} $checkAllFully_state == ${BST_CHECKED}
		${NSD_SetState} $jpg ${BST_CHECKED}
		${NSD_SetState} $png ${BST_CHECKED}
		${NSD_SetState} $tif ${BST_CHECKED}
		${NSD_SetState} $bmp ${BST_CHECKED}
		${NSD_SetState} $pbm ${BST_CHECKED}
		${NSD_SetState} $pgm ${BST_CHECKED}
		${NSD_SetState} $xbm ${BST_CHECKED}
		${NSD_SetState} $xpm ${BST_CHECKED}
		${NSD_SetState} $jp2k ${BST_CHECKED}
		${NSD_SetState} $webp ${BST_CHECKED}
	${Else}
		${NSD_SetState} $jpg ${BST_UNCHECKED}
		${NSD_SetState} $png ${BST_UNCHECKED}
		${NSD_SetState} $tif ${BST_UNCHECKED}
		${NSD_SetState} $bmp ${BST_UNCHECKED}
		${NSD_SetState} $pbm ${BST_UNCHECKED}
		${NSD_SetState} $pgm ${BST_UNCHECKED}
		${NSD_SetState} $xbm ${BST_UNCHECKED}
		${NSD_SetState} $xpm ${BST_UNCHECKED}	
		${NSD_SetState} $jp2k ${BST_UNCHECKED}	
		${NSD_SetState} $webp ${BST_UNCHECKED}	
	${EndIf}
	

FunctionEnd


Function checkAllPartially
	${NSD_GetState} $checkAllPartially $checkAllPartially_State
	${If} $checkAllPartially_state == ${BST_CHECKED}
		${NSD_SetState} $gif ${BST_CHECKED}
		${NSD_SetState} $nef ${BST_CHECKED}
		${NSD_SetState} $crw ${BST_CHECKED}
		${NSD_SetState} $cr2 ${BST_CHECKED}
		${NSD_SetState} $arw ${BST_CHECKED}
		${NSD_SetState} $rw2 ${BST_CHECKED}
		${NSD_SetState} $mrw ${BST_CHECKED}
		${NSD_SetState} $mpo ${BST_CHECKED}
		${NSD_SetState} $jps ${BST_CHECKED}
		${NSD_SetState} $dng ${BST_CHECKED}
		${NSD_SetState} $pns ${BST_CHECKED}
		${NSD_SetState} $psd ${BST_CHECKED}
	${Else}
		${NSD_SetState} $gif ${BST_UNCHECKED}
		${NSD_SetState} $nef ${BST_UNCHECKED}
		${NSD_SetState} $crw ${BST_UNCHECKED}
		${NSD_SetState} $cr2 ${BST_UNCHECKED}
		${NSD_SetState} $arw ${BST_UNCHECKED}
		${NSD_SetState} $rw2 ${BST_UNCHECKED}
		${NSD_SetState} $mrw ${BST_UNCHECKED}
		${NSD_SetState} $mpo ${BST_UNCHECKED}
		${NSD_SetState} $jps ${BST_UNCHECKED}
		${NSD_SetState} $dng ${BST_UNCHECKED}
		${NSD_SetState} $pns ${BST_UNCHECKED}
		${NSD_SetState} $psd ${BST_UNCHECKED}
	${EndIf}
	

FunctionEnd

!define SHCNE_ASSOCCHANGED 0x08000000
!define SHCNF_IDLIST 0
 
Function RefreshShellIcons
  ; By jerome tremblay - april 2003
  System::Call 'shell32.dll::SHChangeNotify(i, i, i, i) v \
  (${SHCNE_ASSOCCHANGED}, ${SHCNF_IDLIST}, 0, 0)'
FunctionEnd


Section "MainSection" SEC01#
	loop:
	${nsProcess::FindProcess} "nomacs.exe" $R0
	StrCmp $R0 0 0 +2
	MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION 'Close "nomacs - ImageLounge" before continuing' IDOK loop IDCANCEL end
	goto next
	end:
		quit

	next:
		${nsProcess::Unload}

  SetOutPath "$INSTDIR"
  SetOverwrite on
  File "${BUILD_DIR}\nomacs.exe"
  CreateDirectory "$SMPROGRAMS\nomacs - image lounge"
  CreateShortCut "$SMPROGRAMS\nomacs - image lounge\nomacs - image lounge.lnk" "$INSTDIR\nomacs.exe"
  
  File "${BUILD_DIR}\..\nomacs_*.qm"
  
  File "${BUILD_DIR}\libnomacs.dll"
  File "${BUILD_DIR}\exiv2.dll"
  File "${BUILD_DIR}\libexpat.dll"
  File "${BUILD_DIR}\libjasper.dll"
  File "${BUILD_DIR}\libraw.dll"
  File "${BUILD_DIR}\msvcp*.dll"
  File "${BUILD_DIR}\msvcr*.dll"
  File "${BUILD_DIR}\opencv_core*.dll"
  File "${BUILD_DIR}\opencv_imgproc*.dll"
  File "${BUILD_DIR}\QtCore4.dll"
  File "${BUILD_DIR}\QtGui4.dll"
  File "${BUILD_DIR}\QtNetwork4.dll"
  File "${BUILD_DIR}\zlib1.dll"
  
  
  File "${README_DIR}\COPYRIGHT"
  File "${README_DIR}\LICENSE.GPLv2"
  File "${README_DIR}\LICENSE.GPLv3"
  File "${README_DIR}\LICENSE.LGPL"
  File "${README_DIR}\LICENSE.OPENCV"
  SetOutPath "$INSTDIR\imageformats"
  File "${BUILD_DIR}\imageformats\*"
  
	IfSilent isSilent isNotSilent
		isSilent:
			
			
			${If} $fileAss S== "All"
				${registerExtension} "$INSTDIR\nomacs.exe" ".jpg" "nomacs.file.jpg" "JPG Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".jpeg" "nomacs.file.jpg" "JPG Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".png" "nomacs.file.png" "PNG Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".tif" "nomacs.file.tif"  "TIF Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".tiff" "nomacs.file.tif" "TIF Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".bmp" "nomacs.file.bmp" "BMP Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".pbm" "nomacs.file.pbm" "PBM Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".pgm" "nomacs.file.pgm" "PGM Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".xbm" "nomacs.file.xbm" "XBM Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".xpm" "nomacs.file.xpm" "XPM Image"			
				${registerExtension} "$INSTDIR\nomacs.exe" ".jp2k" "nomacs.file.xpm" "JPEG2000 Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".webp" "nomacs.file.xpm" "WebP Image"

				${registerExtension} "$INSTDIR\nomacs.exe" ".gif" "nomacs.file.gif" "GIF Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".nef" "nomacs.file.nef" "Nikon Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".crw" "nomacs.file.crw" "Canon Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".cr2" "nomacs.file.cr2" "Canon Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".arw" "nomacs.file.arw" "Sony Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".rw2" "nomacs.file.rw2" "Panasonic Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".mrw" "nomacs.file.mrw" "Minolta Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".mpo" "nomacs.file.mpo" "MPO Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".jps" "nomacs.file.jps" "JPEG Stereo"
				${registerExtension} "$INSTDIR\nomacs.exe" ".dng" "nomacs.file.dng" "Digital Negative"
				${registerExtension} "$INSTDIR\nomacs.exe" ".pns" "nomacs.file.pns" "PNG Stereo"
				${registerExtension} "$INSTDIR\nomacs.exe" ".psd" "nomacs.file.psd" "Photoshop Image"
				
			${elseif} $fileAss S== "AllFullySupported"
				${registerExtension} "$INSTDIR\nomacs.exe" ".jpg" "nomacs.file.jpg" "JPG Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".jpeg" "nomacs.file.jpg" "JPG Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".png" "nomacs.file.png" "PNG Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".tif" "nomacs.file.tif"  "TIF Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".tiff" "nomacs.file.tif" "TIF Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".bmp" "nomacs.file.bmp" "BMP Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".pbm" "nomacs.file.pbm" "PBM Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".pgm" "nomacs.file.pgm" "PGM Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".xbm" "nomacs.file.xbm" "XBM Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".xpm" "nomacs.file.xpm" "XPM Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".jp2k" "nomacs.file.xpm" "JPEG2000 Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".webp" "nomacs.file.xpm" "WebP Image"
				
			${elseif} $fileAss S== "AllPartiallySupported"
				${registerExtension} "$INSTDIR\nomacs.exe" ".gif" "nomacs.file.gif" "GIF Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".nef" "nomacs.file.nef" "Nikon Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".crw" "nomacs.file.crw" "Canon Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".cr2" "nomacs.file.cr2" "Canon Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".arw" "nomacs.file.arw" "Sony Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".rw2" "nomacs.file.rw2" "Panasonic Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".mrw" "nomacs.file.mrw" "Minolta Raw"
				${registerExtension} "$INSTDIR\nomacs.exe" ".mpo" "nomacs.file.mpo" "MPO Image"
				${registerExtension} "$INSTDIR\nomacs.exe" ".jps" "nomacs.file.jps" "JPEG Stereo"
				${registerExtension} "$INSTDIR\nomacs.exe" ".dng" "nomacs.file.dng" "Digital Negative"
				${registerExtension} "$INSTDIR\nomacs.exe" ".pns" "nomacs.file.pns" "PNG Stereo"
				${registerExtension} "$INSTDIR\nomacs.exe" ".psd" "nomacs.file.psd" "Photoshop Image"				
			${endif}
		isNotSilent:

  
SectionEnd

Function finishpageaction
	CreateShortCut "$DESKTOP\nomacs - image lounge.lnk" "$INSTDIR\nomacs.exe"
FunctionEnd

Function launchnomacs
	Exec '"$WINDIR\explorer.exe" "$INSTDIR\nomacs.exe"'
FunctionEnd  

Section -AdditionalIcons
  SetOutPath $INSTDIR
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\nomacs - image lounge\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\nomacs - image lounge\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\nomacs.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\nomacs.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer." /SD IDOK
FunctionEnd

Function un.onInit
	loop:
	${nsProcess::FindProcess} "nomacs.exe" $R0
	StrCmp $R0 0 0 +2
	 MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION 'Close "nomacs - ImageLounge" before continuing' IDOK loop IDCANCEL end
	 goto next
	 end:
		 quit

	next:
		${nsProcess::Unload}

	; MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" /SD IDYES IDYES +2
	; Abort    
FunctionEnd


Function un.uninstallNomacs
	${NSD_GetState} $hCtl_uninstaller_CheckBox1 $hCtl_uninstaller_CheckBox1_state
	${If} $hCtl_uninstaller_CheckBox1_state == ${BST_CHECKED}
		DeleteRegKey HKCU "Software\nomacs"
		; MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION 'das ist nur ein test $hCtl_uninstaller_CheckBox1_state' IDOK  +1 IDCANCEL  +1 
	${endif}
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\imageformats\*"
  Delete "$INSTDIR\*.dll"
  Delete "$INSTDIR\*.exe"
  Delete "$INSTDIR\*.qm"
  
  Delete "$INSTDIR\COPYRIGHT"
  Delete "$INSTDIR\LICENSE.GPLv2"
  Delete "$INSTDIR\LICENSE.GPLv3"
  Delete "$INSTDIR\LICENSE.LGPL"
  Delete "$INSTDIR\LICENSE.OPENCV"
  
  Delete "$SMPROGRAMS\nomacs - image lounge\Uninstall.lnk"
  Delete "$SMPROGRAMS\nomacs - image lounge\Website.lnk"
  Delete "$DESKTOP\nomacs - image lounge.lnk"
  Delete "$SMPROGRAMS\nomacs - image lounge\nomacs - image lounge.lnk"

  RMDir "$SMPROGRAMS\nomacs - image lounge"
  RMDir "$INSTDIR\imageformats"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  ; DeleteRegKey HKCU "Software\nomacs"
  
  ${UnRegisterExtension} ".jpg" "nomacs.file.jpg"
  ${UnRegisterExtension} ".jpeg" "nomacs.file.jpg"
  ${UnRegisterExtension} ".png" "nomacs.file.png"
  ${UnRegisterExtension} ".tif" "nomacs.file.tif" 
  ${UnRegisterExtension} ".tiff" "nomacs.file.tif"
  ${UnRegisterExtension} ".bmp" "nomacs.file.bmp"
  ${UnRegisterExtension} ".pbm" "nomacs.file.pbm"
  ${UnRegisterExtension} ".pgm" "nomacs.file.pgm"
  ${UnRegisterExtension} ".xbm" "nomacs.file.xbm"
  ${UnRegisterExtension} ".xpm" "nomacs.file.xpm"
  ${UnRegisterExtension} ".jp2k" "nomacs.file.jp2k"
  ${UnRegisterExtension} ".webp" "nomacs.file.webp" 

  ${UnRegisterExtension} ".gif" "nomacs.file.gif"
  ${UnRegisterExtension} ".nef" "nomacs.file.nef"  
  ${UnRegisterExtension} ".crw" "nomacs.file.crw"  
  ${UnRegisterExtension} ".cr2" "nomacs.file.cr2"  
  ${UnRegisterExtension} ".arw" "nomacs.file.arw"  
  ${UnRegisterExtension} ".rw2" "nomacs.file.rw2"  
  ${UnRegisterExtension} ".mrw" "nomacs.file.mrw"  
  ${UnRegisterExtension} ".mpo" "nomacs.file.mpo"  
  ${UnRegisterExtension} ".jps" "nomacs.file.jps"  
  ${UnRegisterExtension} ".dng" "nomacs.file.dng"  
  ${UnRegisterExtension} ".pns" "nomacs.file.pns"  
  ${UnRegisterExtension} ".psd" "nomacs.file.psd"  
  
  SetAutoClose true
SectionEnd
