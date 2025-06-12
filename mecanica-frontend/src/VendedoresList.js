import { useEffect, useState } from 'react';
import axios from 'axios';

function VendedoresList({ onEditar, onAtualizar }) {
  const [vendedores, setVendedores] = useState([]);

  const carregar = () => {
    axios.get('http://localhost:8000/api/vendedores')
      .then(res => setVendedores(res.data))
      .catch(err => console.error('Erro ao carregar vendedores:', err));
  };

  useEffect(() => {
    carregar();
  }, []);

  const excluir = id => {
    if (!window.confirm('Deseja realmente excluir este vendedor?')) return;

    axios.delete(`http://localhost:8000/api/vendedores/${id}`)
      .then(() => {
        alert('Vendedor excluído com sucesso');
        carregar();
        onAtualizar?.();
      })
      .catch(err => {
        console.error('Erro ao excluir vendedor:', err);
        alert('Erro ao excluir vendedor');
      });
  };

  return (
    <details>
      <summary><strong>Vendedores Cadastrados</strong></summary>
      <ul>
        {vendedores.map(v => (
          <li key={v.id}>
            {v.nome} - {v.email} - {v.telefone}
            <button onClick={() => onEditar(v)}>Editar</button>
            <button onClick={() => excluir(v.id)}>Excluir</button>
          </li>
        ))}
      </ul>
    </details>
  );
}

export default VendedoresList;
