PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_account` (
	`accId` text PRIMARY KEY NOT NULL,
	`username` text(64) NOT NULL,
	`email` text,
	`dateJoined` integer NOT NULL,
	`role` text(6),
	`institution` text,
	`auth_secret` text,
	`user_secret` text NOT NULL
);
--> statement-breakpoint
INSERT INTO `__new_account`("accId", "username", "email", "dateJoined", "role", "institution", "auth_secret", "user_secret") SELECT "accId", "username", "email", "dateJoined", "role", "institution", "auth_secret", "user_secret" FROM `account`;--> statement-breakpoint
DROP TABLE `account`;--> statement-breakpoint
ALTER TABLE `__new_account` RENAME TO `account`;--> statement-breakpoint
PRAGMA foreign_keys=ON;--> statement-breakpoint
CREATE UNIQUE INDEX `account_email_unique` ON `account` (`email`);