import { useEffect, useState } from 'react';
import axios from 'axios';

function VendedorForm({ onVendedorCriado, vendedorEditando }) {
  const [form, setForm] = useState({
    nome: '',
    cpf: '',
    telefone: '',
    email: '',
    percentual_comissao: ''
  });

  useEffect(() => {
    if (vendedorEditando) setForm(vendedorEditando);
  }, [vendedorEditando]);

  const handleChange = e => {
    const { name, value } = e.target;

    let newValue = value;
    if (name === 'cpf') newValue = value.slice(0, 14);
    if (name === 'telefone') newValue = value.slice(0, 20);

    setForm(prev => ({ ...prev, [name]: newValue }));
  };

  const handleSubmit = e => {
    e.preventDefault();

    const req = form.id
      ? axios.put(`http://localhost:8000/api/vendedores/${form.id}`, form)
      : axios.post('http://localhost:8000/api/vendedores', form);

    req.then(() => {
      alert(form.id ? 'Vendedor atualizado!' : 'Vendedor cadastrado!');
      setForm({
        nome: '',
        cpf: '',
        telefone: '',
        email: '',
        percentual_comissao: ''
      });
      onVendedorCriado();
    }).catch(err => {
      console.error('Erro ao salvar vendedor:', err);
      alert('Erro ao salvar vendedor');
    });
  };

  return (
    <form onSubmit={handleSubmit} style={{ marginBottom: 20 }}>
      <h2>{form.id ? 'Editar Vendedor' : 'Cadastrar Vendedor'}</h2>

      <input type="text" name="nome" placeholder="Nome" value={form.nome} onChange={handleChange} required /><br />
      <input type="text" name="cpf" placeholder="CPF" value={form.cpf} onChange={handleChange} required /><br />
      <input type="text" name="telefone" placeholder="Telefone" value={form.telefone} onChange={handleChange} /><br />
      <input type="email" name="email" placeholder="Email" value={form.email} onChange={handleChange} /><br />
      <input type="number" name="percentual_comissao" placeholder="% Comissão" value={form.percentual_comissao} onChange={handleChange} /><br />

      <button type="submit">{form.id ? 'Atualizar' : 'Salvar'}</button>
    </form>
  );
}

export default VendedorForm;
