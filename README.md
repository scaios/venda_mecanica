# Venda Mecânica

https://abc123.ngrok-free.app  <<<<--------------------------------

Sistema web para gerenciamento de clientes, veículos, vendedores e vendas de uma oficina mecânica.  
Desenvolvido com **Laravel (backend)**, **React (frontend)** e **MySQL**.

---

## ⚙️ Tecnologias
- Laravel 12 (PHP 8+)
- React 18
- MySQL
- Axios
- Ngrok (para deploy temporário)

---

## 🗃 Banco de Dados

Use o arquivo `backup.sql` para popular o banco com dados reais:

```bash
mysql -u root -p mecanica < backup.sql
```

🔧 Como rodar o projeto

- cd mecanica-api
- cp .env.example .env
- composer install
- php artisan key:generate
- php artisan migrate --seed
- php artisan serve
  
A API estará disponível em http://localhost:8000
```
```

Frontend (React)

- cd mecanica-frontend
- cp .env.exemplo .env
- npm install
- npm start

- REACT_APP_API_URL=http://localhost:8000

```

