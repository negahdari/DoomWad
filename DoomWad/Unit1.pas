unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ComCtrls, ExtCtrls,MMSystem, Grids,math, Menus;

type
  TWadForm = class(TForm)
    PageControl1: TPageControl;
    Map: TTabSheet;
    FX: TTabSheet;
    Mus: TTabSheet;
    All: TTabSheet;
    AllList: TListBox;
    MUSList: TListBox;
    FXSBList: TListBox;
    FXPSList: TListBox;
    Dump: TButton;
    MessageP: TTabSheet;
    MenuList: TListBox;
    SaveButton: TButton;
    SaveLump: TSaveDialog;
    LFXMean: TLabel;
    LFXSample: TLabel;
    LFXNoOfSample: TLabel;
    LZeroNo: TLabel;
    Flat: TTabSheet;
    FlatList: TListBox;
    PageOfMap: TPageControl;
    Things: TTabSheet;
    Linedefs: TTabSheet;
    Sidedefs: TTabSheet;
    Vertexes: TTabSheet;
    Segs: TTabSheet;
    Ssectors: TTabSheet;
    Nodes: TTabSheet;
    Sectors: TTabSheet;
    Reject: TTabSheet;
    Blockmap: TTabSheet;
    MapList: TListBox;
    Sprite: TTabSheet;
    Palette: TTabSheet;
    PalButton0: TButton;
    PalImage: TImage;
    PalButton1: TButton;
    PalButton2: TButton;
    PalButton3: TButton;
    PalButton4: TButton;
    PalButton5: TButton;
    PalButton6: TButton;
    PalButton7: TButton;
    PalButton8: TButton;
    PalButton9: TButton;
    PalButton10: TButton;
    PalButton11: TButton;
    PalButton12: TButton;
    PalButton13: TButton;
    StatusBar: TTabSheet;
    StatusList: TListBox;
    SpriteList: TListBox;
    MusMDL: TLabel;
    MusHDL: TLabel;
    MusPriChan: TLabel;
    MusSecChan: TLabel;
    MusZero: TLabel;
    MusNoOIP: TLabel;
    MusInsPatchList: TListBox;
    MusInsLabel: TLabel;
    Wall: TTabSheet;
    WallList: TListBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Quit1: TMenuItem;
    OpenDialog1: TOpenDialog;
    BGXCord: TLabel;
    BGYCord: TLabel;
    BlockInCol: TLabel;
    BlockInRow: TLabel;
    LevelX: TLabel;
    LevelY: TLabel;
    VertImage: TImage;
    VertexNo: TLabel;
    VImgSize: TLabel;
    LinesImage: TImage;
    LinesNo: TLabel;
    ColorMapTrackBar: TTrackBar;
    ColorMapLabel: TLabel;
    SaveAllButton: TButton;
    Picture: TTabSheet;
    PictureList: TListBox;
    FXImage: TImage;
    SoundPlayButton: TButton;
    Bevel1: TBevel;
    FlatPanel: TPanel;
    FlatImage: TImage;
    WallPanel: TPanel;
    WallImage: TImage;
    SpritePanel: TPanel;
    SpriteImage: TImage;
    MenuPanel: TPanel;
    StatusBarPanel: TPanel;
    PicturePanel: TPanel;
    MenuImage: TImage;
    StatusImage: TImage;
    PictureImage: TImage;
    StatusBar1: TStatusBar;
    ZomeOutButton: TButton;
    BestFitButton: TButton;
    ZomeInButton: TButton;
    BestFitCheck: TCheckBox;
    OrgSizeButton: TButton;
    About1: TMenuItem;
    procedure AllListClick(Sender: TObject);
    procedure AllListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DumpClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FXSBListClick(Sender: TObject);
    procedure FXPSListClick(Sender: TObject);
    procedure FlatListClick(Sender: TObject);
    procedure MenuListClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure SoundPlayButtonClick(Sender: TObject);
    procedure FXSBListEnter(Sender: TObject);
    procedure PalButton1Click(Sender: TObject);
    procedure PalButton2Click(Sender: TObject);
    procedure PalButton3Click(Sender: TObject);
    procedure PalButton4Click(Sender: TObject);
    procedure PalButton5Click(Sender: TObject);
    procedure PalButton6Click(Sender: TObject);
    procedure PalButton7Click(Sender: TObject);
    procedure PalButton8Click(Sender: TObject);
    procedure PalButton9Click(Sender: TObject);
    procedure PalButton10Click(Sender: TObject);
    procedure PalButton11Click(Sender: TObject);
    procedure PalButton12Click(Sender: TObject);
    procedure PalButton13Click(Sender: TObject);
    procedure StatusListClick(Sender: TObject);
    procedure SpriteListClick(Sender: TObject);
    procedure MUSListClick(Sender: TObject);
    procedure WallListClick(Sender: TObject);
    procedure Quit1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MapListClick(Sender: TObject);
    procedure ColorMapTrackBarChange(Sender: TObject);
    procedure FXPSListEnter(Sender: TObject);
    procedure PictureListClick(Sender: TObject);
    procedure PictureAdd(LumpName : string);
    procedure ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageMouseMove(X,Y: Integer;Image:TImage);
    procedure FlatImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LinesImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure VertImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure VertexesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LinedefsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FlatPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WallImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure WallPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpritePanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpriteImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MenuPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StatusBarPanelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PicturePanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure StatusImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PictureImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PalButton0Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SaveD(Pages:TImage;Lists:TListBox);
    procedure CenterizePic(IMG:TImage;PNL:TPanel);
    procedure ZomeInButtonClick(Sender: TObject);
    procedure ZomeOut(I:TImage;P:TPanel);
    procedure ZomeIn(I:TImage;P:TPanel);
    procedure ZomeOutButtonClick(Sender: TObject);
    procedure BestFit(I:TImage;P:TPanel);
    procedure BestFitButtonClick(Sender: TObject);
    procedure OrgSizeButtonClick(Sender: TObject);
    procedure OrgSize(I:TImage;P:TPanel);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Unit2,Unit3,Unit4;

{$R *.DFM}

procedure TWadForm.AllListClick(Sender: TObject);
begin
     if AllList.itemindex =-1 then exit;
     StatusBar1.Panels[0].Text:='Lump : '+ WadDic[AllList.itemindex].LumpName;
     StatusBar1.Panels[1].Text:='Offset : ' + inttostr(WadDic[AllList.itemindex].LumpOffset)+
        '   Length : ' +inttostr(WadDic[AllList.itemindex].LumpLen);
end;

procedure TWadForm.AllListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     AllListClick(WadForm);
     if key=13 then DumpClick(WadForm);
end;

procedure TWadForm.DumpClick(Sender: TObject);
begin
      if(pagecontrol1.ActivePage = All) and not(Alllist.ItemIndex=-1) then
        if WadDic[Alllist.ItemIndex].LumpLen>0 then DumpForm.DumpLump(Alllist.ItemIndex);
end;

procedure TWadForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
     if key=chr(27) then
       If MessageBox(wadform.Handle,'Exit Program?','Quit Confirmtion',MB_OKCANCEL)=mrOk then halt;
end;

procedure TWadForm.PictureAdd(LumpName : string);
var FIndex:longint;
begin
     FIndex:=LumpIndex(LumpName);
     if not(FIndex=-1) then Picturelist.Items.Add(WadDic[FIndex].LumpName);
end;

procedure TWadForm.FXSBListClick(Sender: TObject);
var WadDicIndex:longword;
    FXHScale : longword;
    FXWScale : Real;
    FXSBBuf  : FXSB;
    Counter:longint;
begin
    if FXSBList.ItemIndex=-1 then exit;
    WadDicIndex:=LumpIndex(FXSBList.Items[FXSBList.ItemIndex]);

    if WadDic[WadDicIndex].LumpLen =0 then exit;
    Seek(CurFile,WadDic[WadDicIndex].LumpOffset );
    blockread(CurFile,FXSBBuf,WadDic[WadDicIndex].LumpLen);

    LFXMean.Caption :='What Means? ' + inttostr(FXSBBuf.FXMean);
    LFXSample.Caption :='Sample Rate : ' + inttostr(FXSBBuf.FXSampleRate);
    LFXNoOfSample.Caption :='Sample Length : ' + inttostr(FXSBBuf.FXSampleLen );
    LZeroNo.Caption :='Zero Int : ' + inttostr(FXSBBuf.FXZero );

    FXimage.visible:=false;
    FXimage.Canvas.FillRect(rect(0,0,FXimage.Width,FXimage.Height));
    FXHScale:=256 DIV FXImage.Height;
    FXWScale:=(FXimage.Width/FXSBBuf.FXSampleLen);
    for Counter:=1 to FXSBBuf.FXSampleLen do
        FXimage.Canvas.Pixels[Round(FXWScale * Counter),min(FXSBBuf.FXBuf[Counter] DIV FXHScale,FXImage.Height-2)]:=0;
    FXimage.visible:=true;
end;

procedure TWadForm.FXPSListClick(Sender: TObject);
var WadDicIndex:longword;
    FXPSBuf  : FXPS;
begin
    if FXPSList.ItemIndex=-1 then exit;
    WadDicIndex:=LumpIndex(FXPSList.Items[FXPSList.ItemIndex]);

    if WadDic[WadDicIndex].LumpLen =0 then exit;
    Seek(CurFile,WadDic[WadDicIndex].LumpOffset );
    blockread(CurFile,FXPSBuf,WadDic[WadDicIndex].LumpLen);

    LFXMean.Caption :='';
    LFXSample.Caption :='';
    LFXNoOfSample.Caption :='Sample Length : ' + inttostr(FXPSBuf.FXSampleLen );
    LZeroNo.Caption :='Zero Int : ' + inttostr(FXPSBuf.FXZero );

    FXimage.Canvas.FillRect(rect(0,0,FXimage.Width,FXimage.Height));

end;

procedure TWadForm.SoundPlayButtonClick(Sender: TObject);
var WadDicIndex:longword;
    FXSBBuf: FXSB;
    retval:shortint;
    _hformat:TWaveFormatex;
    _hwaveout:HWAVEOUT;
    _wavehdr:WAVEHDR;
label OutJump;
begin
    if FXSBList.ItemIndex=-1 then exit;

    WadDicIndex:=LumpIndex(FXSBList.Items[FXSBList.ItemIndex]);

    if WadDic[WadDicIndex].LumpLen =0 then goto OutJump;
    SoundPlayButton.Enabled:=false;
    Seek(CurFile,WadDic[WadDicIndex].LumpOffset );
    blockread(CurFile,FXSBBuf,WadDic[WadDicIndex].LumpLen);
    _hformat.wFormatTag:=WAVE_FORMAT_PCM;
    _hformat.nChannels:=1;
    _hformat.nSamplesPerSec:=FXSBBuf.FXSampleRate;
    _hformat.nAvgBytesPerSec:=FXSBBuf.FXSampleRate;
    _hformat.nBlockAlign :=1;
    _hformat.wBitsPerSample :=8;
    _hformat.cbSize :=0;

     //Open waveformout device
     retval:=waveOutOpen(@_hwaveout,WAVE_MAPPER,@_hformat,Application.Handle,0,CALLBACK_WINDOW);
     case retval of
         MMSYSERR_ALLOCATED: ShowMessage('Specified resource is already allocated.');
         MMSYSERR_BADDEVICEID: ShowMessage('Specified device identifier is out of range.');
         MMSYSERR_NODRIVER: ShowMessage('No device driver is present.');
         MMSYSERR_NOMEM: ShowMessage('Unable to allocate or lock memory.');
         WAVERR_BADFORMAT: ShowMessage('Attempted to open with an unsupported waveform-audio format.');
         WAVERR_SYNC: ShowMessage('The device is synchronous but waveOutOpen was called without using the WAVE_ALLOWSYNC flag.');
     end;
     if retval<>MMSYSERR_NOERROR then goto OutJump;


     retval:=waveOutOpen(nil,WAVE_MAPPER,@_hformat,0,0,WAVE_FORMAT_QUERY);
     case retval of
         MMSYSERR_ALLOCATED: ShowMessage('Specified resource is already allocated.');
         MMSYSERR_BADDEVICEID: ShowMessage('Specified device identifier is out of range.');
         MMSYSERR_NODRIVER: ShowMessage('No device driver is present.');
         MMSYSERR_NOMEM: ShowMessage('Unable to allocate or lock memory.');
         WAVERR_BADFORMAT: ShowMessage('Attempted to open with an unsupported waveform-audio format.');
         WAVERR_SYNC: ShowMessage('The device is synchronous but waveOutOpen was called without using the WAVE_ALLOWSYNC flag.');
     end;
     if retval<>MMSYSERR_NOERROR then goto OutJump;

      _wavehdr.lpData:=@FXSBBuf.FXBuf[1];
      _wavehdr.dwBufferLength:=FXSBBuf.FXSampleLen;
      _wavehdr.dwFlags:=0;
      _wavehdr.dwLoops:=0;
      RetVal:=waveOutPrepareHeader(_hwaveout,@_wavehdr,sizeof(WAVEHDR));
       case RetVal of
            MMSYSERR_INVALHANDLE:ShowMessage('Specified device handle is invalid.');
            MMSYSERR_NODRIVER:ShowMessage('No device driver is present.');
            MMSYSERR_NOMEM:ShowMessage('Unable to allocate or lock memory.');
       end;
       if retval<>MMSYSERR_NOERROR then goto OutJump;

     retval:=waveOutWrite(_hwaveout,@_wavehdr,sizeof(WAVEHDR));
     case retval of
          MMSYSERR_INVALHANDLE:ShowMessage('Specified device handle is invalid.');
          MMSYSERR_NODRIVER:ShowMessage('No device driver is present.');
          MMSYSERR_NOMEM:ShowMessage('Unable to allocate or lock memory.');
          WAVERR_UNPREPARED:ShowMessage('The data block pointed to by the pwh parameter hasn''t been prepared.');
     end;
     while not((_wavehdr.dwFlags and WHDR_DONE) = WHDR_DONE) do
          application.ProcessMessages ;

OutJump:
     waveOutClose(_hwaveout);
     SoundPlayButton.Enabled:=true;
end;

procedure TWadForm.FXSBListEnter(Sender: TObject);
begin
     FXPSList.ItemIndex:=-1;
end;

procedure TWadForm.FlatListClick(Sender: TObject);
var WadDicIndex:longword;
    FlatBuf :FlatRec ;
    i,j:byte;
begin
    if FlatList.ItemIndex=-1 then exit;
    WadDicIndex:=LumpIndex(FlatList.Items[FlatList.ItemIndex]);

    if WadDic[WadDicIndex].LumpLen =0 then exit;
    Seek(CurFile,WadDic[WadDicIndex].LumpOffset );
    blockread(CurFile,FlatBuf,WadDic[WadDicIndex].LumpLen);
    flatimage.Visible:=false;
    FlatImage.Picture.Bitmap.Height:=64;
    FlatImage.Picture.Bitmap.Width :=64;
    CenterizePic(FlatImage,FlatPanel);
    for i:=0 to 63 do
        for j:=0 to 63 do
             FlatImage.Picture.Bitmap.Canvas.Pixels[i,j]:=CurrentPalBox[FlatBuf.fbuf[j,i]];
    if BestFitCheck.State =cbChecked then bestfit(FlatImage ,FlatPanel );
    flatimage.Visible:=true;
end;

procedure TWadForm.SaveD(Pages: TImage;Lists:TListBox);
begin
    if not(Lists.ItemIndex=-1) then
       begin
          SaveLump.FileName:=Lists.Items[Lists.ItemIndex]+'.BMP';
          SaveLump.Execute;
          if SaveLump.Files.Count =0 then exit;
          Pages.Picture.SaveToFile(SaveLump.FileName);
       end;
end;

procedure TWadForm.SaveButtonClick(Sender: TObject);
var SF:file;
    LumpCash:array of byte;
    LumpIndex:word;
begin
    if pagecontrol1.ActivePage = Flat then saved(FlatImage,Flatlist);
    if pagecontrol1.ActivePage = Wall then saved(WallImage,Walllist);
    if pagecontrol1.ActivePage = Sprite  then saved(SpriteImage,Spritelist);
    if pagecontrol1.ActivePage = MessageP  then saved(MenuImage,Menulist);
    if pagecontrol1.ActivePage = StatusBar  then saved(StatusImage,Statuslist);
    if pagecontrol1.ActivePage = Picture  then saved(PictureImage,Picturelist);

    if (pagecontrol1.ActivePage = All) and not (Alllist.ItemIndex=-1) then
       begin
          if WadDic[Alllist.ItemIndex].LumpLen=0 then exit;
          LumpIndex:=Alllist.ItemIndex;
          SaveLump.FileName:=Alllist.Items[Alllist.ItemIndex]+'.LMP';

          SaveLump.Execute;
          if SaveLump.Files.Count =0 then exit;
          Assignfile(SF,SaveLump.FileName);
          Rewrite(SF,1);
          Setlength(LumpCash,WadDic[LumpIndex].LumpLen);
          seek(CurFile,WadDic[LumpIndex].LumpOffset);
          blockread(CurFile,(@LumpCash[0])^,WadDic[LumpIndex].LumpLen);
          BlockWrite(SF,(@LumpCash[0])^,WadDic[LumpIndex].LumpLen);
          closefile(SF);
       end;
end;


procedure TWadForm.PalButton0Click(Sender: TObject);
begin
     SetPal(0);
end;

procedure TWadForm.PalButton1Click(Sender: TObject);
begin
     SetPal(1);
end;

procedure TWadForm.PalButton2Click(Sender: TObject);
begin
     SetPal(2);
end;

procedure TWadForm.PalButton3Click(Sender: TObject);
begin
     SetPal(3);
end;

procedure TWadForm.PalButton4Click(Sender: TObject);
begin
     SetPal(4);
end;

procedure TWadForm.PalButton5Click(Sender: TObject);
begin
     SetPal(5);
end;

procedure TWadForm.PalButton6Click(Sender: TObject);
begin
     SetPal(6);
end;

procedure TWadForm.PalButton7Click(Sender: TObject);
begin
     SetPal(7);
end;

procedure TWadForm.PalButton8Click(Sender: TObject);
begin
     SetPal(8);
end;

procedure TWadForm.PalButton9Click(Sender: TObject);
begin
     SetPal(9);
end;

procedure TWadForm.PalButton10Click(Sender: TObject);
begin
     SetPal(10);
end;

procedure TWadForm.PalButton11Click(Sender: TObject);
begin
     SetPal(11);
end;

procedure TWadForm.PalButton12Click(Sender: TObject);
begin
     SetPal(12);
end;

procedure TWadForm.PalButton13Click(Sender: TObject);
begin
     SetPal(13);
end;

//procedure Used for showing a picture from list
//**********************************************************************
procedure TWadForm.MenuListClick(Sender: TObject);
begin
    if MenuList.ItemIndex=-1 then exit;
    SetPicture(Menuimage,
               LumpIndex(MenuList.Items[MenuList.ItemIndex]),
               1);
    if BestFitCheck.State =cbChecked then bestfit(menuImage,menuPanel);
    CenterizePic(menuImage,menuPanel);
end;

procedure TWadForm.StatusListClick(Sender: TObject);
begin
    if StatusList.ItemIndex=-1 then exit;
    SetPicture(StatusImage,
               LumpIndex(StatusList.Items[StatusList.ItemIndex]),
               1);
    if BestFitCheck.State =cbChecked then bestfit(statusImage,statusBarPanel);
    CenterizePic(statusImage,statusBarPanel);
end;

procedure TWadForm.WallListClick(Sender: TObject);
begin
    if WallList.ItemIndex=-1 then exit;
    SetPicture(Wallimage,
               LumpIndex(WallList.Items[WallList.ItemIndex]),
               1);

    if BestFitCheck.State =cbChecked then bestfit(WallImage,WallPanel);
    CenterizePic(WallImage,WallPanel);
end;

procedure TWadForm.SpriteListClick(Sender: TObject);
begin
    if SpriteList.ItemIndex=-1 then exit;
    SetPicture(Spriteimage,
               LumpIndex(SpriteList.Items[SpriteList.ItemIndex]),
               1);
    if BestFitCheck.State =cbChecked then bestfit(spriteImage,spritePanel);
    CenterizePic(spriteImage,spritePanel);
end;

procedure TWadForm.PictureListClick(Sender: TObject);
begin
    if PictureList.ItemIndex=-1 then exit;
    SetPicture(PictureImage,
               LumpIndex(PictureList.Items[PictureList.ItemIndex]),
               1);
    if BestFitCheck.State =cbChecked then bestfit(PictureImage,PicturePanel);
    CenterizePic(PictureImage,PicturePanel);
end;
//**********************************************************************


procedure TWadForm.MUSListClick(Sender: TObject);
var WadDicIndex:word;
    MusHeader : MUSHD;
    InsPatch : array of word;
    Counter:longint;
begin
    if MUSList.ItemIndex=-1 then exit;
    WadDicIndex:=LumpIndex(MUSList.Items[MUSList.ItemIndex]);

    if WadDic[WadDicIndex].LumpLen =0 then exit;
    Seek(CurFile,WadDic[WadDicIndex].LumpOffset );
    blockread(CurFile,MusHeader,sizeof(MUSHD));

     MusMDL.Caption := 'Music Data Len : '+inttostr(MusHeader.DataLen );
     MusHDL.Caption :=  'Header Data Len : '+inttostr(MusHeader.HeaderLen );
     MusPriChan.Caption:= 'Pri. Channels : '+inttostr(MusHeader.PriChan );
     MusSecChan.Caption:= 'Sec. Channels : '+inttostr(MusHeader.SecChan );
     MusNoOIP.Caption:= 'No of Ins. Patches : '+inttostr(MusHeader.InstrumentPatch );
     MusZero.Caption:= 'Zero Val : ' + inttostr(MusHeader.Zero );

     SetLength(InsPatch,MusHeader.InstrumentPatch);
     BlockRead(CurFile,(@InsPatch[0])^,2*MusHeader.InstrumentPatch);
     MusInsPatchList.Clear;
     for Counter:=0 to MusHeader.InstrumentPatch-1 do
        MusInsPatchList.Items.Add (inttostr(inspatch[Counter]));

end;

procedure TWadForm.Quit1Click(Sender: TObject);
begin
     halt;
end;

procedure TWadForm.Open1Click(Sender: TObject);
var MyFileExt:string;
    CD:string;
begin
{     OpenDialog1.Execute;
     caption:=OpenDialog1.FileName;
     MyFileExt:=uppercase(ExtractFileExt(OpenDialog1.FileName));
     assignfile(CurFile,OpenDialog1.FileName);
}
     getdir(0,cd);
     cd:=cd +'\doom2.wad';
     assignfile(CurFile,cd);
     MyFileExt:=uppercase(ExtractFileExt(cd));
     reset(CurFile,1);


     if MyFileExt='.WAD'then
        WadOpen;
end;

procedure TWadForm.FormCreate(Sender: TObject);
begin
    Open1Click(wadform);
    impan.PanSW:=false;
end;

procedure TWadForm.MapListClick(Sender: TObject);
var WadDicIndex:longword;
    MapWadDicIndex:longword;
    counter: longword;
    Verts : array of Vertex;
    VertsNo : longword;
    Linedefs : array of Linedef;
    LinedefsNo : longword;
    BLMAPHD : BlockMapHeader;
    CurVertexIndex:longword;
    CurBlockMapIndex:longword;
    CurLineDefIndex:longword;
begin
    if MapList.ItemIndex=-1 then exit;
    MapWadDicIndex:=LumpIndex(MapList.Items[MapList.ItemIndex]);
    WadDicIndex:=MapLumpIndex(MapList.Items[MapList.ItemIndex],'THINGS');
    Seek(CurFile,WadDic[WadDicIndex].LumpOffset );

//BlockMap
    CurBlockMapIndex:=MapLumpIndex(MapList.Items[MapList.ItemIndex],'BLOCKMAP');
    Seek(CurFile,WadDic[CurBlockMapIndex].LumpOffset );
    blockread(CurFile,(@BLMAPHD)^,sizeof(BlockMapHeader));
    BGXCord.Caption :='BlockMap X Cord:'+inttostr(BLMAPHD.X);
    BGYCord.Caption :='BlockMap Y Cord:'+inttostr(BLMAPHD.Y);
    BlockInCol.Caption :='Block In X:'+inttostr(BLMAPHD.Cols);
    BlockInRow.Caption :='Block In Y:'+inttostr(BLMAPHD.Rows);

    LevelX.Caption:='Level X Pix:'+inttostr(BLMAPHD.Cols*128);
    LevelY.Caption:='Level Y Pix:'+inttostr(BLMAPHD.Rows*128);

    VertImage.Picture.Bitmap.Width:=BLMAPHD.Cols*16;
    VertImage.Picture.Bitmap.Height:=BLMAPHD.Rows*16;
    VertImage.Width:=BLMAPHD.Cols*16;
    VertImage.Height:=BLMAPHD.Rows*16;
    linesimage.Picture.Bitmap.Width:=BLMAPHD.Cols*16;
    linesimage.Picture.Bitmap.Height:=BLMAPHD.Rows*16;
    linesimage.Width:=BLMAPHD.Cols*16;
    linesimage.Height:=BLMAPHD.Rows*16;

// Vertexes
    CurVertexIndex:=MapLumpIndex(MapList.Items[MapList.ItemIndex],'VERTEXES');
    Seek(CurFile,WadDic[CurVertexIndex].LumpOffset );
    VertsNo :=WadDic[CurVertexIndex].LumpLen DIV 4;
    Vertexno.Caption :='Vetrex:'+inttostr(VertsNo);
    SetLength(verts,VertsNo);
    blockread(CurFile,(@Verts[0])^,WadDic[CurVertexIndex].LumpLen);
    VImgSize.Caption :='X:'+inttostr(BLMAPHD.Cols*16)+ '  Y:'+inttostr(BLMAPHD.Rows *16);

    VertImage.Visible:=false;
    VertImage.Top:=0;
    VertImage.left:=0;
    VertImage.Picture.Bitmap.Canvas.Brush.Color:=clBlack;
    VertImage.Picture.Bitmap.Canvas.fillRect ( rect(0,0,VertImage.Picture.Bitmap.Width-1,VertImage.Picture.Bitmap.Height-1));

    VertImage.Picture.Bitmap.Canvas.Pen.Color :=clGreen  ;
    for Counter:=1 to BLMAPHD.Cols do
      begin
        VertImage.Picture.Bitmap.Canvas.PenPos:=point(Counter*16,0);
        VertImage.Picture.Bitmap.Canvas.LineTo(Counter*16,VertImage.Picture.Bitmap.Height);
      end;
    for Counter:=1 to BLMAPHD.Rows do
      begin
        VertImage.Picture.Bitmap.Canvas.PenPos:=point(0,Counter*16);
        VertImage.Picture.Bitmap.Canvas.LineTo(VertImage.Picture.Bitmap.Width,Counter*16);
      end;

    for Counter:=0 to VertsNo-1 do
      begin
        VertImage.Picture.Bitmap.Canvas.Pixels[(Verts[counter].X-BLMAPHD.X)div 8,(Verts[counter].Y-BLMAPHD.Y) div 8]:=clWhite;

        //For more
        VertImage.Picture.Bitmap.Canvas.Pixels[((Verts[counter].X-BLMAPHD.X)div 8)+1,((Verts[counter].Y-BLMAPHD.Y) div 8)+1]:=clWhite;
        VertImage.Picture.Bitmap.Canvas.Pixels[((Verts[counter].X-BLMAPHD.X)div 8)-1,((Verts[counter].Y-BLMAPHD.Y) div 8)+1]:=clWhite;
        VertImage.Picture.Bitmap.Canvas.Pixels[((Verts[counter].X-BLMAPHD.X)div 8)+1,((Verts[counter].Y-BLMAPHD.Y) div 8)-1]:=clWhite;
        VertImage.Picture.Bitmap.Canvas.Pixels[((Verts[counter].X-BLMAPHD.X)div 8)-1,((Verts[counter].Y-BLMAPHD.Y) div 8)-1]:=clWhite;

      end;
    VertImage.Visible:=true;


// LineDefs
    CurLineDefIndex:=MapLumpIndex(MapList.Items[MapList.ItemIndex],'LINEDEFS');
    Seek(CurFile,WadDic[CurLineDefIndex].LumpOffset );
    LinedefsNo:=WadDic[CurLineDefIndex].LumpLen DIV 14;
    linesno.Caption :='Linedef:'+inttostr(LinedefsNo);
    SetLength(Linedefs,LinedefsNo);
    blockread(CurFile,(@Linedefs[0])^,WadDic[CurLineDefIndex].LumpLen);

    linesImage.Visible:=false;
    linesImage.Top:=0;
    linesImage.Left:=0;
    linesImage.Picture.Bitmap.Canvas.Brush.Color:=clBlack;
    linesImage.Picture.Bitmap.Canvas.fillRect ( rect(0,0,linesImage.Picture.Bitmap.Width-1,linesImage.Picture.Bitmap.Height-1));

    linesImage.Picture.Bitmap.Canvas.Pen.Color :=clGreen  ;
    for Counter:=1 to BLMAPHD.Cols do
      begin
        linesImage.Picture.Bitmap.Canvas.PenPos:=point(Counter*16,0);
        linesImage.Picture.Bitmap.Canvas.LineTo(Counter*16,linesImage.Picture.Bitmap.Height);
      end;
    for Counter:=1 to BLMAPHD.Rows do
      begin
        linesImage.Picture.Bitmap.Canvas.PenPos:=point(0,Counter*16);
        linesImage.Picture.Bitmap.Canvas.LineTo(linesImage.Picture.Bitmap.Width,Counter*16);
      end;

    linesImage.Picture.Bitmap.Canvas.pen.Color:=clWhite;
    for Counter:=0 to LinedefsNo-1 do
      begin
        linesImage.Picture.Bitmap.Canvas.PenPos:=point(
                   (Verts[Linedefs[counter].S].x-BLMAPHD.X) DIV 8,(Verts[Linedefs[counter].S].y-BLMAPHD.Y) DIV 8);

        linesImage.Picture.Bitmap.Canvas.LineTo(
                   (Verts[Linedefs[counter].E].x-BLMAPHD.X) DIV 8,(Verts[Linedefs[counter].E].y-BLMAPHD.Y) DIV 8);
      end;
    linesImage.Visible:=true;

end;

procedure TWadForm.ColorMapTrackBarChange(Sender: TObject);
var x,y,i,t:word;
begin
   SetPal(CurrentPal);
   t:=ColorMapTrackBar.Position;
   PalImage.Visible:=false;
   PalImage.Picture.Bitmap.Height:=16;
   PalImage.Picture.Bitmap.Width :=16;
   for y:=0 to 15 do
     for x:=0 to 15 do
       begin
            i:=x+y*16;
            CurrentPalBox[i]:=RGB(max(PLAYPAL.Pals[CurrentPal,i].Red-ColorMap[t,i],0),
                                  max(PLAYPAL.Pals[CurrentPal,i].Green-ColorMap[t,i],0),
                                  max(PLAYPAL.Pals[CurrentPal,i].Blue-ColorMap[t,i],0));
            PalImage.Canvas.Pixels[x,y]:=CurrentPalBox[i];
       end;
   PalImage.Visible:=true;
end;

procedure TWadForm.FXPSListEnter(Sender: TObject);
begin
      FXSBList.ItemIndex:=-1;
end;


//**********************************************************************
//Panning an Image (Used procedure)
//**********************************************************************
procedure TWadForm.ImageMouseMove(X, Y: Integer;Image:TImage);
begin
     if IMPan.PanSW then
        begin
          Image.left:=Image.left+x-IMPan.PanX;
          Image.top:=Image.top+y-IMPan.Pany;
        end;

end;

procedure TWadForm.ImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     IMPan.PanX:=x;IMPan.PanY:=y;
     IMPan.PanSW:=true;
end;

procedure TWadForm.ImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     IMPan.PanSW:=false;
end;

procedure TWadForm.FlatImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
     ImageMouseMove(x,y,flatimage);
end;

procedure TWadForm.LinesImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
     ImageMouseMove(x,y,linesimage);
end;

procedure TWadForm.VertImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
     ImageMouseMove(x,y,vertimage);
end;

procedure TWadForm.WallImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
     ImageMouseMove(x,y,Wallimage);
end;

procedure TWadForm.SpriteImageMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     ImageMouseMove(x,y,spriteimage);
end;

procedure TWadForm.MenuImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
     ImageMouseMove(x,y,Menuimage);
end;

procedure TWadForm.StatusImageMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     ImageMouseMove(x,y,Statusimage);
end;

procedure TWadForm.PictureImageMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     ImageMouseMove(x,y,Pictureimage);
end;

procedure TWadForm.VertexesMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     vertimage.top:=0;
     vertimage.Left:=0;
end;

procedure TWadForm.LinedefsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     linesimage.top:=0;
     linesimage.Left:=0;
end;

procedure TWadForm.FlatPanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    CenterizePic(FlatImage,FlatPanel);
end;

procedure TWadForm.WallPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    CenterizePic(WallImage,WallPanel);
end;

procedure TWadForm.SpritePanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    CenterizePic(spriteImage,spritePanel);
end;

procedure TWadForm.MenuPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    CenterizePic(menuImage,menuPanel);
end;

procedure TWadForm.StatusBarPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    CenterizePic(statusImage,statusBarPanel);
end;

procedure TWadForm.PicturePanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    CenterizePic(PictureImage,PicturePanel);
end;

procedure TWadForm.CenterizePic(IMG:TImage;PNL:TPanel);
begin

    Img.Top:=Round((Pnl.Height - Img.Height) / 2) ;
    Img.Left:=Round((Pnl.Width - Img.Width) / 2) ;
end;

//**********************************************************************
//**********************************************************************


procedure TWadForm.PageControl1Change(Sender: TObject);
begin
    StatusBar1.Panels[0].Text:='';
    StatusBar1.Panels[1].Text:='';
    StatusBar1.Panels[2].Text:='';
    case  PageControl1.ActivePageIndex of
        0: begin
           StatusBar1.Panels[2].Text:='Count: '+inttostr(AllList.Items.Count);
           AllListClick(nil);
           end;
        1: begin
           StatusBar1.Panels[2].Text:='Count: '+inttostr(MapList.Items.Count);
           end;
        2: begin
           StatusBar1.Panels[1].Text:='All Flats are 64 * 64 Pix';
           StatusBar1.Panels[2].Text:='Count: '+inttostr(FlatList.Items.Count);
           end;
        3: begin
           StatusBar1.Panels[2].Text:='Count: '+inttostr(WallList.Items.Count);
           WallListClick(nil);
           end;
        4: begin
           StatusBar1.Panels[2].Text:='Count: '+inttostr(SpriteList.Items.Count);
           SpriteListClick(nil);
           end;
        5: begin
           StatusBar1.Panels[2].Text:='Count: '+inttostr(MenuList.Items.Count);
           MenuListClick(nil);
           end;
        6: begin
           StatusBar1.Panels[2].Text:='Count: '+inttostr(StatusList.Items.Count);
           StatusListClick(nil);
           end;
        7: begin
           StatusBar1.Panels[2].Text:='Count: '+inttostr(PictureList.Items.Count);
           PictureListClick(nil);
           end;
        8: begin
           end;
        9: begin
           StatusBar1.Panels[2].Text:='Count: ('+inttostr(FXSBList.Items.Count)+') ('+inttostr(FXPSList.Items.Count)+')';
           if FXSBList.Items.Count>0 then SoundPlayButton.Enabled:=true;
           end;
        10: begin
            StatusBar1.Panels[2].Text:='Count: '+inttostr(MusList.Items.Count);
            end;


    end;

    case  PageControl1.ActivePageIndex of
        2..7:
               begin
                ZomeInButton.Visible :=true;
                ZomeOutButton.Visible :=true;
                OrgSizeButton.Visible :=true;
                BestFitButton.Visible :=true;
                BestFitCheck.Visible :=true;
               end;
        else
               begin
                ZomeInButton.Visible :=false;
                ZomeOutButton.Visible :=false;
                OrgSizeButton.Visible :=false;
                BestFitButton.Visible :=false;
                BestFitCheck.Visible :=false;
               end;
    end;
end;

procedure TWadForm.ZomeInButtonClick(Sender: TObject);
begin
    if pagecontrol1.ActivePage = Flat then Zomein(FlatImage,FlatPanel);
    if pagecontrol1.ActivePage = Wall then Zomein(WallImage,WallPanel);
    if pagecontrol1.ActivePage = Sprite  then Zomein(SpriteImage,SpritePanel);
    if pagecontrol1.ActivePage = MessageP  then Zomein(MenuImage,MenuPanel);
    if pagecontrol1.ActivePage = StatusBar  then Zomein(StatusImage,StatusbarPanel);
    if pagecontrol1.ActivePage = Picture  then Zomein(PictureImage,PicturePanel);
end;

procedure TWadForm.ZomeOutButtonClick(Sender: TObject);
begin
    if pagecontrol1.ActivePage = Flat then Zomeout(FlatImage,FlatPanel);
    if pagecontrol1.ActivePage = Wall then Zomeout(WallImage,WallPanel);
    if pagecontrol1.ActivePage = Sprite  then Zomeout(SpriteImage,SpritePanel);
    if pagecontrol1.ActivePage = MessageP  then Zomeout(MenuImage,MenuPanel);
    if pagecontrol1.ActivePage = StatusBar  then Zomeout(StatusImage,StatusbarPanel);
    if pagecontrol1.ActivePage = Picture  then Zomeout(PictureImage,PicturePanel);
end;

procedure TWadForm.BestFitButtonClick(Sender: TObject);
begin
    if pagecontrol1.ActivePage = Flat then BestFit(FlatImage,FlatPanel);
    if pagecontrol1.ActivePage = Wall then BestFit(WallImage,WallPanel);
    if pagecontrol1.ActivePage = Sprite  then BestFit(SpriteImage,SpritePanel);
    if pagecontrol1.ActivePage = MessageP  then BestFit(MenuImage,MenuPanel);
    if pagecontrol1.ActivePage = StatusBar  then BestFit(StatusImage,StatusbarPanel);
    if pagecontrol1.ActivePage = Picture  then BestFit(PictureImage,PicturePanel);
end;

procedure TWadForm.OrgSizeButtonClick(Sender: TObject);
begin
    if pagecontrol1.ActivePage = Flat then OrgSize(FlatImage,FlatPanel);
    if pagecontrol1.ActivePage = Wall then OrgSize(WallImage,WallPanel);
    if pagecontrol1.ActivePage = Sprite  then OrgSize(SpriteImage,SpritePanel);
    if pagecontrol1.ActivePage = MessageP  then OrgSize(MenuImage,MenuPanel);
    if pagecontrol1.ActivePage = StatusBar  then OrgSize(StatusImage,StatusbarPanel);
    if pagecontrol1.ActivePage = Picture  then OrgSize(PictureImage,PicturePanel);
end;

procedure TWadForm.ZomeIn(I:TImage;P:TPanel);
begin
    if (I.Width < P.Width-15) and (I.Height < P.Height-15) then
        begin
                I.Width:=Round(I.Width*1.1);
                I.Height:=Round(I.Height*1.1);
                CenterizePic(I,P);
        end;
end;

procedure TWadForm.ZomeOut(I:TImage;P:TPanel);
begin
    if (I.Width > 10) and (I.Height > 10) then
        begin
                I.Width:=Round(I.Width*0.9);
                I.Height:=Round(I.Height*0.9);
                CenterizePic(I,P);
        end;
end;

procedure TWadForm.BestFit(I:TImage;P:TPanel);
begin
    if I.Width =0 then I.Width :=1;
    if I.Height =0 then I.Height:=1;
    if P.Width / I.Width>P.Height / I.Height then
    begin
        I.Width:=Round(I.Width*((P.Height-10) / I.Height));
        I.Height:=Round(I.Height *((P.Height-10) / I.Height));
    end
    else
    begin
        I.Height:=Round(I.Height *((P.Width -10)/ I.Width));
        I.Width:=Round(I.Width*((P.Width -10)/ I.Width));
    end;
    CenterizePic(I,P);
end;

procedure TWadForm.OrgSize(I:TImage;P:TPanel);
begin
    I.Height := I.Picture.Height;
    I.Width  := I.Picture.Width ;
    CenterizePic(I,P);
end;


procedure TWadForm.About1Click(Sender: TObject);
begin
        AboutBox.ShowModal;
end;

end.
