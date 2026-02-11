PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_model` (
	`model_id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`uploader_id` text NOT NULL,
	`title` text(100),
	`uploadDate` integer NOT NULL,
	`license` text,
	`file_path` text NOT NULL,
	`description` text(500),
	`metadata` text,
	FOREIGN KEY (`uploader_id`) REFERENCES `account`(`accId`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
INSERT INTO `__new_model`("model_id", "uploader_id", "title", "uploadDate", "license", "file_path", "description", "metadata") SELECT "model_id", "uploader_id", "title", "uploadDate", "license", "file_path", "description", "metadata" FROM `model`;--> statement-breakpoint
DROP TABLE `model`;--> statement-breakpoint
ALTER TABLE `__new_model` RENAME TO `model`;--> statement-breakpoint
PRAGMA foreign_keys=ON;--> statement-breakpoint
CREATE UNIQUE INDEX `model_file_path_unique` ON `model` (`file_path`);