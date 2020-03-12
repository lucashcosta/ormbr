{
         CQL Brasil - Criteria Query Language for Delphi/Lazarus


                   Copyright (c) 2019, Isaque Pinheiro
                          All rights reserved.

                    GNU Lesser General Public License
                      Vers�o 3, 29 de junho de 2007

       Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
       A todos � permitido copiar e distribuir c�pias deste documento de
       licen�a, mas mud�-lo n�o � permitido.

       Esta vers�o da GNU Lesser General Public License incorpora
       os termos e condi��es da vers�o 3 da GNU General Public License
       Licen�a, complementado pelas permiss�es adicionais listadas no
       arquivo LICENSE na pasta principal.
}

{ @abstract(CQLBr Framework)
  @created(18 Jul 2019)
  @author(Isaque Pinheiro <isaquesp@gmail.com>)
  @author(Site : https://www.isaquepinheiro.com.br)
}

unit cqlbr.select.mysql;

interface

uses
  SysUtils,
  cqlbr.select;

type
  TCQLSelectMySQL = class(TCQLSelect)
  public
    constructor Create; override;
    function Serialize: String; override;
  end;

implementation

uses
  cqlbr.utils,
  cqlbr.db.register,
  cqlbr.interfaces,
  cqlbr.qualifier.mysql;

{ TCQLSelectMySQL }

constructor TCQLSelectMySQL.Create;
begin
  inherited;
  FQualifiers := TCQLSelectQualifiersMySQL.New;
end;

function TCQLSelectMySQL.Serialize: String;
begin
  if IsEmpty then
    Result := ''
  else
    Result := TUtils.Concat(['SELECT',
                             FColumns.Serialize,
                             FQualifiers.SerializeDistinct,
                             'FROM',
                             FTableNames.Serialize]);
end;

initialization
  TDBRegister.RegisterSelect(dbnMySQL, TCQLSelectMySQL.Create);

end.
