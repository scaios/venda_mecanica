import { useEffect, useState } from 'react';
import axios from 'axios';

function VendaForm() {
  const [form, setForm] = useState({
    cliente_id: '',
    veiculo_id: '',
    vendedor_id: '',
    metodo_pagamento_id: '',
    data_venda: ''
  });

  const [clientes, setClientes] = useState([]);
  const [veiculos, setVeiculos] = useState([]);
  const [vendedores, setVendedores] = useState([]);
  const [pagamentos, setPagamentos] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:8000/api/clientes').then(res => setClientes(res.data));
    axios.get('http://localhost:8000/api/veiculos').then(res => setVeiculos(res.data));
    axios.get('http://localhost:8000/api/vendedores').then(res => setVendedores(res.data));
    axios.get('http://localhost:8000/api/metodos-pagamento').then(res => setPagamentos(res.data));
  }, []);

  const handleChange = e => {
    const { name, value } = e.target;
    setForm(prev => ({ ...prev, [name]: value }));
  };

  const handleSubmit = e => {
    e.preventDefault();

    const payload = {
      id_cliente: form.cliente_id,
      id_veiculo: form.veiculo_id,
      id_vendedor: form.vendedor_id,
      id_metodo_pagamento: form.metodo_pagamento_id,
      data_venda: form.data_venda
    };

    axios.post('http://localhost:8000/api/vendas', payload)
      .then(() => {
        alert('Venda cadastrada com sucesso!');
        setForm({ cliente_id: '', veiculo_id: '', vendedor_id: '', metodo_pagamento_id: '', data_venda: '' });
      })
      .catch(err => {
        console.error('Erro ao salvar venda:', err);
        if (err.response) {
          console.error('Resposta da API:', err.response.data);
          alert('Erro da API: ' + JSON.stringify(err.response.data));
        } else {
          alert('Erro ao salvar venda');
        }
      });
  };

  // Garante que a data máxima permitida seja hoje
  const hoje = new Date().toISOString().split('T')[0];

  return (
    <form onSubmit={handleSubmit}>
      <h2>Registrar Venda</h2>

      <select name="cliente_id" value={form.cliente_id} onChange={handleChange} required>
        <option value="">Selecione o Cliente</option>
        {clientes.map(c => (
          <option key={c.id} value={c.id}>{c.nome}</option>
        ))}
      </select><br />

      <select name="veiculo_id" value={form.veiculo_id} onChange={handleChange} required>
        <option value="">Selecione o Veículo</option>
        {veiculos.map(v => (
          <option key={v.id} value={v.id}>
            {v.modelo?.descricao || 'Sem modelo'} - {v.ano}
          </option>
        ))}
      </select><br />

      <select name="vendedor_id" value={form.vendedor_id} onChange={handleChange} required>
        <option value="">Selecione o Vendedor</option>
        {vendedores.map(v => (
          <option key={v.id} value={v.id}>{v.nome}</option>
        ))}
      </select><br />

      <select name="metodo_pagamento_id" value={form.metodo_pagamento_id} onChange={handleChange} required>
        <option value="">Selecione o Método de Pagamento</option>
        {pagamentos.map(p => (
          <option key={p.id} value={p.id}>{p.descricao}</option>
        ))}
      </select><br />

      <input
        type="date"
        name="data_venda"
        value={form.data_venda}
        onChange={handleChange}
        required
        max={hoje}
      /><br />

      <button type="submit">Salvar Venda</button>
    </form>
  );
}

export default VendaForm;
