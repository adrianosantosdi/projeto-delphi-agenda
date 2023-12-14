unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    Cadastro: TTabSheet;
    Pesquisa: TTabSheet;
    Label2: TLabel;
    edtId: TEdit;
    Label3: TLabel;
    edtNome: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtUf: TEdit;
    Label6: TLabel;
    edtCidade: TEdit;
    Label7: TLabel;
    edtBairro: TEdit;
    Label8: TLabel;
    Panel3: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    maskTelefone: TMaskEdit;
    maskCep: TMaskEdit;
    DBGrid1: TDBGrid;
    Label9: TLabel;
    edtPesquisar: TEdit;
    btnEditar: TButton;
    Button1: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure HabilitarCampos;
    procedure DesabilitarCampos;
    procedure CancelarEdicao;
    procedure btnSalvarClick(Sender: TObject);
    procedure LimparCampos;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtPesquisarChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PreencheEdits;
    procedure Insert;
    procedure Update;
    procedure Delete(const AValue : Integer);
    procedure Salvar;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses unitDM;

procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a edição?', mtConfirmation, [mbYes, mbNo], 0) = MrYes then
     CancelarEdicao;
end;

procedure TfrmPrincipal.btnEditarClick(Sender: TObject);
begin
  if not DM.QryAgenda.IsEmpty then
  begin
     HabilitarCampos;
     PreencheEdits;
     PageControl1.ActivePageIndex := 0;
  end;
end;

procedure TfrmPrincipal.btnNovoClick(Sender: TObject);
begin
  if MessageDlg('Deseja criar um novo registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     HabilitarCampos;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
begin
   if MessageDlg('Deseja salva o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
     Salvar;
     LimparCampos;
     DesabilitarCampos;
   end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  if MessageDlg('Deseja Excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     Delete(DM.QryAgenda.FieldByName('ID').AsInteger);
     edtPesquisarChange(Sender);
  end;


end;

procedure TfrmPrincipal.CancelarEdicao;
begin
  edtNome.Text  := '';
  maskTelefone.Text := '';
  edtUf.Text := '';
  edtCidade.Text := '';
  edtBairro.Text := '';
  maskCep.Text := '';
end;

procedure TfrmPrincipal.HabilitarCampos;
begin
  edtId.Enabled := False;
  edtNome.Enabled := true;
  maskTelefone.Enabled := true;
  edtUf.Enabled := true;
  edtCidade.Enabled := true;
  edtBairro.Enabled := true;
  maskCep.Enabled := true;
end;

procedure TfrmPrincipal.Insert;
begin
 with DM.QryAgenda do
    begin
      close;
      SQL.Clear;
      SQL.Add('insert into agenda (nome, telefone, Uf, cidade, bairro, cep) values ');
      SQL.Add('(:pnome, :ptelefone, :pUf, :pcidade, :pbairro, :pcep)');
      ParamByName('pnome').AsString := edtNome.Text;
      ParamByName('ptelefone').AsString := maskTelefone.Text;
      ParamByName('pUf').AsString := edtUf.Text;
      ParamByName('pcidade').AsString := edtCidade.Text;
      ParamByName('pbairro').AsString := edtBairro.Text;
      ParamByName('pcep').AsString := maskCep.Text;
	  try
        ExecSQL;
		ShowMessage('Inclusão realizada com sucesso!')
	  except
       on E:Exception do
          raise Exception.Create('Erro na inclusão do registro!' + E.Message)
    end;

    end;
end;

procedure TfrmPrincipal.Delete(const AValue : Integer);
begin
  with DM.QryDelete do
    begin
     SQL.Add('delete from agenda where id = :pid');
     ParamByName('pid').AsInteger := AValue;

     try
       ExecSQL;
       ShowMessage('Excluido com sucesso!')
     except
        raise Exception.Create('Erro na exclusao do registro!');
     end;
    end;
end;

procedure TfrmPrincipal.DesabilitarCampos;
begin
  edtId.Enabled := false;
  edtNome.Enabled := false;
  maskTelefone.Enabled := false;
  edtUf.Enabled := false;
  edtCidade.Enabled := false;
  edtBairro.Enabled := false;
  maskCep.Enabled := false;
end;

procedure TfrmPrincipal.edtPesquisarChange(Sender: TObject);
begin
  with DM.QryAgenda do
    begin
      close;
      SQL.Clear;
      SQL.Add('select * from agenda where nome like :pnome');
      ParamByName('pnome').AsString := '%'+UpperCase(edtPesquisar.text)+'%' ;
      Open;
    end;
end;

procedure TfrmPrincipal.LimparCampos;
begin
  edtId.Text    := '';
  edtNome.Text  := '';
  maskTelefone.Text := '';
  edtUf.Text := '';
  edtCidade.Text := '';
  edtBairro.Text := '';
  maskCep.Text := '';
end;

procedure TfrmPrincipal.PreencheEdits;
begin
  edtId.Text        := DM.QryAgenda.FieldByName('ID').AsString;
  edtNome.Text      := DM.QryAgenda.FieldByName('NOME').AsString;
  maskTelefone.Text := DM.QryAgenda.FieldByName('TELEFONE').AsString;
  edtUf.Text        := DM.QryAgenda.FieldByName('UF').AsString;
  edtCidade.Text    := DM.QryAgenda.FieldByName('CIDADE').AsString;
  edtBairro.Text    := DM.QryAgenda.FieldByName('BAIRRO').AsString;
  maskCep.Text      := DM.QryAgenda.FieldByName('CEP').AsString;
end;

procedure TfrmPrincipal.Salvar;
begin
  if edtId.Text = '' then
     Insert
  else
     Update;

  PageControl1.ActivePageIndex := 1;
  DesabilitarCampos;
end;

procedure TfrmPrincipal.Update;
begin
 with DM.QryAgenda do
 begin
   close;
   SQL.Clear;
   SQL.Add('update agenda           ' +
	       '   set nome     = :pnome, ' +
	   '       telefone = :ptelefone, ' +
	   '       Uf       = :pUf,       ' +
	   '       cidade   = :pcidade,   ' +
	   '       bairro   = :pbairro,   ' +
	   '       cep      = :pcep       ' +
	   ' where id       = :pid        ');

    ParamByName('pid').AsInteger      :=  StrtoInt(edtId.Text);
	  ParamByName('pnome').AsString     :=  edtNome.Text;
	  ParamByName('ptelefone').AsString :=  maskTelefone.Text;
	  ParamByName('pUf').AsString       :=  edtUf.Text;
	  ParamByName('pcidade').AsString   :=  edtCidade.Text;
	  ParamByName('pbairro').AsString   :=  edtBairro.Text;
    ParamByName('pcep').AsString      :=  maskCep.Text;

	  try
       ExecSQL;
	   	ShowMessage('Alteração feita com sucesso!')
	  except
       on E:Exception do
          raise Exception.Create('Erro na Alteração do registro!' + E.Message)
    end;
 end;
end;

end.
