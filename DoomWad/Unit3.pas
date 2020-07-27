unit Unit3;

interface

uses unit1,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,ComCtrls, ExtCtrls,MMSystem, Grids,math, Menus;

  procedure WadOpen;
  Function LumpIndex(LumpName : string):longint;
  Function MapLumpIndex(MapName,LumpName : string):longword;
  procedure SetPicture(var OutPic:TImage;WadDicIndex:word;Mult : byte);
  procedure SetPal(Index:byte);
  procedure LoadPals;
  procedure LoadColorMap;

type
  //lines, using in a map to join two vertexes
  Linedef = record
    S,E :smallint;
    Flag :smallint;
    Types :smallint;
    tag :smallint;
    RightSD :smallint;
    LeftSD :smallint;
  end;

  //a simple vertex
  Vertex = record
    X,Y:smallint;
  end;

  //used for getting current station of a map (i.e. Map size, etc)
  BlockMapHeader = record
    X,Y : smallint;
    Cols,Rows : smallint;
  end;

  //any MUS should have this header
  MUSHD = record
    MusIDA:array[1..4] of char;
    DataLen : word;
    HeaderLen : word;
    PriChan : word;
    SecChan : word;
    InstrumentPatch : word;
    Zero : word;
  end;

  // each palette of doom >> upgrades for RGB from ms_dog in ms_windows
  DoomPals = record
     Red : byte;
     Green : byte;
     Blue : byte;
  end;

  //I really don't know why I do such thing for palettes!? can you help me to know that ?
  GraphPal = record
      Pals:array[0..13,0..255] of DoomPals;
  end;

  //head of each picture format in doom wad (Damn you John by using this format)
  GraphRec = record
    Width  : word;
    Height : word;
    LeftOff: smallint;
    TopOff : smallint;
  end;

  //Flats should not have any hole or tranparency so :
  FlatRec = record
    FBuf :Array[0..63,0..63] of byte;
  end;

  //My old PC Speacker dose not work todays, anyway:
  FXPS = record
    FXZero:word;
    FXSampleLen:word;
    FXBuf :Array[1..256] of byte;
  end;

  //Why is it very bad quality of sound for todays powerful soundblasters
  FXSB = record
    FXMean:word;
    FXSampleRate:word;
    FXSampleLen:word;
    FXZero:word;
    FXBuf :Array[1..65536] of byte;
  end;

  //Each lump information is like this
  Dic = record
      LumpOffset : longword;
      LumpLen : longword;
      LumpName : array[1..8] of char;
  end;

  ImagePan = record
    PanSW:boolean;
    PanX:word;
    PanY:word;
  end;

var
  CurFile:File; //'ll be Wad file
  WadForm: TWadForm;//I don't know
  LumpsNo : longint;//Count of lumps
  DicOffset: longint;//Offset of wad dic
  WadDic :Array of Dic;//lumps info array
  WadIDA:array[1..4] of char;//Wad header ID
  PLAYPAL : GraphPal;//Palettes
  ColorMap:array[0..33,0..255] of byte;//Mapping colors in palettes for brightnesses
  CurrentPal : byte;//number of current using palette
  CurrentPalBox : array[0..255] of longword;//nothing to say
  IMPan : ImagePan;

implementation




{*************************************************************************
**********  Loading a WAD file and all of it's content to program ********
**************************************************************************}
procedure WadOpen;
var    F_Start:array[1..10] of char;
       F_End:array[1..10] of char;
       S_Start:array[1..10] of char;
       S_End:array[1..10] of char;
       P_Start:array[1..10] of char;
       P_End:array[1..10] of char;
       //They should be better to make a fucktion call
       Counter:longint;
begin
//Wad Open Resets
     //Setting Markers for search
     StrPCopy(@F_Start,'F_START');
     StrPCopy(@F_End,'F_END');
     StrPCopy(@S_Start,'S_START');
     StrPCopy(@S_End,'S_END');
     StrPCopy(@P_Start,'P_START');
     StrPCopy(@P_End,'P_END');

 with WadForm do
     begin

     //Clearing all lists for new borning wad
     AllList.Clear;
     FlatList.Clear;
     FXSBList.Clear;
     FXPSList.Clear;
     MusList.Clear;
         MusInsPatchList.Clear;
     MenuList.Clear;
     MapList.Clear;
     StatusList.Clear;
     SpriteList.Clear;
     WallList.Clear;
     PictureList.Clear;

     //Clearing all pictures for new horning wad
     FlatImage.Picture.Bitmap:=nil;
     WallImage.Picture.Bitmap:=nil;
     SpriteImage.Picture.Bitmap:=nil;
     MenuImage.Picture.Bitmap:=nil;
     StatusImage.Picture.Bitmap:=nil;
     PalImage.Picture.Bitmap:=nil;
     PictureImage.Picture.Bitmap:=nil;
     FXImage.Picture.Bitmap:=nil;
            VertImage.Picture.Bitmap:=nil;
            LinesImage.Picture.Bitmap:=nil;
     ColorMapTrackBar.Enabled :=false;

     //Reading ID
     BlockRead(CurFile,WadIDA,4);
     if not ((string(WadIDA)='IWAD') or (string(WadIDA)='PWAD')) then
          begin
               //Not a wad file
              closefile(CurFile);
              Exit;
          end;

     //Reading Dictionary Information
     BlockRead(CurFile,LumpsNo,4);
     BlockRead(CurFile,DicOffset,4);

     setlength(WadDic,sizeof(DIC)*LumpsNo);

     //Reading Wad Dictionary
     Seek(CurFile,DicOffset);
     blockread(CurFile,(@WadDic[0])^,sizeof(DIC)*LumpsNo);

     //Adding Dic names to 'All list'
     AllList.visible:=false;
     for Counter := 0 to LumpsNo-1 do
       AllList.Items.Add( WadDic[Counter].LumpName );
     AllList.visible:=true;

     Counter:=0;
     //Note: I just try hard to optimize this filter loop for best performence. Any idea?
     while Counter<LumpsNo do
       begin
              case WadDic[Counter].LumpName[1] of
               'S':  //Filter 'S' For 1st byte
                  if WadDic[Counter].LumpName[2]='T' then // Status bar
                      StatusList.Items.Add( WadDic[Counter].LumpName );

               'M':  //Filter 'M' For 1st byte
                     //Map ( Doom 2 and up)
                  if (WadDic[Counter].LumpName[2]='A') AND (WadDic[Counter].LumpName[3]='P') then
                      MapList.Items.Add( WadDic[Counter].LumpName );

               'E':  //Filter 'E' For 1st byte
                     //Map ( Doom 1 and Down)
                  if (WadDic[Counter].LumpName[3]='M') then
                      MapList.Items.Add( WadDic[Counter].LumpName )
                  else if (WadDic[Counter].LumpName[2]='N') and (WadDic[Counter].LumpName[3]='D') and (WadDic[Counter].LumpName[5]=chr(0)) then
                      PictureAdd(WadDic[Counter].LumpName);

               'D':  //Filter 'D' For 1st byte
                 begin
                      case WadDic[Counter].LumpName[2] of
                        'P': //FX for PC Speacker
                              FXPSList.Items.Add( WadDic[Counter].LumpName );
                        'S': //FX for SoundCard
                              FXSBList.Items.Add( WadDic[Counter].LumpName );
                       end;
                 end;

               'A':  //Filter 'A' For 1st byte
                      case WadDic[Counter].LumpName[7] of
                        '1','2','3','4','5','6','7','8','9': // Small Numbers for ammo count
                              PictureAdd(WadDic[Counter].LumpName);
                       end;

               'B':  //Filter 'B' For 1st byte
                      case WadDic[Counter].LumpName[5] of
                        '_': // Border
                              PictureAdd(WadDic[Counter].LumpName);
                      end;

               'C':  //Filter 'C' For 1st byte
                      case WadDic[Counter].LumpName[2] of
                        'W'://Should be Level name
                              PictureAdd(WadDic[Counter].LumpName);
                      end;

               'W':  //Filter 'W' For 1st byte
                      case WadDic[Counter].LumpName[2] of
                        'I':  // Should be some text
                              PictureAdd(WadDic[Counter].LumpName);
                      end;
              end;

              //Filter '_' For 2nd byte
              if WadDic[Counter].LumpName[2]='_' then
                case WadDic[Counter].LumpName[1] of
                'M': // Message
                   MenuList.Items.Add( WadDic[Counter].LumpName );
                'D': //MUS
                   MUSList.Items.Add( WadDic[Counter].LumpName );
                end;


              If StrLComp(@WadDic[Counter].LumpName,@F_Start,8)=0 then
              //Begin of Flat
                 begin
                     Counter:=Counter+1;
                     while StrLComp(@WadDic[Counter].LumpName,@F_End,8)<>0 do
                           begin
                              if not(WadDic[Counter].LumpLen =0) then
                                FlatList.Items.Add( WadDic[Counter].LumpName);
                                Counter:=Counter+1;
                           end;
                 end;

              If StrLComp(@WadDic[Counter].LumpName,@S_Start,8)=0 then
              //Begin of Sprite
                 begin
                     Counter:=Counter+1;
                     while StrLComp(@WadDic[Counter].LumpName,@S_End,8)<>0 do
                           begin
                              if not(WadDic[Counter].LumpLen =0) then
                                SpriteList.Items.Add( WadDic[Counter].LumpName);
                                Counter:=Counter+1;
                           end;
                 end;

              If StrLComp(@WadDic[Counter].LumpName,@P_Start,8)=0 then
              //Begin of Wall Patch
                 begin
                     Counter:=Counter+1;
                     while StrLComp(@WadDic[Counter].LumpName,@P_End,8)<>0 do
                           begin
                              if not(WadDic[Counter].LumpLen =0) then
                                WallList.Items.Add( WadDic[Counter].LumpName);
                                Counter:=Counter+1;
                           end;
                 end;

              Counter:=Counter+1;
       end;

     // Some other (Maybe) Pictures
     PictureAdd('TITLEPIC');
     PictureAdd('CREDIT');
     PictureAdd('VICTORY2');
     PictureAdd('PFUB1');
     PictureAdd('PFUB2');
     PictureAdd('HELP');
     PictureAdd('HELP1');
     PictureAdd('HELP2');
     PictureAdd('BOSSBACK');



     //Nothing to say for this
     LoadPals;
     LoadColorMap;
     SetPal(0);//Setting palette to normal

     //Activing usefull buttons
     Dump.Enabled:=true;
     SaveButton.Enabled:=true;
     SaveAllButton.Enabled:=true;
     end;
end;





{*************************************************************************
*******  Get a name of Lump and return it's index in wad dic array *******
**************************************************************************}
Function LumpIndex(LumpName : string):longint;
var FIndex:word;
    SD:array[1..10] of char;
begin
     FIndex:=0;
     StrPCopy(@SD,LumpName);
     while not(StrLComp(@WadDic[FIndex].LumpName,@SD,8)=0) AND (FIndex<LumpsNo) do
        FIndex:=FIndex+1;
     if FIndex=LumpsNo then
       LumpIndex:=-1
     else
       LumpIndex:=FIndex;
end;





{*************************************************************************
*******  Get a map name with one of it's sub lump and return index *******
**************************************************************************}
Function MapLumpIndex(MapName,LumpName : string):longword;
var FIndex,i:word;
    SD:array[1..10] of char;
    SDM:array[1..10] of char;
begin
     FIndex:=0;
     StrPCopy(@SDM,MapName);
     StrPCopy(@SD,LumpName);
     while not(StrLComp(@WadDic[FIndex].LumpName,@SDM,8)=0) AND (FIndex<LumpsNo) do
        FIndex:=FIndex+1;
     For i:=1 to 10 do
        if (StrLComp(@WadDic[FIndex+i].LumpName,@SD,8)=0) then
          begin
           FIndex:=FIndex+i;
           break;
          end;
     MapLumpIndex:=FIndex;
end;




{*************************************************************************
*****  Get a lumpIndex, TImage , And InfoLabels to Decomp a Pic Lump *****
**************************************************************************}
procedure SetPicture(var OutPic:TImage;WadDicIndex:word;Mult : byte);
var
    PicBuf :GraphRec ;
    ColPoint : array of longword;
    GraphBuf : array of byte;
    i,j:word;
    StartGOff,LastOff:word;
begin
    if WadDic[WadDicIndex].LumpLen =0 then exit;
    Seek(CurFile,WadDic[WadDicIndex].LumpOffset );
    blockread(CurFile,PicBuf,8);

    OutPic.Visible :=false;
    OutPic.Picture.Bitmap:=nil;
    OutPic.Picture.Bitmap.Width :=PicBuf.Width+1;
    OutPic.Width :=PicBuf.Width*Mult;
    WadForm.StatusBar1.Panels[1].Text :=
    '[Width : ' + inttostr(PicBuf.Width )+
    '] [Height : ' + inttostr(PicBuf.Height )+
    '] [Left Offset : ' + inttostr(PicBuf.LeftOff  )+
    '] [Top Offset : ' + inttostr(PicBuf.TopOff  )+']';

    OutPic.Picture.Bitmap.Height:=PicBuf.Height+1;
    OutPic.Height:=PicBuf.Height*Mult;


    SetLength(ColPoint,PicBuf.Width);
    blockread(CurFile,(@ColPoint[0])^,PicBuf.Width*4);

    StartGOff:=(PicBuf.Width*4)+8;
    SetLength(GraphBuf,WadDic[WadDicIndex].LumpLen-StartGOff);
    blockread(CurFile,(@GraphBuf[0])^,WadDic[WadDicIndex].LumpLen-StartGOff);

    OutPic.Top:=0;
    OutPic.Left:=0;
    for j:=0 to PicBuf.Width-1 do
      begin
       if not(GraphBuf[ColPoint[j]-StartGOff]=255) then
         begin
           for i:=0 to GraphBuf[ColPoint[j]-StartGOff+1]-1 do
              OutPic.Canvas.Pixels[j,GraphBuf[ColPoint[j]-StartGOff]+i]:=CurrentPalBox[GraphBuf[ColPoint[j]-StartGOff+i+3]];
           LastOff:=GraphBuf[ColPoint[j]-StartGOff+1]+4;
           while not(GraphBuf[ColPoint[j]-StartGOff+LastOff]=255) do
             begin
                 for i:=0 to GraphBuf[ColPoint[j]-StartGOff+LastOff+1]-1 do
                    OutPic.Canvas.Pixels[j,GraphBuf[ColPoint[j]-StartGOff+LastOff]+i]:=CurrentPalBox[GraphBuf[ColPoint[j]-StartGOff+LastOff+i+3]];
                 LastOff:=LastOff+GraphBuf[ColPoint[j]-StartGOff+LastOff+1]+4;
             end;
          end;
      end;
    OutPic.Visible :=true;
end;




{*************************************************************************
*****  Get a Pal Index And Make it Current pal by Upgrade it to RGB ******
**************************************************************************}
procedure SetPal(Index:byte);
var x,y:word;
    i:word;
begin
   with WadForm do
   begin
   PalImage.Visible:=false;
   PalImage.Picture.Bitmap.Height:=16;
   PalImage.Picture.Bitmap.Width :=16;
   for y:=0 to 15 do
     for x:=0 to 15 do
       begin
            i:=x+y*16;
            CurrentPalBox[i]:=RGB(PLAYPAL.Pals[Index,i].Red,PLAYPAL.Pals[Index,i].Green ,PLAYPAL.Pals[Index,i].Blue);
            PalImage.Canvas.Pixels[x,y]:=CurrentPalBox[i];
       end;
   PalImage.Visible:=true;
   CurrentPal:=Index;
   end;

end;




{*************************************************************************
***********************  Load All palettes into palbuf *******************
**************************************************************************}
procedure LoadPals;
var WadDicIndex:word;
begin
    WadDicIndex:=LumpIndex('PLAYPAL');
    if WadDic[WadDicIndex].LumpLen =0 then exit;
    Seek(CurFile,WadDic[WadDicIndex].LumpOffset );
    blockread(CurFile,PLAYPAl,WadDic[WadDicIndex].LumpLen);
    with WadForm do
    begin
    PalButton0.Enabled:=true;
    PalButton1.Enabled:=true;
    PalButton2.Enabled:=true;
    PalButton3.Enabled:=true;
    PalButton4.Enabled:=true;
    PalButton5.Enabled:=true;
    PalButton6.Enabled:=true;
    PalButton7.Enabled:=true;
    PalButton8.Enabled:=true;
    PalButton9.Enabled:=true;
    PalButton10.Enabled:=true;
    PalButton11.Enabled:=true;
    PalButton12.Enabled:=true;
    PalButton13.Enabled:=true;
    end;
end;




{*************************************************************************
***********************  Load All ColorMap into it's buf *****************
**************************************************************************}
procedure LoadColorMap;
var WadDicIndex:word;
begin
    WadDicIndex:=LumpIndex('COLORMAP');
    if WadDic[WadDicIndex].LumpLen =0 then exit;
    Seek(CurFile,WadDic[WadDicIndex].LumpOffset );
    blockread(CurFile,(@ColorMap[0,0])^,sizeof(ColorMap));
    WadForm.ColorMapTrackBar.Enabled :=true;
end;


{*************************************************************************
***********************  Convert a byte to 8 bit structure ***************
**************************************************************************}

type BitShowR = record
     Bit:array[0..7] of boolean;
end;
function TrueFalse(i:byte):boolean;
begin
        if i=0 then TrueFalse:=false else TrueFalse := true;
end;

function BitShow(c:byte):BitShowR;
begin
    BitShow.Bit[0]:=TrueFalse(c and 1);
    BitShow.Bit[1]:=TrueFalse(c and 2);
    BitShow.Bit[2]:=TrueFalse(c and 4);
    BitShow.Bit[3]:=TrueFalse(c and 8);
    BitShow.Bit[4]:=TrueFalse(c and 16);
    BitShow.Bit[5]:=TrueFalse(c and 32);
    BitShow.Bit[6]:=TrueFalse(c and 64);
    BitShow.Bit[7]:=TrueFalse(c and 128);

end;

{*************************************************************************
**********************  Convert a MUS format to MID format ***************
**************************************************************************}
 //Preaparing mid header
 const MUSMagic = 'MUS'+chr(32);
 const MIDMagic = 'MThd'+chr(0)+chr(0)+chr(0)+chr(6)+chr(0)+chr(1);

end.
