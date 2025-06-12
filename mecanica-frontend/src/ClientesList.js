import { useEffect, useState } from 'react';
import axios from 'axios';

function ClientesList({ onEditar }) {
  const [clientes, setClientes] = useState([]);

  const carregar = () => {
    axios.get('http://localhost:8000/api/clientes')
      .then(res => setClientes(res.data))
      .catch(err => console.error('Erro ao buscar clientes:', err));
  };

  const excluir = id => {
    if (!window.confirm('Tem certeza que deseja excluir este cliente?')) return;
    axios.delete(`http://localhost:8000/api/clientes/${id}`)
      .then(() => carregar())
      .catch(err => {
        console.error('Erro ao excluir cliente:', err);
        alert('Erro ao excluir');
      });
  };

  useEffect(() => {
    carregar();
  }, []);

  return (
    <details>
      <summary><strong>Clientes Cadastrados</strong></summary>
      <ul>
        {clientes.map(c => (
          <li key={c.id}>
            {c.nome} — {c.cpf}
            {' '}
            <button onClick={() => onEditar(c)}>Editar</button>
            {' '}
            <button onClick={() => excluir(c.id)}>Excluir</button>
          </li>
        ))}
      </ul>
    </details>
  );
}

export default ClientesList;
