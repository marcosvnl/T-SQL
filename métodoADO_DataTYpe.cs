try
{
	using SqlConnection conn = new(MaquinaEstadosConnection);
	SqlCommand cmd = new("[dbo].[sp_insert_retorno_lote]", conn);
	cmd.CommandType = CommandType.StoredProcedure;
	cmd.Parameters.AddWithValue("@STATUS_REGISTRO_TRANSMISSAO", (int)lote.StatusTransmission);
	cmd.Parameters.AddWithValue("@ID_TRANSMISSAO", (int)StatusTransmission.Trasmitido == 1 ? lote.IdentificadorApolice : DBNull.Value);
	cmd.Parameters.AddWithValue("@DATA_HORA_TRANSMISSAO", DateTime.Now);
	cmd.Parameters.AddWithValue("@REGISTRADORA_TRANSMISSAO", "B3");
	cmd.Parameters.AddWithValue("@ID_REGISTRO", lote.SROId);
	cmd.Parameters.AddWithValue("@DOCUMENTO_JSON", lote.Json);
	cmd.Parameters.AddWithValue("@TIPO_REGISTRO", lote.TipoRegistro);

	//Criar um DataTable igual ao Type no SQL e o Type tem q ser uma réplica da tabela onde os dados serão guardados
	#region Enviar Mensagens de Erro
	DataTable table = new();
	table.Columns.Add("ID_MENSAGEM");
	table.Columns.Add("ID_REGISTRO_TRANSMISSAO");
	table.Columns.Add("CONSTANTE_ERRO");
	table.Columns.Add("MENSAGEM_ERRO");
	DataRow row;

	int numColunas = table.Columns.Count;

	if (lote.Erros != null)
	{
		foreach (var item in lote.Erros!)
		{
			row = table.NewRow();
			row["CONSTANTE_ERRO"] = item.ConstanteErro;
			row["MENSAGEM_ERRO"] = item.MensagemErro;
			table.Rows.Add(row);
		}

		//Passar a Variável que tem o tipo Type
		var mensagens = new SqlParameter("@MENSAGENS", SqlDbType.Structured)
		{
			TypeName = "[dbo].[MENSAGENS_TYPE]",
			Value = table
		};
		cmd.Parameters.Add(mensagens);
	}
	else
		cmd.Parameters.AddWithValue("@MENSAGEM_RETORNO", lote.HttpStatus <= 299 ? "Enviado com sucesso" : lote.Erro!.MensagemErro);

	#endregion

	cmd.Parameters.AddWithValue("@HTTP_STATUS", lote.HttpStatus);
	await conn.OpenAsync();
	await cmd.ExecuteNonQueryAsync();
	await conn.CloseAsync();
}
catch (SqlException ex)
{
	for (int i = 0; i < ex.Errors.Count; i  )
	{
		throw new Exception($"{ex.Errors[i].Message}, {ex.Errors[i].LineNumber}, {ex.Errors[i].Procedure}, {ex.Errors[i].Source}");
	}
}