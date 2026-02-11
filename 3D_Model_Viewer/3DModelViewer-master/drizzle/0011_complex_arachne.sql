CREATE TABLE `model_tag` (
	`model_id` integer NOT NULL,
	`tag_id` integer NOT NULL,
	FOREIGN KEY (`model_id`) REFERENCES `model`(`model_id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`tag_id`) REFERENCES `tag`(`tag_id`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `tag` (
	`tag_id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text(50) NOT NULL,
	`requires_approval` integer DEFAULT 0
);
--> statement-breakpoint
CREATE UNIQUE INDEX `tag_name_unique` ON `tag` (`name`);