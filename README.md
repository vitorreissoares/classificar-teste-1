# Validador de Categoria e Subcategoria

Aplicação web para validar as colunas `categoria` e `subcategoria` sem editar Excel.

## O que ela faz

- Lista caption, curtidas, comentários, categoria e subcategoria.
- `OK` mantém a classificação original e grava `OK` em `validacao_1`/`validacao_2`.
- `Corrigir` abre listas fechadas, evitando erro de digitação e diferenças de maiúsculas/minúsculas.
- Itens que já têm conteúdo nas duas colunas de validação deixam de aparecer.
- Com Supabase, vários avaliadores podem trabalhar simultaneamente.
- Há uma reserva atômica de itens por avaliador, evitando que duas pessoas validem a mesma postagem ao mesmo tempo.
- O arquivo `index.html` funciona em GitHub Pages.

## Categorias encontradas no arquivo

- Conteúdo personalista
- Conteúdo programático

## Subcategorias encontradas

- Competência
- Identidade
- Propostas e soluções
- Relações pessoais e interpessoais

## Publicação

1. Crie um projeto no Supabase.
2. No SQL Editor, execute `supabase.sql`.
3. Em Authentication > Providers, habilite **Anonymous Sign-Ins**.
4. Abra `index.html` e preencha `SUPABASE_URL` e `SUPABASE_ANON_KEY` no bloco de configuração.
5. Suba `index.html`, `data.js` e `README.md` para um repositório GitHub.
6. No GitHub: Settings > Pages > Deploy from a branch > `main` / root.
7. Compartilhe a URL do GitHub Pages com os avaliadores.

### Segurança

Use somente a chave pública `anon` do Supabase no HTML. **Nunca coloque a `service_role key` no navegador.** As políticas RLS e as funções SQL controlam o acesso.

## Observação

O arquivo original foi preservado. O app usa o `shortCode` como identificador da postagem e grava apenas os resultados nas colunas `validacao_1` e `validacao_2`.
