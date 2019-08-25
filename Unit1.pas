unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, MPlayer, ExtCtrls, SUIForm, SUIButton,
  StdCtrls, DBCtrls, SUIDBCtrls, SUIListBox, FileCtrl, SUIComboBox,
  RzBorder, SUIImagePanel, Menus, SUIMainMenu, Gauges, RzBckgnd,
  SUIPopupMenu, RzTrkBar, dcMinTray, ComCtrls, SSVolumeController;

type
  TForm1 = class(TForm)
    suiForm1: TsuiForm;
    MediaPlayer1: TMediaPlayer;
    XPManifest1: TXPManifest;
    suiButton1: TsuiButton;
    OpenDialog1: TOpenDialog;
    suiDirectoryListBox1: TsuiDirectoryListBox;
    suiDriveComboBox1: TsuiDriveComboBox;
    suiFileListBox1: TsuiFileListBox;
    RzLEDDisplay1: TRzLEDDisplay;
    Timer1: TTimer;
    RzLEDDisplay3: TRzLEDDisplay;
    RzSeparator1: TRzSeparator;
    RzSeparator2: TRzSeparator;
    Gauge1: TGauge;
    suiMainMenu1: TsuiMainMenu;
    Timer2: TTimer;
    Gizle1: TMenuItem;
    ProgramHakknda1: TMenuItem;
    CoderHakknda1: TMenuItem;
    Byalikadirleiletiim1: TMenuItem;
    Edit1: TEdit;
    suiPopupMenu1: TsuiPopupMenu;
    A1: TMenuItem;
    Kapat1: TMenuItem;
    MediaplayerCodedByalikadir1: TMenuItem;
    suiMSNPopForm1: TsuiMSNPopForm;
    ransparanlkver1: TMenuItem;
    MediaplayerCodedByalikadir2: TMenuItem;
    RzLEDDisplay2: TRzLEDDisplay;
    RzSeparator3: TRzSeparator;
    RzSeparator4: TRzSeparator;
    RzSeparator5: TRzSeparator;
    RzSeparator6: TRzSeparator;
    volum: TssVolumeController;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    procedure suiButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure suiFileListBox1DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Gizle1Click(Sender: TObject);
    procedure ProgramHakknda1Click(Sender: TObject);
    procedure CoderHakknda1Click(Sender: TObject);
    procedure Byalikadirleiletiim1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure Kapat1Click(Sender: TObject);

    procedure ScrollBar1Change(Sender: TObject);
    procedure MediaplayerCodedByalikadir1Click(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.suiButton1Click(Sender: TObject);
begin
mediaplayer1.FileName:=(suifilelistbox1.FileName);
mediaplayer1.Open;
mediaplayer1.Play;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
suifilelistbox1.Mask:= '*.mp3;*.wav;*.wma;*.wmv;*.dat;*.avi';
Rzleddisplay3.Caption:='By alikadir - player';

end;

procedure TForm1.suiFileListBox1DblClick(Sender: TObject);
begin
with mediaplayer1 do
 begin
close;

filename:=suifilelistbox1.Filename;
open;
play;
end;
rzleddisplay3.Caption:='Caliyor..'+(edit1.text);
 suiMSNPopForm1.Title:='By alikadir - player';
suiMSNPopForm1.MessageText:=edit1.text+#13+#13+'çalýyooor..' ;
suiMSNPopForm1.Popup;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 Timer1.Interval:=1000;
Timer1.Enabled:=true;
rzleddisplay1.caption:=TimeToStr(Now);
rzleddisplay2.caption:=datetostr(Now);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
with mediaplayer1 do
if filename <>'' then
//label1.Caption:=inttostr(mediaplayer1.Position);
scrollbar2.Position:=round(100*position/length);

end;

procedure TForm1.Gizle1Click(Sender: TObject);
begin
form1.Hide;
end;

procedure TForm1.ProgramHakknda1Click(Sender: TObject);
begin
form2.show;

end;

procedure TForm1.CoderHakknda1Click(Sender: TObject);
begin
showmessage(' Ben Ali Kadir Baðcýoðlu AKB software & Design firmasýnýn coder yim'+#13+'Bilgisayar ve programcýlýk benim için bi tutku '+#13
+'CAHÝLLERLE GÝRDÝÐÝM HER TARTIÞMAYI KAYBETTÝM ( imam gazali)'+#13
+'Herkez biþeyler bilsin bi konuda uzman olsun cahillik baþa bela :) ');
end;

procedure TForm1.Byalikadirleiletiim1Click(Sender: TObject);
begin
showmessage ( ' cep tlf 05058091390 '+#13+
'msn ve e posta alikadirbagcioglu@hotmail.com'+#13
+'AKB Software & Design ');
end;

procedure TForm1.A1Click(Sender: TObject);
begin
   form1.Show;
end;

procedure TForm1.Kapat1Click(Sender: TObject);
begin
form1.Close;
end;




procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
volum.Volume:=scrollbar1.Position;
if scrollbar1.Position=0 then
begin
volum.Mute:=true;
end
else
begin
volum.Mute:=false;
end;

end;

procedure TForm1.MediaplayerCodedByalikadir1Click(Sender: TObject);
var x:integer;
begin
x:=strtoint(inputbox(' Transparanlýk ver.. ','255 - 0  Arasý deðer ver','255'));
if (x>255) and (x<0) then
begin
x:=strtoint(inputbox(' 0 - 255 arasý yazsana kardeþiiim ! ','255 - 0  Arasý deðer ver','255'));
end;
form1.AlphaBlendValue:= (x);
end;
procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
with mediaplayer1 do
begin
Pause;
Position:=((scrollbar2.Position /100)* Length);
end;
end;

end.

