-- Run once in your own Supabase project's SQL editor.
create table public.clover_records (
 owner uuid not null references auth.users(id) on delete cascade,
 id text not null,
 value jsonb,
 deleted boolean not null default false,
 updated bigint not null,
 primary key(owner,id)
);
alter table public.clover_records enable row level security;
create policy "Own Clover records" on public.clover_records for all to authenticated
 using ((select auth.uid())=owner) with check ((select auth.uid())=owner);
insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
 values ('memories','memories',false,41943040,array['image/jpeg','image/png','image/webp','image/gif','image/heic','image/heif','video/mp4','video/quicktime','video/webm','application/pdf','application/msword','application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','text/plain','text/csv','application/rtf','application/vnd.oasis.opendocument.text']);
create policy "Own Clover media" on storage.objects for all to authenticated
 using (bucket_id='memories' and (storage.foldername(name))[1]=(select auth.uid())::text)
 with check (bucket_id='memories' and (storage.foldername(name))[1]=(select auth.uid())::text);
