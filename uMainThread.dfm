object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'MainForm'
  ClientHeight = 431
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Fixedsys'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 13
    Top = 328
    Width = 104
    Height = 16
    Caption = 'NumberToCheck'
  end
  object Label2: TLabel
    Left = 147
    Top = 328
    Width = 72
    Height = 16
    Caption = 'ThreadNum'
  end
  object btnStop: TButton
    Left = 147
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 0
    OnClick = btnStopClick
  end
  object PB0: TProgressBar
    Left = 13
    Top = 8
    Width = 209
    Height = 25
    TabOrder = 1
  end
  object btnStart: TButton
    Left = 13
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 2
    OnClick = btnStartClick
  end
  object edtNumberToCheck: TEdit
    Left = 13
    Top = 359
    Width = 75
    Height = 24
    TabOrder = 3
    Text = '1000'
  end
  object edtThreadCount: TEdit
    Left = 147
    Top = 359
    Width = 75
    Height = 24
    TabOrder = 4
    Text = '8'
  end
  object PB1: TProgressBar
    Left = 13
    Top = 48
    Width = 209
    Height = 25
    TabOrder = 5
  end
  object PB3: TProgressBar
    Left = 13
    Top = 128
    Width = 209
    Height = 25
    TabOrder = 6
  end
  object PB2: TProgressBar
    Left = 13
    Top = 88
    Width = 209
    Height = 25
    TabOrder = 7
  end
  object PB7: TProgressBar
    Left = 13
    Top = 289
    Width = 209
    Height = 25
    TabOrder = 8
  end
  object PB6: TProgressBar
    Left = 13
    Top = 248
    Width = 209
    Height = 25
    TabOrder = 9
  end
  object PB5: TProgressBar
    Left = 13
    Top = 208
    Width = 209
    Height = 25
    TabOrder = 10
  end
  object PB4: TProgressBar
    Left = 13
    Top = 168
    Width = 209
    Height = 25
    TabOrder = 11
  end
end
