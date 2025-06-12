import { useEffect, useState } from 'react';
import axios from 'axios';

function ModeloList({ onEditar }) {
  const [modelos, setModelos] = useState([]);

  const carregar = () => {
    axios.get('http://localhost:8000/api/modelos')
      .then(res => setModelos(res.data))
      .catch(err => console.error('Erro ao buscar modelos:', err));
  };

  const excluir = id => {
    if (!window.confirm('Deseja excluir este modelo?')) return;
    axios.delete(`http://localhost:8000/api/modelos/${id}`)
      .then(() => carregar())
      .catch(err => {
        console.error('Erro ao excluir modelo:', err);
        alert('Erro ao excluir');
      });
  };

  useEffect(() => { carregar(); }, []);

  return (
    <details>
      <summary><strong>Modelos</strong></summary>
      <ul style={{ marginTop: '10px' }}>
        {modelos.map(m => (
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

export default ModeloList;
