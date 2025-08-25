import librosa
import librosa.display
import matplotlib.pyplot as plt
import matplotlib as mpl
import pretty_midi
import numpy as np
import music21 as m21

# === 1. Charger l'audio (.aif) ===
audio_file = "./data/satie.aif"
y, sr = librosa.load(audio_file, sr=None)  # sr=None = garder fréquence native

# === 2. Charger le MIDI (.mid) ===
midi_file = "./data/satie.mid"
pm = pretty_midi.PrettyMIDI(midi_file)

# ---------------------------
# A. Signal audio
# ---------------------------
plt.figure(figsize=(8, 6))
librosa.display.waveshow(y, sr=sr)
plt.xlabel("Temps (s)")
plt.ylabel("Amplitude")
plt.savefig("./img/time.png")
plt.tight_layout()

# ---------------------------
# B. Spectrogramme (log-mel)
# ---------------------------
plt.figure(figsize=(8, 6))
S = librosa.feature.melspectrogram(y=y, sr=sr, n_mels=1024, fmax=15000)
S_dB = librosa.power_to_db(S, ref=np.max)
librosa.display.specshow(S_dB, sr=sr, x_axis='time', y_axis='mel',
                         fmax=15000, cmap="magma")
plt.xlabel("Temps (s)")
plt.savefig("./img/spectrogram.png")
plt.tight_layout()

# ---------------------------
# C. Piano Roll (MIDI)
# ---------------------------
plt.figure(figsize=(8, 6))

fs = 100  # résolution temporelle (frames/seconde)
n_frames = int(len(y)/sr * fs)  # aligner avec durée audio
piano_roll = pm.get_piano_roll(fs=fs)[:, :n_frames]

# Transformer en masque (0 = pas de note → NaN)
piano_roll_masked = np.where(piano_roll > 0, piano_roll, np.nan)

# Créer une colormap rouge copiée où NaN devient transparent
cmap = plt.cm.Reds.copy()
cmap.set_bad(color=(1, 1, 1, 0))  # transparent

plt.imshow(piano_roll_masked[::-1], aspect='auto', cmap=cmap,
           interpolation='nearest',
           extent=[0, len(y)/sr, 0, 128])

plt.gca().set_facecolor("white")  # fond blanc (ou "black" si tu veux noir pur)
plt.xlabel("Temps (secondes)")
plt.ylabel("Notes MIDI")
plt.tight_layout()
plt.savefig("./img/piano_roll.png")
