Asadbek Tools — ZIP & MSI qurish / o'rnatish

Talablar:
- WiX Toolset o'rnatilgan (candle.exe, light.exe) yoki Inno Setup (alternativ).
- Administrator huquqlari (installer uchun tavsiya qilinadi).

1) ZIP yaratish (tez)
- PowerShell: create_zip.ps1 skriptini ishga tushiring. U bundle papkasi tuzadi va AsadbekTools_bundle.zip faylini yaratadi.

2) MSI qurish (WiX talab qilinadi)
- WiX Toolset (3.x yoki 4.x) o'rnating.
- Terminalda:
  candle.exe AsadbekTools.wxs
  light.exe -out AsadbekTools.msi AsadbekTools.wixobj
- Eslatma: AsadbekTools.wxs ichida GUIDlarni (UpgradeCode va Component Guid) almashtiring (New-Guid PowerShell bilan yarating).

3) O'rnatish
- MSI ni ishga tushiring (Administrator tavsiya qilinadi).
- Installer %ProgramData%\Autodesk\ApplicationPlugins\AsadbekTools.bundle ni yaratadi.
- AutoCAD 2022 ni oching. Agar bundle avtomatik yuklanmasa, Manage -> Load ApplicationPackage yoki Manage -> Customize yordamida CUIX ni yuklang (bundle\Contents\Windows\AsadbekTools.cuix).

Sinov buyruqlari AutoCAD ichida:
- DELINSIDE  (yopiq poligonni tanlang)
- DELOUTSIDE
- GG
- Q