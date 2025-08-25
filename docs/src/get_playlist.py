import requests


def get_playlist_tracks(playlist_id):
    url = f"https://api.deezer.com/playlist/{playlist_id}"
    r = requests.get(url)
    data = r.json()
    print("* Playlist:", data["title"])
    print("Nombre de morceaux:", data["nb_tracks"])

    for track in data["tracks"]["data"]:
        print(f'{track["artist"]["name"]} - {track["title"]}')


playlist_list = ["14207897181", "14207947981", "14208023841"]

# Exemple avec une playlist publique
for playlist_id in playlist_list:
    get_playlist_tracks(playlist_id)