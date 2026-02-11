import { primaryKey } from 'drizzle-orm/gel-core';
import { integer, sqliteTable, text } from 'drizzle-orm/sqlite-core';

export const account = sqliteTable("account", {
    accId: text('accId').primaryKey(),
    username: text("username", { length: 64 }).notNull(),
    email: text("email").unique(),
    dateJoined: integer("dateJoined", { mode: 'timestamp' })
    .notNull()
    .$defaultFn(() => new Date()),
    role: text("role", { length: 6 }),
    institution: text("institution"),
    authSecret: text("auth_secret"),
    userSecret: text("user_secret").notNull(),
    admin: integer("admin", {mode: 'boolean'}),
    deleted: integer("deleted", {mode: 'boolean'}),
});

export const model = sqliteTable("model", {
    modelId: integer("model_id").primaryKey({ autoIncrement: true }).notNull(),
    uploaderId: text("uploader_id")
        .notNull()
        .references(() => account.accId, { onDelete: "cascade" }),
    title: text("title", { length: 100 }),
    uploadDate: integer("uploadDate", { mode: 'timestamp' })
    .notNull()
    .$defaultFn(() => new Date()),
    license: text("license"),
    filePath: text("file_path").notNull().unique(),
    description: text("description", { length: 500 }),
    metadata: text("metadata", { mode: 'json'}),
    notes: text("notes", { mode: 'json'}),
    approved: integer("approved", {mode: 'boolean'}),
    deleted: integer("deleted", {mode: 'boolean'}).default(false),
});

export const tag = sqliteTable("tag", {
    tagId: integer("tag_id").primaryKey({ autoIncrement: true }),
    name: text("name", { length: 50 }).notNull().unique(),
    requiresApproval: integer("requires_approval", { mode: "boolean"}).default(0),
    isHidden: integer("is_hidden", {mode: "boolean"}).default(0)
});

export const model_tag = sqliteTable("model_tag", {
    modelId: integer("model_id")
        .notNull()
        .references(() => model.modelId, { onDelete: "cascade"}),
    tagId: integer("tag_id")
        .notNull()
        .references(() => tag.tagId, { onDelete: "cascade"}),
    }, (table) => ({
        pk: primaryKey({ columns: ["modelId", "tagId"] })
}));


export const session = sqliteTable('session', {
	id: text('id').primaryKey(),
	userId: text('user_id').notNull().references(() => account.accId, { onDelete: "cascade" }),
	expiresAt: integer('expires_at', { mode: 'timestamp' }).notNull()
});
