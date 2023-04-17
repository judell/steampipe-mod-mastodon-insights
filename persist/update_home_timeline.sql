with data as (
  select
    account,
    account_url,
    content,
    created_at,
    display_name,
    followers,
    following,
    id,
    in_reply_to_account_id,
    instance_qualified_account_url,
    instance_qualified_reblog_url,
    instance_qualified_url,
    list_id,
    query,
    reblog,
    reblog_content,
    reblog_server,
    reblog_username,
    reblogs_count,
    replies_count,
    server,
    status,
    url,
    username
  from
    mastodon_toot_home
  limit 200
)
insert into public.p_mastodon_home_timeline (
    account,
    account_url,
    content,
    created_at,
    display_name,
    followers,
    following,
    id,
    in_reply_to_account_id,
    instance_qualified_account_url,
    instance_qualified_reblog_url,
    instance_qualified_url,
    list_id,
    query,
    reblog,
    reblog_content,
    reblog_server,
    reblog_username,
    reblogs_count,
    replies_count,
    server,
    status,
    url,
    username
)
select
  *
from
  data
where
  id not in ( select t.id from public.p_mastodon_home_timeline t )    
