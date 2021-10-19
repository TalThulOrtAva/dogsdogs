-- noinspection SqlNoDataSourceInspectionForFile
CREATE TABLE IF NOT EXISTS "active_storage_attachments" (
  "id"          INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name"        VARCHAR                           NOT NULL,
  "record_type" VARCHAR                           NOT NULL,
  "record_id"   INTEGER                           NOT NULL,
  "blob_id"     INTEGER                           NOT NULL,
  "created_at"  DATETIME                          NOT NULL
);
CREATE TABLE sqlite_sequence (
  name,
  seq
);
CREATE INDEX "index_active_storage_attachments_on_blob_id" ON "active_storage_attachments" ("blob_id");
CREATE UNIQUE INDEX "index_active_storage_attachments_uniqueness" ON "active_storage_attachments" ("record_type", "record_id", "name", "blob_id");
CREATE TABLE IF NOT EXISTS "active_storage_blobs" (
  "id"           INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "key"          VARCHAR                           NOT NULL,
  "filename"     VARCHAR                           NOT NULL,
  "content_type" VARCHAR,
  "metadata"     TEXT,
  "byte_size"    BIGINT                            NOT NULL,
  "checksum"     VARCHAR                           NOT NULL,
  "created_at"   DATETIME                          NOT NULL
);
CREATE UNIQUE INDEX "index_active_storage_blobs_on_key" ON "active_storage_blobs" ("key");
CREATE TABLE IF NOT EXISTS "dogs" (
  "id"            INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name"          VARCHAR,
  "birthday"      DATETIME,
  "adoption_date" DATETIME,
  "description"   TEXT,
  "created_at"    DATETIME                          NOT NULL,
  "updated_at"    DATETIME                          NOT NULL
);
CREATE TABLE IF NOT EXISTS "users" (
  "id"                     INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name"                   VARCHAR,
  "email"                  VARCHAR,
  "created_at"             DATETIME                          NOT NULL,
  "updated_at"             DATETIME                          NOT NULL,
  "encrypted_password"     VARCHAR DEFAULT '' NOT NULL,
  "reset_password_token"   VARCHAR,
  "reset_password_sent_at" DATETIME,
  "remember_created_at"    DATETIME,
  "sign_in_count"          INTEGER DEFAULT 0 NOT NULL,
  "current_sign_in_at"     DATETIME,
  "last_sign_in_at"        DATETIME,
  "current_sign_in_ip"     VARCHAR,
  "last_sign_in_ip"        VARCHAR
);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE IF NOT EXISTS "schema_migrations" (
  "version" VARCHAR NOT NULL PRIMARY KEY
);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" (
  "key"        VARCHAR  NOT NULL PRIMARY KEY,
  "value"      VARCHAR,
  "created_at" DATETIME NOT NULL,
  "updated_at" DATETIME NOT NULL
);
INSERT INTO "schema_migrations" (version) VALUES
  ('20180605190413'),
  ('20180605190431'),
  ('20180605195517'),
  ('20180607114248');


