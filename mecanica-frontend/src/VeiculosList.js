function VeiculosList({ veiculos, onEditar, onExcluir }) {
  return (
    <details>
      <summary><strong>Veículos Cadastrados</strong></summary>
      <table border="1" cellPadding="5" style={{ marginTop: '10px' }}>
        <thead>
          <tr>
            <th>ID</th>
            <th>Modelo</th>
            <th>Cor</th>
            <th>Ano</th>
            <th>Valor</th>
            <th>Ações</th>
          </tr>
        </thead>
        <tbody>
          {veiculos.map(v => (
            <tr key={v.id}>
              <td>{v.id}</td>
              <td>{v.modelo?.nome || v.modelo?.descricao || '—'}</td>
              <td>{v.cor?.nome || v.cor?.descricao || '—'}</td>
              <td>{v.ano}</td>
              <td>R$ {Number(v.valor).toLocaleString('pt-BR')}</td>
              <td>
                <button onClick={() => onEditar(v)}>Editar</button>{' '}
                <button onClick={() => {
                  if (window.confirm('Tem certeza que deseja excluir este veículo?')) {
                    onExcluir(v.id);
                  }
                }}>Excluir</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </details>
  );
}

export default VeiculosList;
