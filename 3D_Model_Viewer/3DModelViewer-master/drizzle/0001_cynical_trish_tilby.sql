CREATE TABLE `account` (
	`accId` text PRIMARY KEY NOT NULL,
	`username` text(24) NOT NULL,
	`email` text NOT NULL,
	`dateJoined` integer NOT NULL,
	`role` text(6),
	`institution` text,
	`auth_secret` text,
	`user_secret` text
);
--> statement-breakpoint
CREATE UNIQUE INDEX `account_username_unique` ON `account` (`username`);--> statement-breakpoint
CREATE UNIQUE INDEX `account_email_unique` ON `account` (`email`);--> statement-breakpoint
CREATE TABLE `model` (
	`model_id` integer PRIMARY KEY NOT NULL,
	`uploader_id` integer NOT NULL,
	`title` text(100),
	`uploadDate` integer NOT NULL,
	`license` text,
	`file_path` text NOT NULL,
	`description` text(500),
	`metadata` text,
	FOREIGN KEY (`uploader_id`) REFERENCES `account`(`accId`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE UNIQUE INDEX `model_file_path_unique` ON `model` (`file_path`);