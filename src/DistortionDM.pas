unit DistortionDM;

interface

uses 
  Windows, Messages, SysUtils, Classes, Forms, 
  DAVDCommon, DVSTModule;

type
  TDistortionDataModule = class(TVSTModule)
    procedure VSTModuleEditOpen(Sender: TObject; var GUI: TForm; ParentWindow: Cardinal);
    procedure VSTModuleCreate(Sender: TObject);
    procedure VSTModuleProcess(const Inputs,
      Outputs: TAVDArrayOfSingleDynArray; const SampleFrames: Integer);
    procedure DistortionDataModuleParameterProperties0ParameterChange(
      Sender: TObject; const Index: Integer; var Value: Single);
    procedure DistortionDataModuleParameterProperties1ParameterChange(
      Sender: TObject; const Index: Integer; var Value: Single);
  private
    fDistortionAmount: Single;
  fGainAmount: Single;
  fMaxOutput: Single;
    // Variabel untuk filter notch
  fNotchFrequency: Single;
  fNotchQ: Single;
// Anda perlu menambahkan unit yang sesuai untuk filter notch


  public
  end;

implementation

{$R *.DFM}

uses
  DistortionFrm;
// Fungsi ini akan dipanggil ketika antarmuka pengguna (GUI) untuk efek distorsi dibuka.
procedure TDistortionDataModule.VSTModuleEditOpen(Sender: TObject; var GUI: TForm; ParentWindow: Cardinal);
begin
  GUI := TEditorDistortion.Create(Self);
end;

procedure TDistortionDataModule.VSTModuleCreate(Sender: TObject);
begin
 Parameter[0] := 0.5;
  fDistortionAmount := Parameter[0];
  Parameter[1] := 1.0;
  fGainAmount := Parameter[1];
  fMaxOutput := 0.9; // Set the maximum output level before applying the limiter
   // Inisialisasi parameter filter notch
  fNotchFrequency := 1000; // Frekuensi notch (sesuaikan)
  fNotchQ := 5; // Factor Q notch (sesuaikan)
   // Inisialisasi objek filter notch
end;

procedure TDistortionDataModule.VSTModuleProcess(const Inputs,
  Outputs: TAVDArrayOfSingleDynArray; const SampleFrames: Integer);
var
  j: Integer;
  DistortedSample, GainSample: Single;
begin
  for j := 0 to SampleFrames - 1 do
  begin
    DistortedSample := Inputs[0, j] * fDistortionAmount;
    Outputs[0, j] := DistortedSample;

    DistortedSample := Inputs[1, j] * fDistortionAmount;
    Outputs[1, j] := DistortedSample;

    GainSample := Outputs[0, j] * fGainAmount;
    Outputs[0, j] := GainSample;

    GainSample := Outputs[1, j] * fGainAmount;
    Outputs[1, j] := GainSample;

    if Outputs[0, j] > fMaxOutput then
      Outputs[0, j] := fMaxOutput
    else if Outputs[0, j] < -fMaxOutput then
      Outputs[0, j] := -fMaxOutput;

    if Outputs[1, j] > fMaxOutput then
      Outputs[1, j] := fMaxOutput
    else if Outputs[1, j] < -fMaxOutput then
      Outputs[1, j] := -fMaxOutput;
 // Terapkan filter notch pada output




    
    // Terapkan limiter volume pada setiap saluran
    if Outputs[0, j] > fMaxOutput then
      Outputs[0, j] := fMaxOutput
    else if Outputs[0, j] < -fMaxOutput then
      Outputs[0, j] := -fMaxOutput;

    if Outputs[1, j] > fMaxOutput then
      Outputs[1, j] := fMaxOutput
    else if Outputs[1, j] < -fMaxOutput then
      Outputs[1, j] := -fMaxOutput;
  end;
end;// Fungsi ini akan dipanggil saat nilai knob distorsi berubah. Fungsi ini mengupdate variabel fDistortionAmount sesuai nilai yang baru.


procedure TDistortionDataModule.DistortionDataModuleParameterProperties0ParameterChange(
  Sender: TObject; const Index: Integer; var Value: Single);
begin
fDistortionAmount := Value;
end;

procedure TDistortionDataModule.DistortionDataModuleParameterProperties1ParameterChange(
  Sender: TObject; const Index: Integer; var Value: Single);
begin
 fGainAmount := Value;
end;

end.