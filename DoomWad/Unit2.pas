unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,Unit1,
  StdCtrls, ComCtrls,Unit3;

type
  TDumpForm = class(TForm)
    ReturnB: TButton;
    DumpMemo: TMemo;
    SaveDialog1: TSaveDialog;
    procedure ReturnBClick(Sender: TObject);
    procedure ReturnBKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure DumpLump(LumpIndex:Longint);
    { Public declarations }
  end;

var
  DumpForm: TDumpForm;
  GLumpIndex:longint;

implementation

{$R *.DFM}

procedure TDumpForm.DumpLump(LumpIndex:Longint);
var  Counter:longint;
     LumpCash:array of byte;
begin
     GLumpIndex:=LumpIndex;
     caption:=
              '  Lump Offset = '+inttostr(WadDic[LumpIndex].LumpOffset)+
              '  Lump Length = '+inttostr(WadDic[LumpIndex].LumpLen) +
              '  Lump Name = '+string(WadDic[LumpIndex].LumpName);

     setlength(LumpCash,WadDic[LumpIndex].LumpLen+1);
     seek(CurFile,WadDic[LumpIndex].LumpOffset);
     blockread(CurFile,(@LumpCash[1])^,WadDic[LumpIndex].LumpLen);
     for counter:=1 to WadDic[LumpIndex].LumpLen do
         if LumpCash[Counter]<32 then LumpCash[Counter]:=ord('.');
     LumpCash[WadDic[LumpIndex].LumpLen]:=0;

     DumpMemo.Lines.Text :=AnsiString(@LumpCash[1]);
     DumpForm.showmodal;
end;

procedure TDumpForm.ReturnBClick(Sender: TObject);
begin
     ModalResult:= mrOK;
end;

procedure TDumpForm.ReturnBKeyPress(Sender: TObject; var Key: Char);
begin
     if key=chr(27) then ModalResult:= mrOK;
end;

end.
