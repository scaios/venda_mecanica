import { useEffect, useState } from 'react';
import axios from 'axios';

function VeiculoForm({ onVeiculoCriado, veiculoEditando }) {
  const [modelos, setModelos] = useState([]);
  const [cores, setCores] = useState([]);
  const [form, setForm] = useState({
    id: null,
    modelo_id: '',
    cor_id: '',
    ano: '',
    valor: ''
  });

  useEffect(() => {
    axios.get('http://localhost:8000/api/modelos').then(res => setModelos(res.data));
    axios.get('http://localhost:8000/api/cores').then(res => setCores(res.data));
  }, []);

  useEffect(() => {
    if (veiculoEditando) {
      setForm({
        ...veiculoEditando,
        valor: formatarParaBRL(veiculoEditando.valor.toString())
      });
    }
  }, [veiculoEditando]);

  const formatarParaBRL = (valor) => {
    const numero = parseFloat(valor.replace(/\D/g, '')) || 0;
    return numero.toLocaleString('pt-BR', {
      style: 'currency',
      currency: 'BRL',
      minimumFractionDigits: 0
    });
  };

  const handleChange = e => {
    const { name, value } = e.target;

    if (name === 'valor') {
      const soNumeros = value.replace(/\D/g, '');
      setForm(prev => ({
        ...prev,
        [name]: formatarParaBRL(soNumeros)
      }));
    } else {
      setForm(prev => ({ ...prev, [name]: value }));
    }
  };

  const handleSubmit = e => {
    e.preventDefault();

    const payload = {
      id_modelo: form.modelo_id, // <-- Aqui o nome esperado pelo Laravel
      id_cor: form.cor_id,        // <-- Aqui também
      ano: form.ano,
      valor: parseFloat(form.valor.replace(/\D/g,''))
    };
    

    const req = form.id
      ? axios.put(`http://localhost:8000/api/veiculos/${form.id}`, payload)
      : axios.post('http://localhost:8000/api/veiculos', payload);

    req.then(res => {
      alert(form.id ? 'Veículo atualizado!' : 'Veículo cadastrado com sucesso!');
      onVeiculoCriado?.(res.data); // agora passa o veículo salvo para o App
      setForm({ id: null, modelo_id: '', cor_id: '', ano: '', valor: '' });
    }).catch(err => {
      console.error('Erro ao salvar veículo:', err);
      if (err.response) {
        console.error('Resposta da API:', err.response.data);
        alert('Erro da API: ' + JSON.stringify(err.response.data));
      } else {
        alert('Erro ao salvar veículo');
      }
    });
  };

  return (
    <form onSubmit={handleSubmit} style={{ marginBottom: 20 }}>
      <h2>{form.id ? 'Editar Veículo' : 'Cadastrar Veículo'}</h2>

      <select name="modelo_id" value={form.modelo_id} onChange={handleChange} required>
        <option value="">Selecione o Modelo</option>
        {modelos.map(m => (
          <option key={m.id} value={m.id}>{m.nome || m.descricao}</option>
        ))}
      </select><br />

      <select name="cor_id" value={form.cor_id} onChange={handleChange} required>
        <option value="">Selecione a Cor</option>
        {cores.map(c => (
          <option key={c.id} value={c.id}>{c.nome || c.descricao}</option>
        ))}
      </select><br />

      <input type="text" name="ano" placeholder="Ano" value={form.ano} onChange={handleChange} required /><br />
      <input type="text" name="valor" placeholder="Valor" value={form.valor} onChange={handleChange} required /><br />

      <button type="submit">{form.id ? 'Atualizar' : 'Salvar Veículo'}</button>
    </form>
  );
}

export default VeiculoForm;
