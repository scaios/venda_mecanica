import { useEffect, useState } from 'react';
import axios from 'axios';

function CategoriaForm({ categoriaEditando }) {
  const [descricao, setDescricao] = useState('');
  const [categorias, setCategorias] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:8000/api/categorias')
      .then(res => setCategorias(res.data));
  }, []);

  useEffect(() => {
    if (categoriaEditando) {
      setDescricao(categoriaEditando.descricao);
    } else {
      setDescricao('');
    }
  }, [categoriaEditando]);

  const handleSubmit = e => {
    e.preventDefault();

    const descricaoLower = descricao.trim().toLowerCase();

    const duplicada = categorias.some(c =>
      c.descricao.trim().toLowerCase() === descricaoLower &&
      (!categoriaEditando || c.id !== categoriaEditando.id)
    );

    if (duplicada) {
      alert('Categoria já existe!');
      return;
    }

    const req = categoriaEditando
      ? axios.put(`http://localhost:8000/api/categorias/${categoriaEditando.id}`, { descricao })
      : axios.post('http://localhost:8000/api/categorias', { descricao });

    req.then(() => {
      alert(`Categoria ${categoriaEditando ? 'atualizada' : 'criada'} com sucesso!`);
      setDescricao('');
    }).catch(err => {
      console.error(err);
      alert('Erro ao salvar categoria');
    });
  };

  return (
    <form onSubmit={handleSubmit}>
      <h2>{categoriaEditando ? 'Editar Categoria' : 'Nova Categoria'}</h2>
      <input
        type="text"
        placeholder="Descrição"
        value={descricao}
        onChange={e => setDescricao(e.target.value)}
        required
      />
      <button type="submit">Salvar</button>
    </form>
  );
}

export default CategoriaForm;
