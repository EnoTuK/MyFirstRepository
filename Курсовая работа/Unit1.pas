unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, ImgList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdCmdTCPClient, StdCtrls, ComCtrls, ToolWin,
  AppEvnts, ExtCtrls, StdActns, shellAPI;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Open1: TMenuItem;
    Exit1: TMenuItem;
    OpenDialog1: TOpenDialog;
    N3: TMenuItem;
    Kaskad: TMenuItem; //element menu
    Mozaik: TMenuItem;  // элемент меню
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    PopupMenu1: TPopupMenu;
    ToolBar1: TToolBar;
    ToolButton11: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ComboBox1: TComboBox;
    ActionList2: TActionList;
    New: TAction;
    Open: TAction;
    Save: TAction;
    Saveass: TAction;
    Copy: TAction;
    Paste: TAction;
    Spisok: TAction;
    UpSizeText: TAction;
    DownSizeText: TAction;
    BoldText: TAction;
    ItalicText: TAction;
    UnderlineText: TAction;
    ImageList1: TImageList;
    ToolButton14: TToolButton;
    Cut: TAction;
    SaveDialog1: TSaveDialog;
    ApplicationEvents1: TApplicationEvents;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    N5: TMenuItem;
    N8: TMenuItem;
    NumberSpisok: TAction;
    ToolButton16: TToolButton;
    N9: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N16: TMenuItem;
    BoldText1: TMenuItem;
    ItalicText1: TMenuItem;
    UnderlineText1: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    Spisok1: TMenuItem;
    NumberSpisok1: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    UpSizeText1: TMenuItem;
    DownSizeText1: TMenuItem;
    LeftText: TAction;
    RightText: TAction;
    CentreText: TAction;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    Cut2: TMenuItem;
    Copy2: TMenuItem;
    Paste2: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    NumberSpisok2: TMenuItem;
    Spisok2: TMenuItem;
    N25: TMenuItem;
    ToolButton4: TToolButton;
    ComboBox2: TComboBox;
    ToolButton6: TToolButton;
    N15: TMenuItem;
    procedure NewExecute(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure OpenExecute(Sender: TObject);
    procedure KaskadClick(Sender: TObject);
    procedure MozaikClick(Sender: TObject);
    procedure SaveasExecute(Sender: TObject);
    procedure SaveExecute(Sender: TObject);
    procedure CopyExecute(Sender: TObject);
    procedure PasteExecute(Sender: TObject);
    procedure CutExecute(Sender: TObject);
    procedure SpisokExecute(Sender: TObject);
    procedure UpSizeTextExecute(Sender: TObject);
    procedure DownSizeTextExecute(Sender: TObject);
    procedure BoldTextExecute(Sender: TObject);
    procedure ItalicTextExecute(Sender: TObject);
    procedure UnderlineTextExecute(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Change(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure NumberSpisokExecute(Sender: TObject);
    procedure LeftTextExecute(Sender: TObject);
    procedure RightTextExecute(Sender: TObject);
    procedure CentreTextExecute(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure HelpContents1Execute(Sender: TObject);
    procedure N15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
 uses Unit2, About;
{$R *.dfm}

procedure TMainForm.ApplicationEvents1Hint(Sender: TObject);
begin
StatusBar1.Panels[2].Text:=Application.Hint;                 //statusbar
end;

procedure TMainForm.BoldTextExecute(Sender: TObject);
begin
if fsBold in (ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style then
  begin
  (ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style:=(ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style-[fsBold];
  BoldText.Checked:=False                                    //Полужирный шрифт
  end else begin
  (ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style:=(ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style+[fsBold];
  BoldText.Checked:=True;
  end;
end;

procedure TMainForm.CentreTextExecute(Sender: TObject);
begin
if (ActiveMDIChild as TChildForm).RichEdit1.Paragraph.Alignment=taCenter then
begin
    (ActiveMDIChild as TChildForm).RichEdit1.Paragraph.Alignment:=taLeftJustify; 
    CentreText.Checked:=false;                               // расположение текста по центру
  end else begin
    (ActiveMDIChild as TChildForm).RichEdit1.Paragraph.Alignment:=taCenter;
    CentreText.Checked:=true;
    RightText.Checked:=False;
    LeftText.Checked:=false;
end;
end;

procedure TMainForm.ComboBox1Change(Sender: TObject);
begin
if ComboBox1.Text <> '' then                                 //Размер текста указывается в Combobox
(ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Size:=StrToInt(ComboBox1.Text);
end;

procedure TMainForm.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9']) then  Key := #0;                  //запрет на ввод других значений в Combobox
end;

procedure TMainForm.ComboBox2Change(Sender: TObject);
begin
(ActiveMDIChild as TChildForm).Richedit1.SelAttributes.Name:=combobox2.Text //смена шрифта через combobox
end;

procedure TMainForm.CopyExecute(Sender: TObject);
begin
(ActiveMDIChild as TChildForm).RichEdit1.CopyToClipboard;    //Копировать
end;

procedure TMainForm.CutExecute(Sender: TObject);
begin
(ActiveMDIChild as TChildForm).RichEdit1.CutToClipboard;     //Вырезать
end;

procedure TMainForm.DownSizeTextExecute(Sender: TObject);
begin
 ComboBox1.ItemIndex:=ComboBox1.ItemIndex-1;                 //Уменьшить размер текста
 (ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Size:=StrToInt(ComboBox1.Text);
end;

procedure TMainForm.ExitExecute(Sender: TObject);
begin
MainForm.Close;
end;


procedure TMainForm.FormCreate(Sender: TObject);
begin
 N8.Enabled:=False;
 Save.Enabled:=False;
 Saveass.Enabled:=False;
 Copy.Enabled:=False;
 Paste.Enabled:=False;
 cut.Enabled:=False;
 Spisok.Enabled:=False;                                   //Запуск редактора                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
 UpSizeText.Enabled:=False;                               //Недоступные кнопки
 DownSizeText.Enabled:=False;
 BoldText.Enabled:=False;
 ItalicText.Enabled:=False;
 UnderlineText.Enabled:=False;
 NumberSpisok.Enabled:=False;
 Combobox2.Items:=Screen.Fonts;
end;

procedure TMainForm.HelpContents1Execute(Sender: TObject);
begin
 ShellExecute(0,Pchar('open'),Pchar('Help.chm'), nil,nil, SW_Show);
end;

procedure TMainForm.ItalicTextExecute(Sender: TObject);
begin
if fsItalic in (ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style then
  begin
  (ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style:=(ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style-[fsItalic];
  ItalicText.Checked:=False                                //Курсивный шрифт
  end else begin
  (ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style:=(ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style+[fsItalic];
  ItalicText.Checked:=true;
  end;
end;

procedure TMainForm.KaskadClick(Sender: TObject);
begin
 Cascade;                                                 //расположение дочерних окон каскадом
end;

procedure TMainForm.LeftTextExecute(Sender: TObject);
begin
 if (ActiveMDIChild as TChildForm).RichEdit1.Paragraph.Alignment=taLeftJustify then
   begin
    (ActiveMDIChild as TChildForm).RichEdit1.Paragraph.Alignment:=taLeftJustify;
    LeftText.Checked:=false;                             //расположение текста по левому краю
   end else begin
    (ActiveMDIChild as TChildForm).RichEdit1.Paragraph.Alignment:=taLeftJustify;
     LeftText.Checked:=true;
     CentreText.Checked:=false;
     RightText.Checked:=false;
   end;
end;

procedure TMainForm.MozaikClick(Sender: TObject);
begin   
 Tile;                                                   //расположение дочерних окон мозаикой
 TileMode := tbVertical;                                  
end;



procedure TMainForm.N15Click(Sender: TObject);
begin
  ShellExecute(0,Pchar('open'),pchar('Help.chm'),nil,nil, SW_SHOW);   //Вызов "помощи"
end;

procedure TMainForm.N21Click(Sender: TObject);
var about: Taboutbox;
begin
  AboutBox.ShowModal;                                        // вызов "о программе"
end;


procedure TMainForm.N8Click(Sender: TObject);
begin

if (ActiveMDIChild as TChildForm).RichEdit1.Text='' then (ActiveMDIChild as TChildForm).Destroy else
   begin
     if MessageDlg('Сохранить текст перед закрытием?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
         if not SaveDialog1.Execute then exit;
         (ActiveMDIChild as TChildForm).RichEdit1.Lines.SaveToFile(SaveDialog1.Filename);   
         (ActiveMDIChild as TChildForm).Destroy
        end else (ActiveMDIChild as TChildForm).Destroy
     end;
    if MainForm.MDIChildCount=0 then
   begin                                                    //закрытие дочерней формы
    N8.Enabled:=False;
    Save.Enabled:=false;
    Saveass.Enabled:=false;
    Copy.Enabled:=false;
    Paste.Enabled:=false;
    cut.Enabled:=false;
    Spisok.Enabled:=false;
    UpSizeText.Enabled:=false;
    DownSizeText.Enabled:=false;
    BoldText.Enabled:=false;
    ItalicText.Enabled:=false;
    UnderlineText.Enabled:=false;
    NumberSpisok.Enabled:=false;
    LeftText.Checked:=false;
    RightText.Checked:=false;
    CentreText.Checked:=false;
  end;
end;

procedure TMainForm.NewExecute(Sender: TObject);
var I: byte;
childForm: TChildForm;
begin
inc(i);
ChildForm:=TChildForm.Create(self);                         
for i:=0 to MDIChildCount - 1 do
begin
ChildForm.Caption:='Текстовый редактор №'+IntToStr(i+1);
end;
ChildForm.Show;                                                  //Создание дочерних форм
 (ActiveMDIChild as TChildForm).RichEdit1.Text:='';
   N8.Enabled:=true;
   Save.Enabled:=true;
   Saveass.Enabled:=True;
   Copy.Enabled:=True;
   Paste.Enabled:=True;
   cut.Enabled:=True;
   Spisok.Enabled:=True;
   UpSizeText.Enabled:=True;
   DownSizeText.Enabled:=True;
   BoldText.Enabled:=True;
   ItalicText.Enabled:=True;
   UnderlineText.Enabled:=True;
   NumberSpisok.Enabled:=True;
   LeftText.Checked:=true;
{ if MainForm.MDIChildCount=0 then
  begin
   Save.Enabled:=false;
   Saveass.Enabled:=false;
   Copy.Enabled:=false;
   Paste.Enabled:=false;
   cut.Enabled:=false;
   Spisok.Enabled:=false;
   UpSizeText.Enabled:=false;
   DownSizeText.Enabled:=false;
   BoldText.Enabled:=false;
   ItalicText.Enabled:=false;
   UnderlineText.Enabled:=false;
  end;   }
end;

procedure TMainForm.NumberSpisokExecute(Sender: TObject);
begin                                                               //нумерованный список
 (ActiveMDIChild as TChildForm).Richedit1.Paragraph.Numbering:=Tnumberingstyle(2);
end;

procedure TMainForm.OpenExecute(Sender: TObject);
var childForm: TChildForm;
begin
if OpenDialog1.Execute then
begin                                                                //Открытие
 NewExecute(Self);
(ActiveMDIChild as TChildForm).RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
end;
end;

procedure TMainForm.PasteExecute(Sender: TObject);
begin
(ActiveMDIChild as TChildForm).RichEdit1.PasteFromClipboard;        //Вставить
end;

procedure TMainForm.RightTextExecute(Sender: TObject);
begin
if (ActiveMDIChild as TChildForm).RichEdit1.Paragraph.Alignment=taRightJustify then
begin
    (ActiveMDIChild as TChildForm).RichEdit1.Paragraph.Alignment:=taleftJustify;
     RightText.Checked:=false;                                      //расположение текста по правому краю
     end else begin
     (ActiveMDIChild as TChildForm).RichEdit1.Paragraph.Alignment:=tarightJustify;
     RightText.Checked:=true;
     CentreText.Checked:=false;
     LeftText.Checked:=false;
end;
end;

procedure TMainForm.SaveasExecute(Sender: TObject);
begin
SaveDialog1.FileName:=ActiveMDIChild.Caption;
If SaveDialog1.Execute then                                        //Сохранить как..
(ActiveMDIChild as TChildForm).RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
 ChildForm.Caption:=ExtractFilePath(SaveDialog1.FileName)+ExtractFileName(SaveDialog1.FileName);;
end;


procedure TMainForm.SaveExecute(Sender: TObject);
begin
if ChildForm.Caption='Текстовый редактор №'+IntToStr(i) then
 begin
 if not SaveDialog1.Execute then exit;                             //Сохранить
(ActiveMDIChild as TChildForm).RichEdit1.Lines.SaveToFile(SaveDialog1.Filename);
ChildForm.Caption:=ExtractFilePath(SaveDialog1.FileName)+ExtractFileName(SaveDialog1.FileName);;
 end else
  (ActiveMDIChild as TChildForm).RichEdit1.Lines.SavetoFile(SaveDialog1.Filename);
 end;


procedure TMainForm.SpisokExecute(Sender: TObject);
begin
  (ActiveMDIChild as TChildForm).Richedit1.Paragraph.Numbering:=nsBullet; //маркированный список
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].text:=DateToStr(now);                 //время в statusbar
  StatusBar1.Panels[1].text:=TimeToStr(now);
end;

procedure TMainForm.UnderlineTextExecute(Sender: TObject);
begin
if fsUnderline in (ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style then
  begin
  (ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style:=(ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style-[fsUnderline];
  UnderlineText.Checked:=False                              //Подчеркнутый шрифт
  end else begin
  (ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style:=(ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Style+[fsUnderline];
  UnderlineText.Checked:=True;
  end;
end;

procedure TMainForm.UpSizeTextExecute(Sender: TObject);
begin
 ComboBox1.ItemIndex:=ComboBox1.ItemIndex+1;              //Увеличить размер текста
 (ActiveMDIChild as TChildForm).RichEdit1.SelAttributes.Size:=StrToInt(ComboBox1.Text);
end;


end.
