{$J-,H+,T-P+,X+,B-,V-,O+,A+,W-,U-,R-,I-,Q-,D-,L-,Y-,C-}
library arvindistortion;

uses
  Forms,
  DVSTEffect,
  DVSTModule,
  DistortionDM in 'src\DistortionDM.pas' {DistortionDataModule: TVSTModule},
  DistortionFrm in 'src\DistortionFrm.pas' {EditorDistortion};

function main(audioMaster: TAudioMasterCallbackFunc): PVSTEffect; cdecl; export;
var
  DistortionDataModule: TDistortionDataModule;
begin
  try
    DistortionDataModule := TDistortionDataModule.Create(Application);
    DistortionDataModule.Effect^.user := DistortionDataModule;
    DistortionDataModule.AudioMaster := audioMaster;
    Result := DistortionDataModule.Effect;
  except
    Result := nil;
  end;
end;

exports Main name 'main';
exports Main name 'VSTPluginMain';

begin
end.