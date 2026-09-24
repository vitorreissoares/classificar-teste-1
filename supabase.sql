-- Ajuste da fila para o fluxo "uma postagem por vez".
-- Execute este script uma única vez no SQL Editor do Supabase.
-- Ele não altera os dados das postagens nem as validações já gravadas.

create or replace function public.claim_validation_items(p_limit int default 1)
returns setof public.postagens_validacao
language plpgsql
security definer
set search_path = public
as $$
begin
  return query
  with picked as (
    select id
    from public.postagens_validacao
    where validacao_1 is null
      and validacao_2 is null
      and (claimed_by is null or claimed_at < now() - interval '30 minutes')
    order by id
    for update skip locked
    limit 1
  )
  update public.postagens_validacao p
     set claimed_by = auth.uid(), claimed_at = now()
    from picked
   where p.id = picked.id
  returning p.*;
end;
$$;
