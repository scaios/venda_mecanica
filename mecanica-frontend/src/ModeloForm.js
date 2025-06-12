import { useEffect, useState } from 'react';
import axios from 'axios';

function ModeloForm({ modeloEditando }) {
  const [descricao, setDescricao] = useState('');
  const [id_categoria, setIdCategoria] = useState('');
  const [categorias, setCategorias] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:8000/api/categorias').then(res => setCategorias(res.data));
  }, []);

  useEffect(() => {
    if (modeloEditando) {
      setDescricao(modeloEditando.descricao);
      setIdCategoria(modeloEditando.id_categoria);
    } else {
      setDescricao('');
      setIdCategoria('');
    }
  }, [modeloEditando]);

  const handleSubmit = e => {
    e.preventDefault();
    const payload = { descricao, id_categoria };

    if (modeloEditando) {
      axios.put(`http://localhost:8000/api/modelos/${modeloEditando.id}`, payload)
        .then(() => alert('Modelo atualizado com sucesso!'));
    } else {
      axios.post('http://localhost:8000/api/modelos', payload)
        .then(() => alert('Modelo criado com sucesso!'));
    }

    setDescricao('');
    setIdCategoria('');
  };

  return (
    <form onSubmit={handleSubmit}>
      <h2>{modeloEditando ? 'Editar Modelo' : 'Novo Modelo'}</h2>
      <input
        type="text"
        placeholder="Descrição"
        value={descricao}
        onChange={e => setDescricao(e.target.value)}
        required
      />
      <select value={id_categoria} onChange={e => setIdCategoria(e.target.value)} required>
        <option value="">Selecione a Categoria</option>
        {categorias.map(cat => (
          <option key={cat.id} value={cat.id}>{cat.descricao}</option>
        ))}
      </select>
      <button type="submit">Salvar</button>
    </form>
  );
}

export default ModeloForm;
