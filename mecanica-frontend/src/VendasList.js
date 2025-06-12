import { useEffect, useState } from 'react';
import axios from 'axios';

function VendasList() {
  const [vendas, setVendas] = useState([]);
  const [clientes, setClientes] = useState([]);
  const [vendedores, setVendedores] = useState([]);
  const [veiculos, setVeiculos] = useState([]);
  const [filtros, setFiltros] = useState({
    data: '',
    cliente_id: '',
    vendedor_id: ''
  });

  const carregar = async () => {
    try {
      const [vendasRes, clientesRes, vendedoresRes, veiculosRes] = await Promise.all([
        axios.get('http://localhost:8000/api/vendas'),
        axios.get('http://localhost:8000/api/clientes'),
        axios.get('http://localhost:8000/api/vendedores'),
        axios.get('http://localhost:8000/api/veiculos?with=modelo,categoria')
      ]);

      setVendas(vendasRes.data);
      setClientes(clientesRes.data);
      setVendedores(vendedoresRes.data);
      setVeiculos(veiculosRes.data);
    } catch (err) {
      console.error('Erro ao carregar dados:', err);
    }
  };

  useEffect(() => {
    carregar();
  }, []);

  const excluir = id => {
    if (!window.confirm('Deseja excluir esta venda?')) return;
    axios.delete(`http://localhost:8000/api/vendas/${id}`)
      .then(() => carregar())
      .catch(err => {
        console.error('Erro ao excluir venda:', err);
        alert('Erro ao excluir');
      });
  };

  const vendasFiltradas = vendas.filter(v => {
    const dataOk = !filtros.data || v.data_venda === filtros.data;
    const clienteOk = !filtros.cliente_id || v.id_cliente == filtros.cliente_id;
    const vendedorOk = !filtros.vendedor_id || v.id_vendedor == filtros.vendedor_id;
    return dataOk && clienteOk && vendedorOk;
  });

  return (
    <div>
      <h2>Vendas Realizadas</h2>

      <div style={{ display: 'flex', gap: '10px', flexWrap: 'wrap', marginBottom: '10px' }}>
        <div>
          <label>Filtrar por data: </label><br />
          <input
            type="date"
            value={filtros.data}
            onChange={e => setFiltros(f => ({ ...f, data: e.target.value }))}
            style={{ width: '150px' }}
          />
        </div>

        <div>
          <label>Cliente: </label><br />
          <select
            value={filtros.cliente_id}
            onChange={e => setFiltros(f => ({ ...f, cliente_id: e.target.value }))}
            style={{ width: '200px' }}
          >
            <option value="">Todos</option>
            {clientes.map(c => <option key={c.id} value={c.id}>{c.nome}</option>)}
          </select>
        </div>

        <div>
          <label>Vendedor: </label><br />
          <select
            value={filtros.vendedor_id}
            onChange={e => setFiltros(f => ({ ...f, vendedor_id: e.target.value }))}
            style={{ width: '200px' }}
          >
            <option value="">Todos</option>
            {vendedores.map(v => <option key={v.id} value={v.id}>{v.nome}</option>)}
          </select>
        </div>
      </div>

      <ul>
        {vendasFiltradas.map(v => {
          const cliente = clientes.find(c => c.id === v.id_cliente);
          const vendedor = vendedores.find(vd => vd.id === v.id_vendedor);
          const veiculo = veiculos.find(ve => ve.id === v.id_veiculo);

          return (
            <li key={v.id} style={{ marginBottom: '10px' }}>
              <strong>Cliente:</strong> {cliente?.nome} — <strong>CPF:</strong> {cliente?.cpf} — <strong>Telefone:</strong> {cliente?.telefone} <br />
              <strong>Vendedor:</strong> {vendedor?.nome} <br />
              <strong>Veículo:</strong> {veiculo?.modelo?.descricao} — <strong>Categoria:</strong> {veiculo?.modelo?.categoria?.descricao} — <strong>Valor:</strong> R$ {Number(veiculo?.valor).toLocaleString('pt-BR')} <br />
              <strong>Data:</strong> {v.data_venda}
              {' '}
              <button onClick={() => excluir(v.id)} style={{ marginLeft: '10px' }}>Excluir</button>
            </li>
          );
        })}
      </ul>
    </div>
  );
}

export default VendasList;
