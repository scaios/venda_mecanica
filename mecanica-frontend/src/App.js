import { useEffect, useState } from 'react';
import axios from 'axios';

import ClienteForm from './ClienteForm';
import ClientesList from './ClientesList';
import VendaForm from './VendaForm';
import VendasList from './VendasList';
import VeiculoForm from './VeiculoForm';
import VeiculosList from './VeiculosList';
import VendedorForm from './VendedorForm';
import MetodoPagamentoForm from './MetodoPagamentoForm';
import MetodoPagamentoList from './MetodoPagamentoList';
import ModeloForm from './ModeloForm';
import ModeloList from './ModeloList';
import CategoriaForm from './CategoriaForm';
import CategoriaList from './CategoriaList';
import VendedoresList from './VendedoresList';

function App() {
  const [clientesAtualizar, setClientesAtualizar] = useState(false);
  const [clienteEditando, setClienteEditando] = useState(null);

  const [vendedorEditando, setVendedorEditando] = useState(null);
  const [vendedoresAtualizar, setVendedoresAtualizar] = useState(false);

  const [veiculoEditando, setVeiculoEditando] = useState(null);
  const [veiculos, setVeiculos] = useState([]);

  const [metodoEditando, setMetodoEditando] = useState(null);
  const [modeloEditando, setModeloEditando] = useState(null);
  const [categoriaEditando, setCategoriaEditando] = useState(null);

  useEffect(() => {
    axios.get('http://localhost:8000/api/veiculos')
      .then(res => setVeiculos(res.data));
  }, []);

  const handleVeiculoCriado = (novoOuEditado) => {
    setVeiculos(veiculos => {
      const i = veiculos.findIndex(v => v.id === novoOuEditado.id);
      if (i >= 0) {
        const copia = [...veiculos];
        copia[i] = novoOuEditado;
        return copia;
      } else {
        return [...veiculos, novoOuEditado];
      }
    });
    setVeiculoEditando(null);
  };

  const handleVeiculoExcluir = (id) => {
    axios.delete(`http://localhost:8000/api/veiculos/${id}`).then(() => {
      setVeiculos(veiculos => veiculos.filter(v => v.id !== id));
    });
  };

  return (
    <div style={{ padding: 20 }}>
      <h1>Aplicativo da Mecânica</h1>

      <ClienteForm
        onClienteCriado={() => {
          setClientesAtualizar(!clientesAtualizar);
          setClienteEditando(null);
        }}
        clienteEditando={clienteEditando}
      />
      <ClientesList key={`clientes-${clientesAtualizar}`} onEditar={setClienteEditando} />

      <hr />

      <VendedorForm
        onVendedorCriado={() => {
          setVendedoresAtualizar(!vendedoresAtualizar);
          setVendedorEditando(null);
        }}
        vendedorEditando={vendedorEditando}
      />
      <VendedoresList key={`vendedores-${vendedoresAtualizar}`} onEditar={setVendedorEditando} />

      <hr />

      <VeiculoForm
        onVeiculoCriado={handleVeiculoCriado}
        veiculoEditando={veiculoEditando}
      />
      <VeiculosList
        veiculos={veiculos}
        onEditar={setVeiculoEditando}
        onExcluir={handleVeiculoExcluir}
      />

      <hr />

      <MetodoPagamentoForm
        metodoEditando={metodoEditando}
        onMetodoCriado={() => setMetodoEditando(null)}
      />
      <MetodoPagamentoList onEditar={setMetodoEditando} />

      <hr />

      <ModeloForm
        modeloEditando={modeloEditando}
        onModeloCriado={() => setModeloEditando(null)}
      />
      <ModeloList onEditar={setModeloEditando} />

      <hr />

      <CategoriaForm
        categoriaEditando={categoriaEditando}
        onCategoriaCriada={() => setCategoriaEditando(null)}
      />
      <CategoriaList onEditar={setCategoriaEditando} />

      <hr />

      <VendaForm />
      <VendasList />
    </div>
  );
}

export default App;
