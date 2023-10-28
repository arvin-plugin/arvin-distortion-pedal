object DistortionDataModule: TDistortionDataModule
  OldCreateOrder = False
  OnCreate = VSTModuleCreate
  Flags = [effFlagsHasEditor, effFlagsCanMono, effFlagsCanReplacing]
  Version = '0.0'
  EffectName = 'Arvin Distortion'
  ProductName = 'Arvin Plugin'
  VendorName = 'Arvin Studio'
  PlugCategory = vpcEffect
  CanDos = []
  SampleRate = 44100.000000000000000000
  CurrentProgram = 0
  CurrentProgramName = 'Init'
  UniqueID = 'EnJk'
  ShellPlugins = <>
  Programs = <
    item
      DisplayName = 'Init'
      VSTModule = Owner
    end>
  ParameterProperties = <
    item
      Max = 1.000000000000000000
      Curve = ctLinear
      DisplayName = 'Level'
      CurveFactor = 1.000000000000000000
      SmoothingFactor = 1.000000000000000000
      VSTModule = Owner
      OnParameterChange = DistortionDataModuleParameterProperties0ParameterChange
    end
    item
      Max = 1.000000000000000000
      Curve = ctLinear
      DisplayName = 'volume'
      CurveFactor = 1.000000000000000000
      SmoothingFactor = 1.000000000000000000
      VSTModule = Owner
      OnParameterChange = DistortionDataModuleParameterProperties1ParameterChange
    end>
  OnEditOpen = VSTModuleEditOpen
  OnProcess = VSTModuleProcess
  OnProcessReplacing = VSTModuleProcess
  Left = 192
  Top = 124
  Height = 150
  Width = 215
end
