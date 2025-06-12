import { useEffect, useState } from 'react';
import axios from 'axios';

function ClienteForm({ onClienteCriado, clienteEditando }) {
  const [cliente, setCliente] = useState({
    nome: '',
    cpf: '',
    email: '',
    telefone: '',
  });

  useEffect(() => {
    if (clienteEditando) setCliente(clienteEditando);
  }, [clienteEditando]);

  const handleChange = e => {
    const { name, value } = e.target;

    let newValue = value;
    if (name === 'cpf') newValue = value.slice(0, 14);
    if (name === 'telefone') newValue = value.slice(0, 20);

    setCliente(prev => ({ ...prev, [name]: newValue }));
  };

  const handleSubmit = e => {
    e.preventDefault();

    const req = cliente.id
      ? axios.put(`http://localhost:8000/api/clientes/${cliente.id}`, cliente)
      : axios.post('http://localhost:8000/api/clientes', cliente);

    req.then(() => {
      alert(cliente.id ? 'Cliente atualizado!' : 'Cliente cadastrado!');
      onClienteCriado(); // força recarregar
      setCliente({ nome: '', cpf: '', email: '', telefone: '' });
    }).catch(err => {
      console.error('Erro ao salvar cliente:', err);
      alert('Erro ao salvar');
    });
  };

  return (
    <form onSubmit={handleSubmit} style={{ marginBottom: 20 }}>
      <h2>{cliente.id ? 'Editar Cliente' : 'Cadastrar Cliente'}</h2>

      <input type="text" name="nome" placeholder="Nome" value={cliente.nome} onChange={handleChange} required /><br />
      <input type="text" name="cpf" placeholder="CPF/CNPJ" value={cliente.cpf} onChange={handleChange} required /><br />
      <input type="email" name="email" placeholder="Email" value={cliente.email} onChange={handleChange} /><br />
      <input type="text" name="telefone" placeholder="Telefone" value={cliente.telefone} onChange={handleChange} /><br />
      <button type="submit">{cliente.id ? 'Atualizar' : 'Salvar'}</button>
    </form>
  );
}

export default ClienteForm;
