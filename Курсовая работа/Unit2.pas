unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, Spin, ActnList, ComCtrls, ToolWin, AppEvnts;

type
  TChildForm = class(TForm)
    RichEdit1: TRichEdit;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChildForm: TChildForm;
  i: byte;

implementation
uses Unit1;

{$R *.dfm}




procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if RichEdit1.Text='' then Action:=caFree else
   begin
     if MessageDlg('Сохранить текст перед закрытием?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then        //закрытие дочерней формы
        begin
         if not SaveDialog1.Execute then exit;                
         RichEdit1.Lines.SaveToFile(SaveDialog1.Filename);  
         Action:=caFree
        end else Action:=caFree
     end;
end;

end.


