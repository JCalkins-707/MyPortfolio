from django.db import migrations
from website.models import Artist


def bulk_add_artists(apps, schema_editor):
    artists = [
        Artist(artist_id='AH001', artist_lname='Doe', artist_fname='John', artist_site='http://johndoe.com', artist_email='johndoe@example.com', artist_bio='A talented artist.', artist_phone=1234567890),
        Artist(artist_id='AH002', artist_lname='Smith', artist_fname='Jane', artist_site='http://janesmith.com', artist_email='janesmith@example.com', artist_bio='An experienced sculptor.', artist_phone=9876543210),
        # Add more artists as needed
    ]
    Artist.objects.bulk_create(artists)


class Migration(migrations.Migration):
    dependencies = [
        ('website', 'previous_migration_name'),
    ]

    operations = [
        migrations.RunPython(bulk_add_artists),
    ]
