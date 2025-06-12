import { useEffect, useState } from 'react';
import axios from 'axios';

function MetodoPagamentoList({ onEditar }) {
  const [metodos, setMetodos] = useState([]);

  const carregar = () => {
    axios.get('http://localhost:8000/api/metodos-pagamento')
      .then(res => setMetodos(res.data))
      .catch(err => console.error('Erro ao buscar métodos:', err));
  };

  const excluir = id => {
    if (!window.confirm('Deseja excluir este método de pagamento?')) return;
    axios.delete(`http://localhost:8000/api/metodos-pagamento/${id}`)
      .then(() => carregar())
      .catch(err => {
        console.error('Erro ao excluir método:', err);
        alert('Erro ao excluir');
      });
  };

  useEffect(() => { carregar(); }, []);

  return (
    <details>
      <summary><strong>Métodos de Pagamento</strong></summary>
      <ul style={{ marginTop: '10px' }}>
        {metodos.map(m => (
          <li key={m.id}>
            {m.descricao}
            <button onClick={() => onEditar(m)}>Editar</button>
            <button onClick={() => excluir(m.id)}>Excluir</button>
          </li>
        ))}
      </ul>
    </details>
  );
}

export default MetodoPagamentoList;
