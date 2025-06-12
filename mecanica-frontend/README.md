# Aplicativo da Mecânica

## 📦 Requisitos
- PHP 8.1+
- Composer
- Node.js + npm
- MySQL

## 🔧 Backend (Laravel)
1. Copie `.env.example` para `.env` dentro de `mecanica-api/`
2. Configure os dados do banco no `.env`
3. Rode os comandos:
```bash
cd mecanica-api
composer install
php artisan key:generate
php artisan migrate --seed
php artisan serve
