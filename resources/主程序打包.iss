; 脚本由 Inno Setup 脚本向导 生成！
; 有关创建 Inno Setup 脚本文件的详细资料请查阅帮助文档！

#define MyAppName "停车场车牌识别"
#define MyAppVersion "1.0.0.22"
#define MyAppPublisher "东陆高新实业有限公司"
#define MyAppURL "http://www.dongluhitec.com/"
#define MyDateTimeString GetDateTimeString('_yyyymmddhhnnss', '-', ':')

[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (生成新的GUID，点击 工具|在IDE中生成GUID。)
AppId={{5F6B2625-1F5E-407B-870C-4D7DF4B17CFF}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=D:\Program Files\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=.
OutputBaseFilename=停车场车牌识别{#MyAppVersion}{#MyDateTimeString}
Compression=lzma
SolidCompression=yes


[Languages]
Name: "chinesesimp"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "服务器.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "服务器.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "更新方式.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "更新概述.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "客户端.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "客户端.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "配置说明.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\*"; DestDir: "{app}\bin"; Flags: ignoreversion recursesubdirs createallsubdirs
; 注意: 不要在任何共享系统文件上使用“Flags: ignoreversion”

;删除旧版本文件
[installDelete]
Type: filesandordirs; Name:"{app}\bin\jar"
Type: filesandordirs; Name:"{app}\bin\native"
;开始菜单快捷方式： 
[Icons]
Name: "{group}\停车场服务器"; Filename: "{app}\服务器.exe";WorkingDir: "{app}"
Name: "{group}\停车场客户端"; Filename: "{app}\客户端.exe";WorkingDir: "{app}" 
;桌面快捷方式： 
Name: "{userdesktop}\停车场服务器"; Filename: "{app}\服务器.exe"; WorkingDir: "{app}"
Name: "{userdesktop}\停车场客户端"; Filename: "{app}\客户端.exe"; WorkingDir: "{app}"  
;开始菜单卸载快捷方式： 
Name: "{group}\{cm:UninstallProgram,停车场车牌识别}"; Filename: "{uninstallexe}"

[registry]
Root: HKCU; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\客户端.exe"; ValueData: "RUNASADMIN"
Root: HKCU; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\服务器.exe"; ValueData: "RUNASADMIN"

[Run]Filename: "{app}\服务器.exe"; Description: "{cm:LaunchProgram,停车场服务器}"; Flags: nowait postinstall skipifsilent
Filename: "{app}\客户端.exe"; Description: "{cm:LaunchProgram,停车场客户端}"; Flags: nowait postinstall skipifsilent

[code]
function NextButtonClick(CurPageID: Integer): Boolean;
var ResultCode: Integer;
var IsSetup : Boolean;
var AppPath:String;
var Search:String;
begin
IsSetup := true ;
  if CurPageID>1  then
  begin
    AppPath:=ExpandConstant('{app}');
    if Pos('C:',AppPath)>0  then
    begin
      MsgBox('安装程序不能装在C盘:'+AppPath,mbInformation,MB_OK);
      IsSetup := false ;
    end
    if Pos('c:',AppPath)>0   then
    begin
      MsgBox('安装程序不能装在C盘:'+AppPath,mbInformation,MB_OK);
      IsSetup := false ;
    end
  end

Result := IsSetup;
end;   