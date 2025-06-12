import { useEffect, useState } from 'react';
import axios from 'axios';

function CategoriaList({ onEditar }) {
  const [categorias, setCategorias] = useState([]);

  const carregar = () => {
    axios.get('http://localhost:8000/api/categorias')
      .then(res => setCategorias(res.data))
      .catch(err => console.error('Erro ao buscar categorias:', err));
  };

  const excluir = id => {
    if (!window.confirm('Deseja excluir esta categoria?')) return;
    axios.delete(`http://localhost:8000/api/categorias/${id}`)
      .then(() => carregar())
      .catch(err => {
        console.error('Erro ao excluir categoria:', err);
        alert('Erro ao excluir');
      });
  };

  useEffect(() => { carregar(); }, []);

  return (
    <details>
      <summary><strong>Categorias</strong></summary>
      <ul style={{ marginTop: '10px' }}>
        {categorias.map(c => (
          <li key={c.id}>
            {c.descricao}
            <button onClick={() => onEditar(c)}>Editar</button>
            <button onClick={() => excluir(c.id)}>Excluir</button>
          </li>
        ))}
      </ul>
    </details>
  );
}

export default CategoriaList;
