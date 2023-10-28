unit DistortionFrm;

interface

uses 
  Windows, Messages, SysUtils, Classes, Forms, DAVDCommon, DVSTModule,
  cDIBKnob, cDIBControl, cDIBImage, cDIBImageList, Controls, ExtCtrls,
  cDIBPanel;

type
  TEditorDistortion = class(TForm)
    DIBContainer1: TDIBContainer;
    Skin: TDIBImageList;
    Knob: TDIBImageList;
    DIBImage1: TDIBImage;
    DIBKnob1: TDIBKnob;
    DIBKnob2: TDIBKnob;
    procedure DIBKnob1Change(Sender: TObject);
    procedure DIBKnob2Change(Sender: TObject);
  end;

implementation

uses DistortionDM;

{$R *.DFM}

procedure TEditorDistortion.DIBKnob1Change(Sender: TObject);
begin
DIBKnob1.IndexMain.DIBIndex := DIBKnob1.Position;
 TDistortionDataModule(Owner).Parameter[1] := DIBKnob1.Position;
end;

procedure TEditorDistortion.DIBKnob2Change(Sender: TObject);
begin
DIBKnob2.IndexMain.DIBIndex := DIBKnob2.Position;
TDistortionDataModule(Owner).Parameter[0] := DIBKnob2.Position;
end;

end.