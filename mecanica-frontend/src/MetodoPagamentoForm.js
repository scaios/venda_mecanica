import { useEffect, useState } from 'react';
import axios from 'axios';

function MetodoPagamentoForm({ metodoEditando, onMetodoSalvo }) {
  const [descricao, setDescricao] = useState('');

  useEffect(() => {
    if (metodoEditando) {
      setDescricao(metodoEditando.descricao);
    } else {
      setDescricao('');
    }
  }, [metodoEditando]);

  const handleSubmit = e => {
    e.preventDefault();

    const payload = { descricao };

    const requisicao = metodoEditando
      ? axios.put(`http://localhost:8000/api/metodos-pagamento/${metodoEditando.id}`, payload)
      : axios.post('http://localhost:8000/api/metodos-pagamento', payload);

    requisicao
      .then(() => {
        alert('Método salvo com sucesso');
        setDescricao('');
        onMetodoSalvo?.(); // dispara atualização no App
      })
      .catch(err => {
        console.error('Erro ao salvar método:', err);
        alert('Erro ao salvar');
      });
  };

  return (
    <form onSubmit={handleSubmit}>
      <h3>{metodoEditando ? 'Editar' : 'Novo'} Método de Pagamento</h3>
      <input
        type="text"
        placeholder="Descrição"
        value={descricao}
        onChange={e => setDescricao(e.target.value)}
        required
      />
      <button type="submit">{metodoEditando ? 'Atualizar' : 'Salvar'}</button>
    </form>
  );
}

export default MetodoPagamentoForm;
